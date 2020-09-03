
#!/bin/sh

# Install git
apt install -y git


# Install Docker Engine
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io

systemctl start docker


# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install Bash Completion for Docker
apt install -y bash-completion
curl -L https://raw.githubusercontent.com/docker/compose/1.26.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
 
 
# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | bash
apt-get update
apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
  gpg --dearmor |
tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
  tee /etc/apt/sources.list.d/azure-cli.list
apt-get update
apt-get install -y azure-cli

# Display messages
echo "If you would like to use Docker as a non-root user, you should now consider adding your user to the docker group with something like:"
echo "	usermod -aG docker your-user"

