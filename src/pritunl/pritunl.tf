resource "aws_security_group" "pritunl" {
  name = "${var.vpc_network_name}-pritunl"
  vpc_id = "${aws_vpc.vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
     "Name", "${var.vpc_network_name}-pritunl"
    )
  }"
}

resource "aws_security_group_rule" "pritunl" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port = -1
  protocol = "-1"
  security_group_id = "${aws_security_group.pritunl.id}"
  to_port = 65535
  type = "ingress"
}

resource "aws_instance" "pritunl" {
  ami = "ami-6cd6f714"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name = "${var.pritunl_server_aws_key_pair_name}"
  subnet_id = "${element(aws_subnet.vpc.*.id, 0)}"
  security_groups  = ["${aws_security_group.pritunl.id}"]

  tags = "${
    map(
     "Name", "${var.vpc_network_name}-pritunl"
    )
  }"
  
  connection {
    user = "ec2-user"
    private_key = "${file("${var.pritunl_server_aws_key_pair_local}")}"
  }

  provisioner "file" {
    source      = "pritunl/pritunl-install.sh"
    destination = "/home/ec2-user/pritunl-install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/pritunl-install.sh",
      "/home/ec2-user/pritunl-install.sh"
    ]
  }

}
