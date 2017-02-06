// Octopus MFS is an integrated suite for managing a Micro Finance Institution: 
// clients, contracts, accounting, reporting and risk
// Copyright © 2006,2007 OCTO Technology & OXUS Development Network
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
// Website: http://www.opencbs.com
// Contact: contact@opencbs.com

using System;
using System.Collections.Generic;
using System.Data;
using OpenCBS.CoreDomain;
using System.Data.SqlClient;
using System.Linq;
using Dapper;
using OpenCBS.CoreDomain.Accounting;
using OpenCBS.CoreDomain.Accounting.Model;

namespace OpenCBS.Manager
{
    public class PaymentMethodManager : Manager
    {
        private static List<PaymentMethod> _cacheWithBranch;
        private static List<PaymentMethod> _cacheWithoutBranch;
        private readonly BranchManager _branchManager;

        public PaymentMethodManager(User user) : base(user)
        {
            _branchManager = new BranchManager(user);
            InitCache();
        }

        public PaymentMethodManager(string testDb) : base(testDb)
        {
            _branchManager = new BranchManager(testDb);
            InitCache();
        }

        public PaymentMethodManager(string testDb, User user) : base(testDb)
        {
            InitCache();
        }

        private void InitCache()
        {
            if (_cacheWithBranch == null)
                _cacheWithBranch = GetPaymentMethodOfBranch();
            if (_cacheWithoutBranch == null)
                _cacheWithoutBranch = GetPaymentMethodsWithoutBranch();
        }

        public List<PaymentMethod> SelectPaymentMethods()
        {
            return _cacheWithoutBranch;
        }

        public void RefreshCache(IDbTransaction transaction=null)
        {
            _cacheWithBranch = GetPaymentMethodOfBranch(transaction);
            _cacheWithoutBranch = GetPaymentMethodsWithoutBranch(transaction);
        }

        public void RefreshCacheNew(IDbTransaction transaction = null)
        {
            _cacheWithBranch = GetPaymentMethodOfBranchNew(transaction);
            _cacheWithoutBranch = GetPaymentMethodsWithoutBranchNew(transaction);
        }

        public List<PaymentMethod> GetPaymentMethodsWithoutBranch(IDbTransaction transaction = null)
        {
            string q = @"SELECT pm.[id]
                                  ,[name]
                                  ,[description]
                                  ,[pending]
                                  ,[accountNumber]
                            FROM [PaymentMethods] pm
                            ORDER BY pm.[id]";

            List<PaymentMethod> paymentMethods = new List<PaymentMethod>();

            using (SqlConnection conn = transaction != null ? (SqlConnection) transaction.Connection : GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            using (OpenCbsReader r = c.ExecuteReader())
            {
                if (r != null && !r.Empty)
                    while (r.Read())
                    {
                        PaymentMethod paymentMethod = new PaymentMethod
                        {
                            Id = r.GetInt("id"),
                            Name = r.GetString("name"),
                            Description = r.GetString("description"),
                            IsPending = r.GetBool("pending"),
                            AccountNumber = r.GetString("accountNumber"),
                        };
                        paymentMethods.Add(paymentMethod);
                    }
            }
            return paymentMethods;
        }

        public List<PaymentMethod> GetPaymentMethodsWithoutBranchNew(IDbTransaction transaction)
        {
            string q = @"SELECT pm.[id] Id
                                  ,[name] Name
                                  ,[description] Description
                                  ,[pending] Pending
                                  ,[accountnumber] AccountNumber
                            FROM [PaymentMethods] pm
                            ORDER BY pm.[id]";

                return transaction.Connection.Query<PaymentMethod>(q,null,transaction).ToList();
        }

        public List<PaymentMethod> GetPaymentMethodOfBranchNew(IDbTransaction transaction )
        {
            string q = @"SELECT [lbpm].[payment_method_id] Id, 
                                [lbpm].[id] LinkId, 
                                [pm].[name] Name, 
                                [pm].[description] Description, 
                                [pm].[pending] IsPending,
                                [pm].[accountNumber] AccountNumber,
                                [lbpm].[branch_id], 
                                [lbpm].[date] Date,
                                [b].[id] Id,
                                [b].[name] Name,
                                [b].[deleted] Deleted,
                                [b].[address] Address,
                                [b].[description] Description
                         FROM PaymentMethods pm
                         INNER JOIN LinkBranchesPaymentMethods lbpm ON lbpm.payment_method_id = pm.id
                         INNER JOIN Branches b ON b.Id = lbpm.branch_id
                         WHERE [lbpm].[deleted] = 0";
            List<PaymentMethod> paymentMethods = new List<PaymentMethod>();

            paymentMethods.AddRange(transaction.Connection.Query<PaymentMethod, Branch, PaymentMethod>(q, (pay, br) =>
            {
                pay.Branch = br;
                return pay;
            }, null, transaction).ToList());
            
            return paymentMethods;
        }

        public List<PaymentMethod> SelectPaymentMethodsForClosure()
        {
            return _cacheWithBranch;
        }

        public List<PaymentMethod> GetPaymentMethodOfBranch(IDbTransaction transaction = null)
        {
            string q = @"SELECT [lbpm].[payment_method_id], 
                                [lbpm].[id], 
                                [pm].[name], 
                                [pm].[description], 
                                [pm].[pending], 
                                [pm].[accountNumber],
                                [lbpm].[branch_id], 
                                [lbpm].[date]
                         FROM PaymentMethods pm
                         INNER JOIN LinkBranchesPaymentMethods lbpm ON lbpm.payment_method_id = pm.id
                         WHERE [lbpm].[deleted] = 0";

            List<PaymentMethod> paymentMethods = new List<PaymentMethod>();

            using (SqlConnection conn = transaction != null ? (SqlConnection) transaction.Connection : GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            {
                //c.AddParam("@id", branchId);
                using (OpenCbsReader r = c.ExecuteReader())
                {
                    if (r.Empty) return paymentMethods;
                    while (r.Read())
                    {
                        PaymentMethod paymentMethod = new PaymentMethod
                        {
                            Id = r.GetInt("payment_method_id"),
                            Name = r.GetString("name"),
                            Description = r.GetString("description"),
                            IsPending = r.GetBool("pending"),
                            LinkId = r.GetInt("id"),
                            Branch = _branchManager.Select(r.GetInt("branch_id")),
                            Date = r.GetDateTime("date"),
                            AccountNumber = r.GetString("accountNumber")
                        };
                        paymentMethods.Add(paymentMethod);
                    }
                }
            }
            return paymentMethods;
        }

        public List<PaymentMethod> SelectPaymentMethodOfBranch(int branchId)
        {
            return _cacheWithBranch.Where(val => val.Branch.Id == branchId).ToList();
        }

        public PaymentMethod SelectPaymentMethodById(int paymentMethodId)
        {
            return _cacheWithoutBranch.Find(pm2 => pm2.Id == paymentMethodId);
        }

        public PaymentMethod SelectPaymentMethodByName(string name)
        {
            return _cacheWithoutBranch.FirstOrDefault(val => val.Name == name);
        }

        public bool ExistsLinkBranchesPaymentMethods(PaymentMethod paymentMethod)
        {
            const string q =
                @"select top 1 isnull(branch_id,0) id
                      from dbo.LinkBranchesPaymentMethods
                      where branch_id=@branch_id 
                          and payment_method_id=@payment_method_id
                          and deleted=0";
            using (SqlConnection conn = GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            {
                c.AddParam("@branch_id", paymentMethod.Branch.Id);
                c.AddParam("@payment_method_id", paymentMethod.Id);
                using (OpenCbsReader r = c.ExecuteReader())
                {
                    if (r != null && !r.Empty && r.Read())
                    {
                        return r.GetInt("id") != 0;
                    }

                }
            }
            return false;
        }

        public void AddPaymentMethodToBranch(PaymentMethod paymentMethod)
        {
            const string q =
                @"INSERT INTO LinkBranchesPaymentMethods (branch_id, payment_method_id)
                                            VALUES (@branch_id, @payment_method_id)";
            using (SqlConnection conn = GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            {
                c.AddParam("@branch_id", paymentMethod.Branch.Id);
                c.AddParam("@payment_method_id", paymentMethod.Id);
                c.ExecuteNonQuery();
                RefreshCache();
            }
        }

        public void DeletePaymentMethodFromBranch(PaymentMethod paymentMethod)
        {
            const string q =
                @"UPDATE LinkBranchesPaymentMethods SET deleted = 1
                                     WHERE id = @link_id";

            using (SqlConnection conn = GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            {
                c.AddParam("@link_id", paymentMethod.LinkId);
                c.ExecuteNonQuery();
                RefreshCache();
            }
        }

        public void UpdatePaymentMethodFromBranch(PaymentMethod paymentMethod)
        {
            const string q =
                @"UPDATE LinkBranchesPaymentMethods SET payment_method_id = @payment_method_id
                                    WHERE id = @id";

            using (SqlConnection conn = GetConnection())
            using (OpenCbsCommand c = new OpenCbsCommand(q, conn))
            {
                c.AddParam("@payment_method_id", paymentMethod.Id);
                c.AddParam("@id", paymentMethod.LinkId);
                c.ExecuteNonQuery();
                RefreshCache();
            }
        }

        public void Save(PaymentMethod paymentMethod, IDbTransaction transaction)
        {
            const string query = @"INSERT INTO dbo.PaymentMethods 
                                        (name 
                                        , description
                                        , accountNumber)
                                   VALUES
                                       (@Name
                                        , @Description
                                        , @AccountNumber)";

            transaction.Connection.Execute(query,
                                           new
                                           {
                                               paymentMethod.Name,
                                               paymentMethod.Description,
                                               AccountNumber = paymentMethod.Account != null ? paymentMethod.Account.AccountNumber : ""
                                           },
                                           transaction);
            RefreshCacheNew(transaction);
        }

        public void Update(PaymentMethod paymentMethod, IDbTransaction transaction)
        {
            const string query = @"UPDATE
                                        dbo.PaymentMethods 
                                   set
                                        name = @Name, 
                                        description = @Description,
                                        accountNumber = @AccountNumber
                                   where
                                        id = @Id";

            transaction.Connection.Execute(query, new
            {
                paymentMethod.Name,
                paymentMethod.Description,
                AccountNumber = paymentMethod.Account != null ? paymentMethod.Account.AccountNumber : "",
                paymentMethod.Id
            }, transaction);
            RefreshCacheNew(transaction);
        }


        public List<PaymentMethod> GetAllNonCashsPaymentMethods(IDbTransaction transaction)
        {
            const string query = @"SELECT pm.[id]
                                  ,[name] Name
                                  ,[description] Description
                                  ,[pending] IsPending
                                  ,[accountNumber] AccountNumber
                            FROM [PaymentMethods] pm
                            ORDER BY pm.[id]";
            
            var result = transaction.Connection.Query<PaymentMethod>(query, null, transaction).ToList();
            return result;
        }
    }
}
