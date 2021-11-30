yum install -y yum-utils \
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo \
yum install docker-ce docker-ce-cli containerd.io \
systemctl enable --now docker
