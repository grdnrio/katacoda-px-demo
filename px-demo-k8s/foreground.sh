sudo docker run --restart=always                            \
       --name px-lighthouse -d                              \
       -p 80:80 -p 443:443                                  \
       -v /etc/pwxlh:/config -v /etc/pwxlh/certs:/certs     \
       portworx/px-lighthouse:1.4.0

mkdir wordpress && mkdir postgres
mv *wordpress*.* wordpress
chmod a+x wordpress/*
mv postgres*.* postgres

echo -e "\n alias k='kubectl' \nalias ls='ls -l --color=auto' \nPS1='\h:\w\\$ '" >> .bashrc && source ~/.profile

curl -L -s -o px-spec.yaml "http://install.portworx.com/1.4/?c=px-demo-14f79fe5-ecbc-4271-af4d-36c25c9c98c8&k=etcd://master:4001&kbver=1.10.0&s=/dev/vdb&st=k8s&stork=true"

clear

launch.sh

