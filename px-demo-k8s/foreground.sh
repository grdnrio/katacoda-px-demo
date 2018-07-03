sudo docker run --restart=always                            \
       --name px-lighthouse -d                              \
       -p 80:80 -p 443:443                                  \
       -v /etc/pwxlh:/config -v /etc/pwxlh/certs:/certs     \
       portworx/px-lighthouse:1.4.0-rc1

mkdir wordpress && mkdir postgres
mv wordpress*.yaml wordpress && mv wordpress*.sh wordpress
my postgres*.yaml postgres

launch.sh

