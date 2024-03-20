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

##################################
# commands to install joomla on vm

# install PHP components
sudo apt install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
# download latest joomla version
sudo wget -O joomla.tar.gz https://downloads.joomla.org/cms/joomla5/5-0-3/Joomla_5-0-3-Stable-Full_Package.tar.gz?format=gz
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
