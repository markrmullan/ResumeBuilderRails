```
mysql> desc users;
+------------------------+--------------+------+-----+---------+-------+
| Field                  | Type         | Null | Key | Default | Extra |
+------------------------+--------------+------+-----+---------+-------+
| uuid                   | varchar(36)  | NO   | PRI | NULL    |       |
| email                  | varchar(255) | NO   | UNI |         |       |
| encrypted_password     | varchar(255) | NO   |     |         |       |
| reset_password_token   | varchar(255) | YES  | UNI | NULL    |       |
| reset_password_sent_at | datetime     | YES  |     | NULL    |       |
| remember_created_at    | datetime     | YES  |     | NULL    |       |
| created_at             | datetime     | NO   |     | NULL    |       |
| updated_at             | datetime     | NO   |     | NULL    |       |
+------------------------+--------------+------+-----+---------+-------+
8 rows in set (0.03 sec)
```
