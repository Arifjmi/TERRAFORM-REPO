variable "instance_type" {
  description = "What type of instance you want ?"
  type        = string

  validation {
    condition     = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "Only allowed t2 and t3 micro"
  }
}



variable "ec2_config" {
  type = object({
    v_size = number
    v_type = string
  })
default = {
	v_size = 8
	v_type = "gp2"
}

}

variable "additional_tags" {
	type = map(string)
	default = {}

}
