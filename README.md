# Data Science meets Infrastructure as Code

The main objective of this project is to create a set of tools that allow
the deployment of Data Science Stacks using Terraform. It comprises the 
following infrastructure:

* The creation of Packer images with both JupyterHub hosted in port **8000** and
RStudio Server hosted in **8787**, the result of this packer images will be
  an Amazon Machine Image that can be used multiple times in the future.
  
* Creation of a VPC and necessary subnets to ensure that all the 
  infrastructure required by the stack will be available.
  
* Finally, when all of that is created, the objective will be to deploy
both of these services (JupyterHub and RStudio Server) in an EC2 instance.
  
**Disclaimer:** The full stack is AWS oriented, but the solution might be
available in other cloud providers. It may incur in costs since the whole
infrastructure goes beyond the AWS Free Tier.

---

Below we have an example of the `terraform.tfvars` file that may need to
be created at the root of the directory. The stack is in itself pretty much
automated, but some knowledge of Terraform will come in handy.

```terraform
region = "us-east-1"
instance_type = "t3.medium"
ebs_size = "20"
ec2_ami = "ami-08a9c0596281e6459"
ingress_cidr_blocks = "0.0.0.0/0"
```