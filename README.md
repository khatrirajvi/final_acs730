In this project we will deploy different environments auch as dev, prod and staging with auto scaling and load balancing features. Follow the steps in the README file.

Create a S3 bucket to load images
-Create a public bucket with name as mentioned below and upload 2 images.

Generate a SSH key for dev, prod and staging in their respective folders using the following commands:
ssh-keygen -t rsa -f (key-name)

Create S3 buckets using S3 module: Run the terraform deployment commands as mentioned below:
-terraform init

-terraform validate

-terraform plan

-terraform apply

Deploy the environments using the below mentioned commands:
-terraform init

-terraform fmt

-terraform validate

-terraform plan

-terraform apply

Deploy the peering module

Finally test the webpages using the DNS of Load Balancer.

By : Sanjam Malhotra, Rajvi Khatri, Kartik Sharma, Bibek Shrees
