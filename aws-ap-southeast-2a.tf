resource "aws_eip" "ap-southeast-2a" {
  provider = "aws.ap-southeast-2"
  vpc = true
}

resource "aws_eip_association" "ap-southeast-2a" {
  provider = "aws.ap-southeast-2"
  instance_id   = "${aws_instance.ap-southeast-2a.id}"
  allocation_id = "${aws_eip.ap-southeast-2a.id}"
}

resource "aws_instance" "ap-southeast-2a" {

  provider = "aws.ap-southeast-2"

  key_name = "${var.aws_key_name}"

  instance_type = "t2.nano"
  ami = "${lookup(var.aws_amis, "ap-southeast-2")}"
  availability_zone = "ap-southeast-2a"

  security_groups = [ "${aws_security_group.ap-southeast-2.name}" ]

  connection {
      host = "${aws_instance.ap-southeast-2a.public_ip}"
      user = "${var.aws_instance_user}"
      private_key = "${file(var.aws_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo docker pull nginx",
      "sudo docker run -d -p 80:80 -v /tmp:/usr/share/nginx/html nginx",
      "echo 'HEALTHY: ap-southeast-2a' >> /tmp/index.html"
    ]
  }

}