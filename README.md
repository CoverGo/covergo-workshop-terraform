# Terraform workshop examples

Each example is self contained so you can directly `cd` into the directory of the example and start working on it.

Before doing anything, make sure to set those environment variables for the AWS credentials used by AWS provider:

    export AWS_ACCESS_KEY_ID=<key>
    export AWS_SECRET_ACCESS_KEY=<key>

Then you can simply run `terraform init` to initialize the folder with terraform components. After that you are ready to start using `terraform plan` and `terraform apply`.


When you are done experimenting please run `terraform destroy` to cleanup the resources you created.
