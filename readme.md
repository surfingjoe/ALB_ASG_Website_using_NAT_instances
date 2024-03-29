# Creating a simple load balanced website in AWS using an ALB and auto-scaling group

## Using Terraform to deploy the infrastructure
The code found here is a part of my blog on using "Infrastructure as Code" with Terraform.  I'm writing different exercises on how to use Terraform to create AWS deployments in my WordPress site.  See [Deploying an Auto Scaling Group and Application Load Balancer in AWS](https://josephomara.com/2022/06/23/use-terraform-to-deploy-an-application-load-balancer-in-aws-with-an-auto-scaling-group/(opens in a new tab))

![](https://github.com/surfingjoe/ALB_ASG_Website_using_NAT_instances/blob/master/Load%20Balancedand%20scalable%20Simple%20Website.jpg)

## Features
* Using Terraform to deploy infrastructure [Why use Infrastructure as Code](https://josephomara.com/2021/08/23/why-infrastructure-as-code/(opens in a new tab))
* use Terraform to deploy an Auto Scaling Group and an Application Load Balancer in AWS
* Load balancing a simple website that displays the EC2 host you are connected to in AWS

### Auto-scaled web pages using simple HTML code that shows which EC2 instance you've been connected
I have created a bit of HTML, with some IAM magic that displays the EC2 information of the server a user is connect thru a load balancer.
Connecting to a load balancer, the load balancer will route a user to one of the auto-scaled web servers.  

The EC2 details wil show which instance you've been connected via the load balancer and will look similar to the following image;

![](Simple Webpage.png)
## Requirements

- Must have an AWS account
- Install AWS CLI, Configure AWS CLI, Install Terraform
- AWS Administrator account or an account with the following permissions:
  - reate an IAM profile
  - create VPC, subnets, and security groups
  - create a internet gateway, NAT instances and routing tables
  - Create, and add, delete files in an AWS S3 bucket
  - Privilege to create EC2 instances and manage EC2 resources
  - Create and configure an Application Load Balancer
  - Create and configure an Auto Scaling Group
- Ec2 Key Pair for the region


## Installation
 Clone or fork this repository into any folder of your choice

* Be sure to edit the variables in terraform.tfvars (currently it has bogus values)
* Be sure to update VPC.tf S3 bucket information for Terraform Remote State

* In your terminal, goto the folder where you've placed this code and execute the following commands:

   1. `Terraform init`
   2. `terraform validate`
   3. `Terraform apply`

Don't forget to clean up your Terraform deployment using "terraform destroy" once you are satisfied with this exercise


