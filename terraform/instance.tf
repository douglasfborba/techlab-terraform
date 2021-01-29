resource "aws_instance" "ec2-instance" {
    tags = {
       "Name" = "douglasfb_terraform_techlab2"
    }

    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
    security_groups = [ aws_security_group.ec2-security-group.name ]

    key_name = var.AWS_KEY  
}

resource "aws_security_group" "ec2-security-group" {
    name = "allow_cit_vpn"
    description = "Allow only CI&T VPN inbound traffic"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = var.CIT_VPN_IPS
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.CIT_VPN_IPS
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}