CREATE DATABASE site1_db;
CREATE USER 'site1_user'@'%' IDENTIFIED BY 'securepassword1';
GRANT ALL PRIVILEGES ON site1_db.* TO 'site1_user'@'%';

CREATE DATABASE site2_db;
CREATE USER 'site2_user'@'%' IDENTIFIED BY 'securepassword2';
GRANT ALL PRIVILEGES ON site2_db.* TO 'site2_user'@'%';
