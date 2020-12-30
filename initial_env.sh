echo BEGIN
date '+%Y-%m-%d %H:%M:%S'
wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip
sudo yum install unzip -y
unzip terraform_0.14.3_linux_amd64.zip
sudo cp terraform /usr/local/bin/
sudo yum install python3 -y
pip3 install awscli
pip3 install ansible
mkdir deploy_iac_tf_ansible
wget https://raw.githubusercontent.com/linuxacademy/content-deploying-to-aws-ansible-terraform/master/aws_la_cloudplayground_version/ansible.cfg
cp ansible.cfg deploy_iac_tf_ansible/ansible.cfg
echo END