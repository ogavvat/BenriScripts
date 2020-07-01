
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
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


# Display messages
echo "If you would like to use Docker as a non-root user, you should now consider adding your user to the docker group with something like:"
echo "	usermod -aG docker your-user"

