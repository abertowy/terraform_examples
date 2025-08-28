Terraform
==========
  
1. What is VPC  
--------------
Amazon Virtual Private Cloud (VPC) is a logically isolated virtual network within the Amazon Web Services (AWS) cloud    
where you define your own IP address range, subnets, and network configurations to launch and manage AWS resources like EC2 instances.  
It gives you control over your network environment, similar to a traditional data center network, enabling you to customize connectivity to the internet, other VPCs, or your on-premises data centers using security groups and route tables for enhanced security and resource placement.  
  
- Logical Isolation:   
A VPC is logically isolated from other virtual networks in the AWS Cloud, ensuring that resources within a VPC are not directly accessible from other AWS accounts unless explicitly configured.   
- IP Addressing:  
Users can define their own IP address ranges (CIDR blocks) for their VPCs and subnets, supporting both IPv4 and IPv6.  
- Subnets:   
A subnet is a range of IP addresses within a VPC, residing within a single Availability Zone. Resources like Amazon EC2 instances are launched into these subnets. Subnets can be configured as public (with internet access) or private (without direct internet access).  
- Route Tables:   
Route tables control the routing of traffic within a VPC and to external networks. They contain rules that determine where network traffic from a subnet or gateway is directed.  
- Internet Gateway:  
An Internet Gateway enables communication between resources in a VPC and the internet. It is attached to the VPC and routes public traffic to and from the internet.   
- Network Access Control Lists (NACLs) and Security Groups:  
These provide multiple layers of security to control access to resources within a VPC. NACLs operate at the subnet level, while security groups operate at the instance level.  
- VPN Connectivity:  
Users can establish a hardware Virtual Private Network (VPN) connection between their on-premises data centers and their VPCs, extending their corporate network into the AWS cloud.  
- Customization:  
Amazon VPC offers flexibility to customize network configurations, such as creating public-facing subnets for web servers and private-facing subnets for backend systems like databases.  
  
2. What is EC2
---------------
  
Amazon Elastic Compute Cloud (Amazon EC2) is a core service within Amazon Web Services (AWS) that provides resizable computing capacity in the cloud.  
It allows users to rent virtual servers, known as "instances," on which they can run their own computer applications.  
  
- Virtual Servers (Instances):   
EC2 instances are essentially virtual machines that can be configured with various combinations of CPU, memory, storage, and networking capacity to suit different workload requirements.
- Elasticity and Scalability:  
EC2 enables users to easily scale their computing resources up or down based on demand. Instances can be launched and terminated as needed, with billing typically based on usage (e.g., per second for active servers).  
- Amazon Machine Images (AMIs):  
Users can boot an Amazon Machine Image (AMI) to configure a virtual machine, which contains the operating system and any desired software.  
- Control and Flexibility:  
EC2 provides users with control over the geographical location of their instances for latency optimization and redundancy. It also offers a wide selection of instance types optimized for various use cases, including general purpose, compute optimized, memory optimized, storage optimized, and accelerated computing. 
- Cost-effectiveness:  
Users only pay for the compute capacity they consume, eliminating the need to purchase and manage physical hardware. Various purchasing models, such as On-Demand, Reserved Instances, and Spot Instances, offer different pricing options.  
- Integration with AWS Services:  
EC2 integrates seamlessly with other AWS services, such as Amazon S3 for storage, Amazon VPC for networking, and Auto Scaling for automatic scaling based on traffic or other metrics.  
  
3. What is RDS
--------------
  
Amazon Relational Database Service (Amazon RDS) is a managed service provided by Amazon Web Services (AWS) that simplifies the setup, operation, and scaling of relational databases in the cloud.  
It handles routine database administration tasks such as patching, backups, and scaling, allowing users to focus on application development and business logic.   
  
- Managed Service:  
AWS automates time-consuming administration tasks like hardware provisioning, database setup, patching, and backups.  
- Support for Multiple Database Engines:  
Amazon RDS supports popular relational database engines, including Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle, SQL Server, and Db2. This allows users to leverage existing code, applications, and tools.  
- Scalability:  
Users can easily scale compute and storage resources up or down to meet changing demands.  
- High Availability and Durability:  
Features like Multi-AZ deployments and automated backups enhance database availability and data durability.  
- Cost-Efficiency:  
It offers a pay-as-you-go model with no upfront investments, and users can choose between On-Demand or Reserved Instances for cost optimization.  
- Security:  
Amazon RDS provides various security features, including network isolation, encryption at rest and in transit, and integration with AWS Identity and Access Management (IAM).  
  
4. What is S3
--------------
  
Amazon Simple Storage Service (Amazon S3) is a cloud-based object storage service provided by Amazon Web Services (AWS).  
It is designed to store and retrieve any amount of data from anywhere on the web, offering industry-leading scalability, data availability, security, and performance.  
  
- Object Storage:  
S3 stores data as "objects" within "buckets." An object consists of the data itself, a unique key (name), and metadata. This differs from traditional file or block storage.  
- Scalability:  
S3 offers virtually unlimited storage capacity, allowing users to store and retrieve any amount of data without needing to provision storage in advance.  
- Durability and Availability:  
It provides high durability and availability, designed to withstand concurrent device failures by redundantly storing data across multiple devices and facilities within an AWS Region.  
- Security:  
S3 offers robust security features, including access control mechanisms (IAM, bucket policies, access control lists), encryption options (server-side and client-side), and integration with other AWS security services.  
- Performance:  
It delivers high performance for data access, suitable for a wide range of workloads, including data lakes, cloud-native applications, and mobile apps.  
- Storage Classes:  
S3 offers various storage classes optimized for different access patterns and cost requirements, such as S3 Standard, S3 Intelligent-Tiering, S3 Standard-IA, S3 One Zone-IA, S3 Glacier Instant Retrieval, S3 Glacier Flexible Retrieval, S3 Glacier Deep Archive, and S3 Outposts.  
- Integration:  
S3 seamlessly integrates with other AWS services, enabling a comprehensive cloud solution for various use cases like analytics, backups, disaster recovery, and content delivery.  
  

5. Infrastructure
------------------
  
Providers: AWS, Azure and GCP  
Tools: Terraform  
  
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXXXXx  
export AWS_SECRET_KEY_ID=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX  
or aws configure  
1. create main.tf with provider "aws" and resource "aws_vpc"  
2. cd first-resource
3. terraform init
4. terraform plan
5. terraform apply (yes)
6. terraform destroy (yes)
  
Switch between version tfswitch  
  
AMI image Debian  
```
resource "aws_instance" "ec2" {
    ami = "ami-0f439e819ba112bd7"
    instance_type = "t3.micro"
}
```
  
Terraform registry for third-party modules  
  
Terraform state file  
  
S3 bucket to store state files  
Further reading : https://developer.hashicorp.com/terraform/language/backend/s3  
S3 bucket name: abertowy-remote-backend-2025   
  
Multiple vars files  
`terraform plan -var-file=test.tfvars`  
  
Import  
# create vpc in advance  
# in terminal : terraform import aws_vpc.myvpc2 vpc-03db7c242cd8c8929  
  
Auto-approve  
terraform apply -auto-approve  
  
Data source  
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/instance.html
