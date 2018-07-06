sudo docker run --restart=always                            \
       --name px-lighthouse -d                              \
       -p 80:80 -p 443:443                                  \
       -v /etc/pwxlh:/config -v /etc/pwxlh/certs:/certs     \
       portworx/px-lighthouse:1.4.0

mkdir wordpress && mkdir postgres
mv *wordpress*.yaml wordpress && mv wordpress*.sh wordpress
chmod a+x wordpress/*
mv postgres*.yaml postgres

echo -e "\nalias ls='ls -l --color=auto' \nPS1='\h:\w\\$ '" >> .bashrc && source ~/.profile

launch.sh

