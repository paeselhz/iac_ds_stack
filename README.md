# Data Science meets Infrastructure as Code

---

Below we have an example of the `terraform.tfvars` file that may need to
be created at the root of the directory. The stack is in itself pretty much
automated, but some knowledge of Terraform will come in handy.

```terraform
region = "us-east-1"
instance_type = "t3.medium"
ebs_size = "20"
ec2_ami = "ami-0f1420e5c77960c82"
ingress_cidr_blocks = "0.0.0.0/0"
```

---

The recent developments towards the integration of Data Science features, using best practices of software engineering, brought knowledge of tools like Docker, Jenkins, REST APIs to many data scientists, and even though this knowledge enables most of them to deploy their data science projects adding value to the business they are inserted, there are a few caveats and compromises when a project is built locally and then is rethought to be deployed in the cloud.

Aware of these caveats, my main objective with this article is to merge both the knowledge of Data Science (and its tools) with Infrastructure as Code tools such as Packer and Terraform to ensure the creation of a data science environment that helps users that work in both R and Python to provision Infrastructure at the cloud, and leverage many Big Data tools, such as AWS EMR to analyze and process large amounts of data.

Even though this article is created using an AWS stack (It may incur costs since the whole infrastructure goes beyond the AWS Free Tier), it can be used in other cloud providers with proper modifications to both the Packer image creation and the Terraform to deploy the machines. Further updates in this work should bring support for more clouds to the project.

### TL;DR

The main objective of this project (available here in Github) is to create a set of tools that allow the deployment of a data science stack using Packer and Terraform. It comprises the following infrastructure:

The creation of a Packer image with both JupyterHub hosted in port 8000, and RStudio Server hosted in port 8787, the result of this packer image will be an Amazon Machine Image that can be used multiple times in the future.

Creation of a VPC and necessary subnets to ensure that all the infrastructure required by the stack will be available.

Finally, when all of that is created, the objective will be to deploy both of these services (JupyterHub and RStudio Server) in an EC2 instance.

### Building a custom image to be used

Leveraging the customization of an image by using Packer and creating custom Machine Images to be deployed in any cloud, we also use Ansible to create playbooks to allow the customization of what should be installed in the machine. By creating this image with a single source, and specifying many of the features added to the Machine Image, we can ensure that once the image is built, it will be the same throughout its lifetime, meaning that any packages and dependencies installed on the machine, should not be updated in its daily usage.

This allows users, being data scientists or data analysts, to be certain that once a project is built on top of a custom AMI, none of the dependencies will change with time. This reproducibility feature can also be enhanced, when the user itself uses dependencies managers such as Renv for R, or the requirements.txt in an environment when using Python.

The creation of the image can be customized to add or remove features, such as installing or not RStudio Server, or deploying the image with Anaconda installed or not, and after the AMI is finally built by Packer and Ansible, it will be available to be used multiple times.

The AMI that is being built by this project focus on the installation and configuration of an RStudio Server, and Jupyterhub with conda.

###Using the custom image

Many users, when starting to use Cloud Providers to deploy powerful machines to train models or analyze large amounts of data, do not use tools that allow the provision of this infrastructure in a manner that is both reproducible and scalable (and many times these resources end up amounting for a large cloud bill by the end of the month). This is when Terraform comes along since it helps users to deploy a custom infrastructure using code, and destroy the same infrastructure when the work is done.

The terraform module of this project contains a simplified version of infrastructure, but as well as with Packer, more modules can be added by the users if needed. The security module controls the ingress and egress ports used by the machine that will be deployed using a Custom AMI, while the network module controls the networks and gateways that will be used by the machine, the IAM sets the permissions that this machine can have in the cloud provider and the EC2 module is what actually deploys the machine.

Many of the advantages brought by Terraform, and its orientation to Infrastructure as Code, allow for the tracking of infrastructure changes through time with Git. By the end of Terraform deployment, the user will have the IP address of the machine, so it can connect and use its resources (and applications previously installed by Packer), RStudio server being hosted in port 8787, and Jupyterhub in port 8000 (these ports were previously allowed in the security groups module).

###Further developments

Even though this project can be used by itself as a Data Science stack that can easily be deployed to the cloud, we can also use this custom AMI with an EMR cluster, speeding up its provisioning, since we can take away a few installations that normally are executed during the bootstrap step of the cluster provisioning.

Also, this does not replace any formal and official releases of Data Science stacks that allow data exploration and model creation and deployments such as Sagemaker, Google AI Platform, or Azure Data Studio but is an alternative to these solutions since it allows the user to fully customize what they need and deploy it in whatever cloud they want.

---

Luis HZ Paese