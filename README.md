# Data Science meets Infrastructure as Code

The main objective of this project is to create a set of tools that allow
the deployment of Data Science Stacks using Terraform. It comprises the 
following infrastructure:

* The creation of Packer images with both JupyterLab hosted in **PORT** and
RStudio Server hosted in **PORT**, the result of this packer images will be
  an Amazon Machine Image that can be used multiple times in the future.
  
* The creation of a Simple AD and SSM (AWS Systems Manager) to emulate the
cenario of a login in both services using Active Directories, this might 
  require some modifications to be used by your stack
  
* Creation of a VPC and necessary subnets to ensure that all the 
  infrastructure required by the stack will be available
  
* Finally, when all of that is created, the objective will be to deploy
both of these services (JupyterLab and RStudio Server) in an EC2 instance.
  
**Disclaimer:** The full stack is AWS oriented, but the solution might be
available in other cloud providers. It may incur in costs since the whole
infrastructure goes beyond the AWS Free Tier.

---

Below we have an example of the `terraform.tfvars` file that may need to
be created at the root of the directory. The stack is in it self pretty much
automated, but some knowledge of Terraform will come in handy.

```terraform
//TF CONFIG
```