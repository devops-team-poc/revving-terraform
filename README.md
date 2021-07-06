# revving-terraform
create various modules of different AWS services
1) First create vpc, public, two private subnet, route table and IGW .
2) create security group for frontend,backend,postgres and elasticache.
3) create frontend and backend instances.
4) create elastic Ip for frontend and backend instance and attach it to them.
5) create postgresql rds.
6) create elastiCahe.
7) create s3 bucket.
8) create kms key and sns for notification.
9) create test folder and inside it various file will be created.
10)create variable.tf and declare all variables used in modules there.
11) Define the values of all the variables in terraform.tfvars in it.
12) create a backend.tf which will store the terraform state in s3 persistently.
13) create main.tf where all the variables will be called from there respective modules.
