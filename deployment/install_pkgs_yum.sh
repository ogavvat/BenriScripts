
#!/bin/sh

# Install git
yum install -y git


# Install Docker Engine
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker


# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install Bash Completion for Docker
yum install -y bash-completion
curl -L https://raw.githubusercontent.com/docker/compose/1.26.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose


# Install Azure CLI
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
yum install -y azure-cli

# Display messages
echo "If you would like to use Docker as a non-root user, you should now consider adding your user to the docker group with something like:"
echo "	usermod -aG docker your-user"

