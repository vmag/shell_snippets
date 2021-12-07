
restart_agent: stop_agent, start_agent
install_top:
        dnf install epel-release -y
        dnf update -y
        dnf install vim htop atop mc -y

install_kernel:
        dnf install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
        dnf --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers -y
        grub2-mkconfig -o /boot/grub2/grub.cfg

install_docker:
        yum install -y yum-utils
        yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        yum install -y docker-ce docker-ce-cli containerd.io
        systemctl enable --now docker
start_agent:
        docker run --network="host" --restart=on-failure:10 \
                --cap-add=NET_ADMIN \
                --cap-add=SYS_MODULE \
                -v /var/run/docker.sock:/var/run/docker.sock:ro \
                -v /run:/run \
                --device /dev/net/tun:/dev/net/tun --name=syntropy-agent \
                -e SYNTROPY_NETWORK_API='docker' \
                -e SYNTROPY_CONTROLLER_URL=controller-sandbox-platform-agents.syntropystack.com \
                -e SYNTROPY_AGENT_TOKEN=repleace_me -d syntropynet/agent:beta
stop_agent:
        docker stop syntropy-agent
        docker rm syntropy-agent
