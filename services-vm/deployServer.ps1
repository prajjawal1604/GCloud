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

# commands to install joomla on vm

# 1  sudo apt-get install php libapache2-mod-php -y

sudo apt install ca-certificates apt-transport-https software-properties-common --priority

# 2  sudo apt-get install unzip  
# 3  mkdir tmp  
# 4  cd /tmp/
# 5  wget -O https://downloads.joomla.org/cms/joomla5/5-0-3/Joomla_5-0-3-Stable-Full_Package.zip?format=zip > joomla.zip
# 6  sudo mkdir /var/www/html/joomla  
# 7  sudo unzip joomla.zip  -d /var/www/html/joomla  

# 16  sudo cp /var/www/html/joomla/htaccess.txt /var/www/html/joomla/.htaccess  
# 17  sudo chown -R www-data.www-data /var/www/html/joomla  
# 18  sudo chown -R www-data:www-data /var/www/html/joomla  
# 19  sudo chmod -R 755 /var/www/html/joomla

# 21  sudo systemctl restart apache2  
# 22  sudo systemctl status apache2 



# gcloud compute networks create vnet-testing --project=gcp-terraform-414508 --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional && gcloud compute networks subnets create vm-application-subnet --project=gcp-terraform-414508 --range=10.0.10.0/24 --stack-type=IPV4_ONLY --network=vnet-testing --region=asia-south2 --enable-private-ip-google-access && gcloud compute networks subnets create db-subnet --project=gcp-terraform-414508 --range=10.0.20.0/24 --stack-type=IPV4_ONLY --network=vnet-testing --region=asia-south2 --enable-private-ip-google-access && gcloud compute firewall-rules create allow-custom --project=gcp-terraform-414508 --network=projects/gcp-terraform-414508/global/networks/vnet-testing --description=Allows\ connection\ from\ any\ source\ to\ any\ instance\ on\ the\ network\ using\ custom\ protocols. --direction=INGRESS --priority=65534 --source-ranges=10.0.10.0/24,10.0.20.0/24 --action=ALLOW --rules=all && gcloud compute firewall-rules create allow-icmp --project=gcp-terraform-414508 --network=projects/gcp-terraform-414508/global/networks/vnet-testing --description=Allows\ ICMP\ connections\ from\ any\ source\ to\ any\ instance\ on\ the\ network. --direction=INGRESS --priority=65534 --source-ranges=0.0.0.0/0 --action=ALLOW --rules=icmp && gcloud compute firewall-rules create allow-rdp --project=gcp-terraform-414508 --network=projects/gcp-terraform-414508/global/networks/vnet-testing --description=Allows\ RDP\ connections\ from\ any\ source\ to\ any\ instance\ on\ the\ network\ using\ port\ 3389. --direction=INGRESS --priority=65534 --source-ranges=0.0.0.0/0 --action=ALLOW --rules=tcp:3389 && gcloud compute firewall-rules create allow-ssh --project=gcp-terraform-414508 --network=projects/gcp-terraform-414508/global/networks/vnet-testing --description=Allows\ TCP\ connections\ from\ any\ source\ to\ any\ instance\ on\ the\ network\ using\ port\ 22. --direction=INGRESS --priority=65534 --source-ranges=0.0.0.0/0 --action=ALLOW --rules=tcp:22