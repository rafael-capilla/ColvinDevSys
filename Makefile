# Install
#make
#Docker
#Docker Compose
#Git
#git-crypt

install-all: install-aws-cli install-make install-gcloud install-kubectl install-helm install-helm-secrets install-sops install-k9s


# INSTALL AWS CLI
install-aws-cli:
	sudo apt update
	sudo apt -y install software-properties-common
	sudo apt -y install python3.8
	sudo apt -y install python3-pip
	pip install awscli

# INSTALL MAKE
install-make:
	sudo apt -y install make

# INSTALL GCLOUD
install-gcloud:
	sudo apt -y install curl
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add -
	sudo apt-get update -y
	sudo apt-get install google-cloud-sdk -y

# INSTALL KUBECTL
install-kubectl:
	sudo apt-get install kubectl

# INSTALL HELM
install-helm:
	curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
	sudo apt-get install apt-transport-https --yes
	echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
	sudo apt-get update
	sudo apt-get install helm

# INSTALL HELM SECRETS
install-helm-secrets:
	sudo apt -y install git
	helm plugin install https://github.com/jkroepke/helm-secrets --version v3.6.1

# INSTALL SOPS
install-sops:
	curl -L https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb --output sops.deb
	sudo dpkg -i sops.deb
	sudo rm sops.deb

# INSTALL K9S
install-k9s:
	mkdir k9s
	curl -L https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz --output k9s/k9s.tar.tz
	sudo tar -xvf k9s/k9s.tar.tz -C k9s
	sudo mv k9s/k9s /usr/local/bin
	sudo rm -r k9s

# INSTALL STERN
#apt -y install golang-go
#mkdir -p $GOPATH/src/github.com/wercker
#cd $GOPATH/src/github.com/wercker
#git clone https://github.com/wercker/stern.git && cd stern
#govendor sync
#go install
