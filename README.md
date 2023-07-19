# Create bulk VM instances in GCP using Terraform

To spin up bulk VM instances using Terraform, you can use the directory structure with main.tf, variables.tf, terraform.tfvars (or any other .tfvars file), and output.tf files in root directory:

Provider.tf contains the provider details, project details & credentials
backend.tf contains the bucket detail where tfstate file will be stored
In the variables.tf file, define the input variables that you will use in your main.tf file
In the main.tf file, use the input variables and define the resources to create the bulk VM instances
In the terraform.tfvars file, set the values for the input variables
In modules/vms directory, create the following files:

Create main.tf which contain actual resource block
Create variables.tf which contain VM specific variables
outputs.tf # In the output.tf file, define the outputs to display useful information after applying the configuration
