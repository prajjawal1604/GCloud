# update repositories and install any available software updates
sudo apt update -y
# sudo apt upgrade -y
# install Apache HTTPD and MySQL
sudo apt-get install apache2 mariadb-server mariadb-client curl -y
# install PHP components
sudo apt install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
# download latest joomla version
sudo wget -O joomla.tar.gz https://downloads.joomla.org/cms/joomla3/3-9-24/Joomla_3-9-24-Stable-Full_Package.tar.gz?format=gz
# extract joomla.tar.gz
sudo mkdir /var/www/joomla
sudo tar xzvf joomla.tar.gz --directory /var/www/joomla
# create a new joomla.conf file to configure the site
sudo touch /etc/apache2/sites-available/joomla.conf

sudo chmod 733 /etc/apache2/sites-available/joomla.conf

sudo echo -e 'Alias /joomla "/var/www/joomla/"\n<Directory /var/www/joomla/>\nAllowOverride All\n</Directory>' > /etc/apache2/sites-available/joomla.conf

# enable the Joomla site and required PHP modules
sudo a2ensite joomla
sudo a2enmod rewrite
# set the owner of the new joomla directory to www-data
sudo chown -R www-data:www-data /var/www/joomla
# restart apache2 service
sudo systemctl restart apache2