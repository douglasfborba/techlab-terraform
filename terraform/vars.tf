variable "AWS_PROFILE" { }

variable "AWS_REGION" {
    default = "us-east-1"
}

variable "AWS_KEY" { }

variable "CIT_VPN_IPS" {
    type = list(string)
}

variable "AMIS" {
    type = map(string)
    default = {
        us-east-1 = "ami-096fda3c22c1c990a"
        us-east-2 = "ami-03d64741867e7bb94"
        sa-east-1 = "ami-079b1541b6dc958ca"
    }
}