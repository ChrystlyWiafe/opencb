﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Windows.Forms;
using OpenCBS.ArchitectureV2.Interface;
using OpenCBS.CoreDomain;
using OpenCBS.Manager;

namespace OpenCBS.ArchitectureV2.Startup
{
    internal class UpdatePasswordProcess : IStartupProcess
    {
        private Dictionary<int, string> passwords;

        public UpdatePasswordProcess()
        {
            passwords = new Dictionary<int, string>();
        }
        public bool IsOldAuthetification()
        {
            const string q = @" SELECT count(*) field_exists
                                FROM sys.columns 
                                WHERE  object_id = OBJECT_ID(N'[dbo].[Users]') 
                                AND name = 'user_pass' ";

            using (SqlConnection conn = DatabaseConnection.GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            {
                using (OpenCbsReader r = c.ExecuteReader())
                {
                    while (r.Read())
                        return r.GetInt("field_exists") > 0;
                }
            }
            return false;
        }

        public List<User> SelectAllUsers()
        {
            const string q = @"SELECT 
                                 id, 
                                 deleted, 
                                 user_name, 
                                 first_name,
                                 last_name, 
                                 user_pass,
                                 mail, 
                                 sex,
                                 phone, 
                                (SELECT COUNT(*)
                                 FROM dbo.Credit 
                                 WHERE loanofficer_id = u.id) AS num_contracts
                             FROM dbo.Users AS u";

            List<User> users = new List<User>();
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            using (OpenCbsReader r = c.ExecuteReader())
            {
                if (r.Empty) return users;

                while (r.Read())
                {
                    User u = new User
                    {
                        Id = r.GetInt("id"),
                        FirstName = r.GetString("first_name"),
                        LastName = r.GetString("last_name"),
                        IsDeleted = r.GetBool("deleted"),
                        UserName = r.GetString("user_name"),
                        Mail = r.GetString("mail"),
                        Sex = r.GetChar("sex"),
                        HasContract = r.GetInt("num_contracts") > 0
                    };
                    users.Add(u);
                }
            }
            return users;
        }


        public User SelectUser(int pUserId, bool pIncludeDeletedUser, SqlTransaction tx = null)
        {
            const string selectUser = @"SELECT [Users].[id] as user_id, 
                                                   [user_name], 
                                                   [user_pass], 
                                                   [role_code], 
                                                   [first_name], 
                                                   [last_name], 
                                                   [mail],
                                                   [sex],
                                                   [phone],
                                                   [Users].[deleted], 
                                                   [Roles].[id] as role_id, 
                                                   [Roles].[code] AS role_name,
                                                   (SELECT COUNT(a.id) 
                                                   FROM  (SELECT Credit.id, loanofficer_id 
                                                          FROM Credit 
                                                          GROUP BY  Credit.id, loanofficer_id ) a 
                                                   WHERE a.loanofficer_id = Users.id) AS contract_count 
                                            FROM [Users] INNER JOIN UserRole on UserRole.user_id = Users.id
                                            INNER JOIN Roles ON Roles.id = UserRole.role_id
                                            WHERE 1 = 1 ";

            var sqlText = selectUser + @" AND [Users].[id] = @id ";

            if (!pIncludeDeletedUser)
                sqlText += @" AND [Users].[deleted] = 0";

            sqlText += @" GROUP BY [Users].[id],
                                   [Users].[deleted],
                                   [user_name],
                                   [user_pass],
                                   [role_code],
                                   [first_name],
                                   [last_name],
                                   [mail],                                   
                                   [sex],
                                   [phone],                                   
                                   [Roles].id, 
                                   [Roles].code
                                    ";

            if (tx != null)
            {
                var conn = tx.Connection;
                var sqlCommand = new OpenCbsCommand(sqlText, conn, tx);
                sqlCommand.AddParam("@id", pUserId);
                var reader = sqlCommand.ExecuteReader();
                if (reader != null)
                {
                    if (!reader.Empty)
                    {
                        reader.Read();
                        return _GetUser(reader);
                    }
                }
                return null;
            }

            using (var conn = DatabaseConnection.GetConnection())
            using (var sqlCommand = new OpenCbsCommand(sqlText, conn))
            {
                sqlCommand.AddParam("@id", pUserId);
                using (var reader = sqlCommand.ExecuteReader())
                {
                    if (reader != null)
                    {
                        if (!reader.Empty)
                        {
                            reader.Read();
                            return _GetUser(reader);
                        }
                    }
                }
                return null;
            }
        }

        private User _GetUser(OpenCbsReader pReader)
        {
            User user = new User
            {
                Id = pReader.GetInt("user_id"),
                UserName = pReader.GetString("user_name"),
                FirstName = pReader.GetString("first_name"),
                LastName = pReader.GetString("last_name"),
                Mail = pReader.GetString("mail"),
                IsDeleted = pReader.GetBool("deleted"),
                HasContract = (pReader.GetInt("contract_count") != 0),
                Sex = pReader.GetChar("sex"),
                Phone = pReader.GetString("phone")
            };
            passwords.Add(user.Id, pReader.GetString("user_pass"));
            user.SetRole(pReader.GetString("role_code"));

            user.UserRole = new Role
            {
                RoleName = pReader.GetString("role_name"),
                Id = pReader.GetInt("role_id")
            };

            return user;
        }
        
        public void Run()
        {
            if (IsOldAuthetification())
            {
                using (SqlConnection conn = DatabaseConnection.GetConnection())
                {
                    if (MessageBox.Show("Will you update authetification system?", "", MessageBoxButtons.YesNo) ==
                        DialogResult.Yes)
                    {
                        var userManager = new UserManager(User.CurrentUser);

                        const string q1 = @"
                    IF NOT EXISTS ( SELECT * FROM sys.columns WHERE  object_id = OBJECT_ID(N'[dbo].[Users]') AND name = 'password_hash' )
                    BEGIN
                        ALTER TABLE dbo.Users ADD [password_hash] nvarchar(4000) null
                    END
                                    ";

                        const string q2 = @"
                    IF EXISTS ( SELECT * FROM sys.columns WHERE  object_id = OBJECT_ID(N'[dbo].[Users]') AND name = 'user_pass' )
                    BEGIN
                        ALTER TABLE dbo.Users DROP CONSTRAINT IX_Users_username_pwd
                        ALTER TABLE dbo.Users DROP COLUMN user_pass
                    END
                                    ";

                    const string q3 = @"
                        ALTER FUNCTION [dbo].[GetSubordinates](@id_user INT)
                        RETURNS TABLE
                        AS RETURN
                        (
                         SELECT  *, 
                            (SELECT COUNT(*)
	                        FROM dbo.Credit 
	                        WHERE loanofficer_id = u.id) AS num_contracts
                         FROM  dbo.users u LEFT JOIN dbo.UsersSubordinates us  ON u.id = us.subordinate_id
                         WHERE us.user_id  = @id_user AND u.deleted =0 
                        )
                    ";


                        var users = SelectAllUsers();
                        var newUsers = new List<User>();

                        foreach (var user in users)
                        {
                            var newUser = SelectUser(user.Id, true);
                            newUser.PasswordHash = PasswordEncoder.GeneratePasswordHash(passwords[newUser.Id]);
                            newUsers.Add(newUser);
                        }

                        using (var connection = userManager.GetConnection())
                        using (var transaction = connection.BeginTransaction())
                        {
                            try
                            {

                                using (OpenCbsCommand sqlCommand = new OpenCbsCommand(q1, conn))
                                {
                                    sqlCommand.ExecuteNonQuery();
                                }
                                using (OpenCbsCommand sqlCommand = new OpenCbsCommand(q2, conn))
                                {
                                    sqlCommand.ExecuteNonQuery();
                                }
                                using (OpenCbsCommand sqlCommand = new OpenCbsCommand(q3, conn))
                                {
                                    sqlCommand.ExecuteNonQuery();
                                }


                                foreach (var user in newUsers)
                                {
                                    userManager.UpdateUser(user,transaction);
                                }
                                transaction.Commit();
                            }
                            catch (Exception error)
                            {
                                transaction.Rollback();
                                throw new Exception(error.Message);
                            }
                            
                        }
                    }
                    else
                    {
                        Process.GetCurrentProcess().Kill();
                    }
                }

            }
        }
    }
}

