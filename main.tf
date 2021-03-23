terraform {
    required_version = ">= 0.12"
    backend "s3" {
        bucket = "myapp-bucket447"
        key = "myapp/state.tfstate"
        region ="eu-west-2"
    }
}

provider "aws" {
    region = "eu-west-2"
}

resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block

    tags = {
        Name = "${var.env_prefix}-vpc"
    }
}

module "myapp-subnet" {
    source = "./modules/subnet"
    subnet_cidr_block = var.subnet_cidr_block
    avail_zone = var.avail_zone
    env_prefix = var.env_prefix
    vpc_id = aws_vpc.myapp-vpc.id
    default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
}

module "myapp-server" {
    source = "./modules/webserver"
    vpc_id = module.vpc.vpc_id
    my_ip = var.my_ip
    env_prefix = var.env_prefix
    image_name = var.image_name
    public_key_location = var.public_key_location
    instance_type = var.instance_type
    avail_zone = var.avail_zone
    subnet_id = module.vpc.public_subnets[0]
}