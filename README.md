#e-Store Application

This is a practical example on PHP5.6 and MySQL 5.7 Course. The eStore is a web-based application that's purpose is to manage a products store and the daily transactions on it. If you are not familiar with the coding style in this project please visit the course at https://www.youtube.com/playlist?list=PLrwRNJX9gLs3kkSDgCHFlpgL6qLrlHUBG for more information.
# To use Estor web app
1- create databases 
##### use this commend in sql terminal
	CREATE DATABASE IF NOT EXISTS storedb CHARACTER SET = utf8 COLLATE utf8_general_ci; 

2- create virtual host
##### Add to hosts file 
		127.0.0.1 www.estore.net

##### add tofile  httpd.conf
````
<VirtualHost 127.0.0.1:80>
    DocumentRoot "/opt/lampp/htdocs/estore/public/"
    ServerName estore.net
    ServerAlias www.estore.net
    <Directory "/opt/lampp/htdocs/estore/public">
    AllowOverride All
    Order allow,deny
    Allow from all
    </Directory>
</VirtualHost>
````
and restart xampp server
