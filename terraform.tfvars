cidr = [
  {
    cidr = "11.0.0.0/16"
    name = "VPC1"
    }, {
    cidr = "11.0.1.0/24"
    name = "VPC1-private-subnet"
    }, {
    cidr = "12.0.0.0/16"
    name = "VPC2"
    }, {
    cidr = "12.0.1.0/24"
    name = "VPC2-private-subnet"
    }, {
    cidr = "13.0.0.0/16"
    name = "VPC3"
    }, {
    cidr = "13.0.1.0/24"
    name = "VPC3-public-subnet"
  }
]

AZs = ["us-east-1a", "us-east-1b", "us-east-1c"]

environment = "dev"
