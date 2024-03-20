sudo apt update -y 

sudo apt install apache2 -y

sudo apt install ufw

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 'WWW'
sudo ufw allow ssh
sudo ufw allow 22
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 80

sudo ufw enable -y

# sudo ufw status

# sudo systemctl status apache2

sudo apt-get update
sudo apt-get install default-mysql-server -y

##################################
# commands to install drupal on vm

# install PHP components
sudo apt install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

sudo apt install php-{cli,fpm,json,common,mysql,zip,gd,intl,mbstring,curl,xml,pear,tidy,soap,bcmath,xmlrpc} -y
# download latest drupal version
sudo wget -O drupal.tar.gz https://www.drupal.org/download-latest/tar.gz 
# extract drupal.tar.gz
sudo mkdir /var/www/html/drupal
tar xvf drupal.tar.gz 
sudo mv drupal-*/* /var/www/html/drupal/
sudo mv drupal-*/.* /var/www/html/drupal/

sudo chown -R www-data:www-data /var/www/html/drupal
sudo chmod 755 /var/www/html/drupal

# create a new drupal.conf file to configure the site
# sudo touch /etc/apache2/sites-available/drupal.conf

# sudo chmod 733 /etc/apache2/sites-available/drupal.conf

# sudo echo -e 'Alias /drupal "/var/www/drupal/"\n<Directory /var/www/drupal/>\nAllowOverride All\n</Directory>' > /etc/apache2/sites-available/drupal.conf

# enable the drupal site and required PHP modules
sudo a2ensite drupal
sudo a2enmod rewrite

# restart apache2 service
sudo systemctl restart apache2


# 14  cat /etc/php/8.2/apache2/php.ini | grep "memory_limit" ==> memory_limit = 256M
