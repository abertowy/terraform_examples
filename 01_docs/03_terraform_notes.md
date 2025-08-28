# Terraform Questions and Answers

1. **What is Terraform?**  
   Terraform is an open-source Infrastructure as Code (IaC) tool that allows you to define and provision cloud and on-premises infrastructure using a declarative configuration language (HCL). Terraform automates provisioning, updating, and versioning infrastructure, to ensure consistency and reduce manual effort.

2. **How does Terraform manage infrastructure?**  
   Terraform uses configuration files to describe the desired state of infrastructure and manages resources through providers using a state file.

3. **What is a Terraform provider?**  
   A provider is a plugin that allows Terraform to interact with APIs of cloud providers and other services.

4. **What is the purpose of the Terraform state file?**  
   The state file tracks the current state of your infrastructure, mapping resources defined in configuration files to real-world resources.

5. **How do you initialize a Terraform project?**  
   Run `terraform init` in your project directory to initialize the working directory and download required providers.

6. **How do you apply changes in Terraform?**  
   Use `terraform apply` to execute the planned changes and provision or update resources.

7. **How do you destroy resources managed by Terraform?**  
   Run `terraform destroy` to remove all resources defined in your configuration.

8. **What is a Terraform module?**  
   A module is a container for multiple resources that are used together, allowing for code reuse and organization.

9. **How can you preview changes before applying them?**  
   Use `terraform plan` to see what changes will be made without actually applying them.

10. **How do you manage sensitive data in Terraform?**  
    Use variables with the `sensitive` flag, environment variables, or secret management tools to handle sensitive data securely.

11. **How does Terraform differ from other IaC tools like CloudFormation or Ansible?**  
    - Terraform versus **CloudFormation**: Terraform is cloud-agnostic, meaning it can manage infrastructure across multiple providers (AWS, Azure, GCP, etc.), whereas AWS CloudFormation is specific to AWS. Terraform also has a more flexible syntax and state management.  
  
    - Terraform versus **Ansible**: Ansible is primarily a configuration management tool (managing software, packages, and OS configurations), while Terraform focuses on provisioning and managing infrastructure resources declaratively.

12. **How does Terraform manage remote state?**  
    By default, Terraform stores the state locally, but for collaboration, it supports remote backends (S3 with DynamoDB for AWS, GCS for Google Cloud, or Terraform Cloud). Remote state enables:
    - Shared access for multiple team members.
    - State locking to prevent conflicts.
    - Better security with encryption and controlled access

13. **What are Terraform workspaces, and when should you use them?**  
    Terraform workspaces allow you to maintain separate state files within the same configuration. They are useful when managing multiple environments (like dev, staging, prod) without duplicating code.  
    Workspaces are best for simple environment separation but may be too difficult to maintain for complex multi-account setups.

14. **How does Terraform handle importing existing infrastructure, and what are the limitations?**  
    Terraform can import existing resources into its state using the terraform import command. However, it doesn’t automatically generate configuration files (the .tf files) for those resources, so you’ll need to write them manually.  
    There are some limitations to this import functionality:
    - Complex setups require manual configuration reconciliation.
    - Some resource types are not supported for import.
    - There is a drift risk if the imported resource configuration doesn’t match actual infrastructure.

15. **What are Terraform provisioners, and when should you use them?**  
    Provisioners execute scripts or commands on a resource after it is created. They are often used for tasks like configuring VMs or installing software. 
    There are two types of provisioners:
    - Local provisioners, which run on the machine executing Terraform).
    - Remote provisioners, which run on the target resource via SSH or WinRM.
    Since provisioners introduce dependencies and reduce Terraform's declarative nature, they should be used sparingly. An alternative is to use configuration management tools like Ansible or cloud-init.

16. **What is drift detection in Terraform, and how can it be addressed?**  
    Drift detection refers to the situation when the actual infrastructure state diverges from the state defined in Terraform’s configuration. This can happen when manual changes are made outside of Terraform, like updates in the cloud provider’s console or other automation tools.  
  
    Terraform can detect drift by running terraform plan, which compares the current state from the state file with the real infrastructure.  
  
    If drift is detected, you should revert the manual changes to match the Terraform configuration, update the configuration to reflect the new desired state and run terraform apply to bring the infrastructure back into alignment with the configuration.

17. **How would you implement a rolling update using Terraform for an application deployed in multiple instances?**  
    A rolling update allows you to update your infrastructure incrementally to reduce downtime and make sure that a subset of your application instances remain available during the update. In a rolling update scenario, Terraform creates a new instance of the resource, waits for it to become healthy (using health checks), and then gradually replaces the old instances.  
  
    Practically, you can implement a rolling update by defining immutable infrastructure in Terraform and using count or for_each within your resource definitions (e.g., EC2 instances, load balancers).  

18. **How do you handle resource dependencies in Terraform, and what is the role of implicit and explicit dependencies?**  
    In Terraform, resource dependencies are handled automatically through its graph-building mechanism. Implicit dependencies are created when one resource references another in its configuration (for example, referencing an aws_security_group in an aws_instance) and Terraform automatically infers the dependency order.  
  
    Explicit dependencies are useful for handling edge cases where Terraform cannot automatically infer the dependency order. They are created when the depends_on argument is used, which forces Terraform to apply a specific order of execution even when resources are not directly referenced.  