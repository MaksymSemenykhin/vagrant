#!/usr/bin/env bash
source /home/vagrant/provision/output.sh
source /home/vagrant/provision/functions.sh
source /home/vagrant/provision/config_read.sh

print_info "dockr:${main_software}"


print_title "Docker install"

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg-agent -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y


mkdir -p ~/.docker
mkdir -p /home/vagrant/.docker
rm  -rf ~/.docker
rm -rf /home/vagrant/.docker

mkdir -p ~/.docker
mkdir -p /home/vagrant/.docker

cat <<EOF | sudo tee -a ~/.docker/config.json
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "$proxy_http",
     "httpsProxy": "$proxy_https",
     "noProxy": "$no_proxy"
   }
 }
}
EOF

ln -s /root/.docker/config.json /home/vagrant/.docker/config.json
mkdir /etc/sysconfig/ -p
echo ''>/etc/sysconfig/docker
cat <<EOF | sudo tee -a /etc/sysconfig/docker
export http_proxy="$proxy_http"
export https_proxy="$proxy_https"
EOF

mkdir /etc/systemd/system/docker.service.d/ -p
echo '' > /etc/systemd/system/docker.service.d/http-proxy.conf;
cat <<EOT >> /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=$proxy_http"
Environment="HTTPS_PROXY=$proxy_https"
EOT
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo usermod -aG docker vagrant
