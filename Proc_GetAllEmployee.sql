DROP PROCEDURE IF EXISTS Proc_GetAllEmployee;
CREATE PROCEDURE Proc_GetAllEmployee (IN $OrganizationID varchar(36))
SQL SECURITY INVOKER
BEGIN
   
   DROP TEMPORARY TABLE IF EXISTS tempOrgan;
   CREATE TEMPORARY TABLE tempOrgan
   SELECT * FROM organization o WHERE ID = $OrganizationID;

   DROP TEMPORARY TABLE IF EXISTS tempEmployee;
   CREATE TEMPORARY TABLE tempEmployee
   SELECT * FROM employee e WHERE e.OrganizationID = $OrganizationID;

   SELECT e.FullName, e.EmployeeCode, e.EmployeeName, o.OrgCode, o.OrgName 
   FROM employee e 
   INNER JOIN tempOrgan o ON OrganizationID = o.ID
   WHERE e.FullName LIKE '%demo%';

END ;

