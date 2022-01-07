# terraform-aws-autoscaling-group
An opinionated module that creates a launch template for use with an autoscaling group.

## Instantiation
The simplest instantiation requires only an environment and a launch template id.

```
module "autoscaling_group" {
  source = "git@github.com:kiawnna/terraform-aws-autoscaling-group.git"
  environment = "dev"
  launch_template_id = "lt-id"
}
```
> This example will create an autoscaling group that accepts all the provided defaults. Review defaults below under Variables / Customizations.

For an autoscaling group that is being used with ECS, you should add the appropriate tag as below:
```
module "autoscaling_group" {
  source = "git@github.com:kiawnna/terraform-aws-autoscaling-group.git"
  environment = "dev"
  launch_template_id = "lt-id"
  tags = [{
    key                 = "AmazonECSManaged"
    value               = ""
    propagate_at_launch = true
  }]
}
```

## Resources Created
* An autoscaling group.

## Outputs
The autoscaling group name and arn are outputs.

Reference them as:

> module.autoscaling_group_module_name.autoscaling_group_name
> 
> module.autoscaling_group_module_name.autoscaling_group_arn

## Variables / Customization
The variable below can be customized to fit your needs. The current defaults are:
>  * `desired_capacity` &rarr; 1
>  * `max_size` &rarr; 1
>  * `min_size` &rarr; 1
>  * `launch_template_version` &rarr; $Latest
>  * `subnet_ids` &rarr; none
>  * `target_group_arns` &rarr; none
>  * `tags` &rarr; none

See the `variables.tf` file for further information.

## Tags
The default tags are defined in the `variables.tf` file. Providing any custom tags will overwrite the default tags. These default tags are:

```
  tags = [{
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  },
  {
    key                 = "Name"
    value               = "shared-asg"
    propagate_at_launch = true
  },
  {
    key                 = "Deployment_Method"
    value               = "terraform"
    propagate_at_launch = true
  }]
```
> **Note**: Interpolation is not allowed in the variables.tf file, which is why the environment is not specified in the Name tag above.