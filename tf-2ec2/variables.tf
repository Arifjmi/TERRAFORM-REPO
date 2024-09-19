variable "ec2_config" {
	type = list(object({
		ami = string
		instance_type = string
	}))
}
variable "region" {
	default = "us-east-1"
}
