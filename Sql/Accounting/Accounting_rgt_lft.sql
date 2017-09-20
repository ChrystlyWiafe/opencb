-----------------------------------------------------------------------------------------
DECLARE @Tree TABLE 
(
    child varchar(32) NOT NULL
    , parent varchar(32)
)

INSERT INTO @Tree
SELECT '0', NULL

INSERT INTO @Tree
SELECT account_number, isnull(parent,'0')
FROM Accounts


DECLARE @Stack TABLE
(
    stack_top INT NOT NULL
    , child varchar(32) NOT NULL
    , lft INT
    , rgt INT
)

DECLARE @lft_rgt INT 
    , @stack_pointer INT
    , @max_lft_rgt INT
    
SET @max_lft_rgt = 2 * (SELECT COUNT(*) FROM @Tree)
INSERT INTO @Stack SELECT 1, child, 1, @max_lft_rgt 
FROM @Tree 
WHERE parent IS NULL

SET @lft_rgt = 2
SET @Stack_pointer = 1
DELETE FROM @Tree WHERE parent IS NULL


WHILE (@lft_rgt < @max_lft_rgt) 
BEGIN 
    IF EXISTS (SELECT * FROM @Stack AS S1, @Tree AS T1 WHERE S1.child = T1.parent AND S1.stack_top = @stack_pointer) 
    BEGIN 
        INSERT INTO @Stack 
        SELECT (@stack_pointer + 1), MIN(T1.child), @lft_rgt, NULL 
        FROM @Stack AS S1, @Tree AS T1 WHERE S1.child = T1.parent AND S1.stack_top = @stack_pointer;
        

        DELETE FROM @Tree WHERE child = (SELECT child FROM @Stack WHERE stack_top = @stack_pointer + 1)
        SET @stack_pointer = @stack_pointer + 1
    END 
    ELSE 
    BEGIN
        UPDATE @Stack SET rgt = @lft_rgt, stack_top = -stack_top 
        WHERE stack_top = @stack_pointer
        
        SET @stack_pointer = @stack_pointer - 1
    END
    SET @lft_rgt = @lft_rgt + 1
END

DELETE FROM @Stack WHERE child is null
UPDATE @Stack SET lft = lft - 1, rgt = rgt - 1

UPDATE coa
SET coa.lft = s.lft, coa.rgt = s.rgt
FROM Accounts coa
LEFT JOIN @Stack s ON s.child = coa.account_number
go
----------------------------------UPDATE Chart of Accounts--------------------------------------
