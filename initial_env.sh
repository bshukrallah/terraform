echo BEGIN
date '+%Y-%m-%d %H:%M:%S'
wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip
sudo yum install unzip -y
unzip terraform_0.14.3_linux_amd64.zip
sudo cp terraform /usr/local/bin/
sudo yum install python3 -y
pip3 install awscli --user
pip3 install ansible --user
pip3 install boto3 --user

mkdir deploy_iac_tf_ansible
mkdir deploy_iac_tf_ansible/ansible_templates
mkdir deploy_iac_tf_ansible/ansible_templates/inventory_aws/
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/ansible.cfg
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/providers.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/networks.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/variables.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/security_groups.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/outputs.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/instances.tf
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/ansible_templates/jenkins-master-sample.yml
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/ansible_templates/jenkins-worker-sample.yml
wget https://raw.githubusercontent.com/bshukrallah/terraform/master/ansible_templates/inventory_aws/tf_aws_ec2.yml
mv ansible.cfg deploy_iac_tf_ansible/ansible.cfg
mv providers.tf deploy_iac_tf_ansible/providers.tf
mv networks.tf deploy_iac_tf_ansible/networks.tf
mv variables.tf deploy_iac_tf_ansible/variables.tf
mv security_groups.tf deploy_iac_tf_ansible/security_groups.tf
mv instances.tf deploy_iac_tf_ansible/instances.tf
mv outputs.tf deploy_iac_tf_ansible/outputs.tf
mv jenkins-master-sample.yml deploy_iac_tf_ansible/ansible_templates/jenkins-master-sample.yml
mv jenkins-worker-sample.yml deploy_iac_tf_ansible/ansible_templates/jenkins-worker-sample.yml
mv tf_aws_ec2.yml deploy_iac_tf_ansible/ansible_templates/inventory_aws/tf_aws_ec2.yml



echo "Generating Key for AWS Instances"

ssh-keygen -t rsa -f ~/.ssh/id_rsa -N '' <<<y
echo "This will now configure AWS"

aws configure

echo "this will now initialize terraform"

cd deploy_iac_tf_ansible
terraform init
terraform apply
echo END