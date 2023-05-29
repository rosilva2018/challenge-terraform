## Challenge Devops

Create a terraform.tfvars with your credentials and default region.

**Example**:

* AWS_ACCESS_KEY = ""
* AWS_SECRET_KEY = ""
* AWS_REGION = ""

## Getting Started

 * terraform get -update
 * terraform init
 * terraform plan
 * terraform apply

## Running Modules Steps

 * Running module network
 * Running module sg
 * Running module ec2

 [Modules](https://developer.hashicorp.com/terraform/language/modules/syntax)

 ### Dependencies

* Terraform.
* tfenv
* Account AWS
* AWS S3 Bucket backend

### Executing program

* terraform apply < file.tf >

## Help

rogeriocarvalho83@gmail.com

## Authors

Contributors names and contact info

rocarsil2018

## Version History

* 0.1
     Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Releas

## License

Free

## Acknowledgments

Inspiration, code snippets, etc.
* [Terraform](https://www.terraform.io/)
* [Creating Modules](https://www.terraform.io/docs/modules/index.html)
* [tfenv](https://github.com/tfutils/tfenv)
* [HashCorp](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
* [Modules](https://developer.hashicorp.com/terraform/language/modules/syntax)
