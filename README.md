# TerraformAWSProject1

The code in this repository is for creating resources in AWS as part of learning Terraform. Any feedback is appreciated.

## What Does This Code Spin Up?

Deploy a custom VPC (with default Subnet and Route Table configuration in the VPC)
EC2 T2 Micro Instance w/ Docker

## Test Outcome

Using the public IP that is output at the end of "terraform apply", navigate on port 8080 to an nginx instance. SSH to the same public IP should also establish a connection.

### Notes

You will need to generate your own ssh key. I used Open SSH on Windows 10

https://phoenixnap.com/kb/generate-ssh-key-windows-10
