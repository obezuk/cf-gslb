resource "aws_eip" "us-west-1a" {
  provider = "aws.us-west-1"
  vpc = true
}

resource "aws_eip_association" "us-west-1a" {
  provider = "aws.us-west-1"
  instance_id   = "${aws_instance.us-west-1a.id}"
  allocation_id = "${aws_eip.us-west-1a.id}"
}

resource "aws_instance" "us-west-1a" {

  provider = "aws.us-west-1"

  key_name = "${var.aws_key_name}"

  instance_type = "t2.nano"
  ami = "${lookup(var.aws_amis, "us-west-1")}"
  availability_zone = "us-west-1a"

  security_groups = [ "${aws_security_group.us-west-1.name}" ]

  connection {
      host = "${aws_instance.us-west-1a.public_ip}"
      user = "${var.aws_instance_user}"
      private_key = "${file(var.aws_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo docker pull nginx",
      "sudo docker run -d -p 80:80 -v /tmp:/usr/share/nginx/html nginx",
      "echo 'HEALTHY: us-west-1a' >> /tmp/index.html"
    ]
  }

}