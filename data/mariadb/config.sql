    flush privileges;
    create database wordpress;
    grant all privileges on wordpress.* to 'taeypark'@'%' identified by 'abcde';
    flush privileges;
