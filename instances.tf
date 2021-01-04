#Get Linux AMI ID using SSM Parameter endpoint in us-east-1
data "aws_ssm_parameter" "linuxAmi" {
    provider = aws.region-master
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "aws_ssm_parameter" "linuxAmiOregon" {
    provider = aws.region-worker
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Create Key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "master-key" {
    provider = aws.region-master
    key_name = "jenkins"
    public_key = file("~/.ssh/id_rsa.pub")
}

#Create Key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "worker-key" {
    provider = aws.region-worker
    key_name = "jenkins"
    public_key = file("~/.ssh/id_rsa.pub")
}
