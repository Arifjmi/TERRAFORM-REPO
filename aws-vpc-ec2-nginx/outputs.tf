output "instance-public-ip" {
	value = aws_instance.nginxserver.public_ip
}

output "instance_url" {
	value = "http://${aws_instance.nginxserver.public_ip}"
}
