# Solve and Practice SQL Queries 

### MySQL Related Resources:

#### Upgrading
 https://dev.mysql.com/doc/mysql-windows-excerpt/8.0/en/windows-upgrading.html#windows-upgrading-zip-distribution

#### To run a SQL script using Powershell
> mysql -u<username> -p<password> < file.sql

#### DUMP all database
> mysqldump --all-databases > dump.sql

#### STOP MySQL service 
> SC STOP mysqld_service_name

#### START MySQL service 
> SC START mysqld_service_name