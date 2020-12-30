echo BEGIN
date '+%Y-%m-%d %H:%M:%S'
wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip
sudo yum install unzip -y
unzip terraform_0.14.3_linux_amd64.zip
sudo cp terraform /usr/local/bin/
sudo yum install python3 -y
pip3 install awscli --user
pip3 install ansible --user
mkdir deploy_iac_tf_ansible
wget https://raw.githubusercontent.com/linuxacademy/content-deploying-to-aws-ansible-terraform/master/aws_la_cloudplayground_version/ansible.cfg
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/providers.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/networks.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/variables.tf
mv ansible.cfg deploy_iac_tf_ansible/ansible.cfg
mv providers.tf deploy_iac_tf_ansible/providers.tf
mv networks.tf deploy_iac_tf_ansible/networks.tf
mv variables.tf deploy_iac_tf_ansible/variables.tf

echo "This will now configure AWS (y/n)"

aws configure

echo "this will now initialize terraform"

cd deploy_iac_tf_ansible
terraform init
terraform apply
echo END