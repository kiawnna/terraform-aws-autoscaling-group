variable "environment" {
  type = string
}
variable "desired_capacity" {
  type = number
  default = 1
}
variable "max_size" {
  type = number
  default = 1
}
variable "min_size" {
  type = number
  default = 1
}
variable "launch_template_id" {
  type = string
}
variable "launch_template_version" {
  type = string
  default = "$Latest"
}
variable "subnet_ids" {
  type = list(string)
  default = null
}
variable "target_group_arns" {
  type = list(string)
  d0efault = null
}
variable "tags" {
  type = list(object({
    key = string
    value   = string
    propagate_at_launch     = bool
  }))

  default = [{
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
}
