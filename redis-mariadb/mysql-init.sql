SET NAMES utf8;

CREATE DATABASE mustbuy_dev DEFAULT CHARSET utf8;
GRANT ALL PRIVILEGES ON mustbuy_dev.* TO oro_dev@localhost IDENTIFIED BY 'EWTnFUmh';
GRANT ALL PRIVILEGES ON mustbuy_dev.* TO oro_dev@'%' IDENTIFIED BY 'EWTnFUmh';


CREATE DATABASE mustbuy_test DEFAULT CHARSET utf8;
GRANT ALL PRIVILEGES ON mustbuy_test.* TO oro_test@localhost IDENTIFIED BY 'RwozjmRb';
GRANT ALL PRIVILEGES ON mustbuy_test.* TO oro_test@'%' IDENTIFIED BY 'RwozjmRb';

FLUSH PRIVILEGES;