resource "cloudflare_load_balancer_pool" "ap-southeast-2a" {
  name = "ap-southeast-2a"
  origins {
    name = "ap-southeast-2a"
    address = "${aws_eip.ap-southeast-2a.public_ip}"
    enabled = true
  }
  monitor = "${cloudflare_load_balancer_monitor.health-check.id}"
  notification_email = "${var.cloudflare_email}"
}

resource "cloudflare_load_balancer_pool" "ap-southeast-2b" {
  name = "ap-southeast-2b"
  origins {
    name = "ap-southeast-2b"
    address = "${aws_eip.ap-southeast-2b.public_ip}"
    enabled = true
  }
  monitor = "${cloudflare_load_balancer_monitor.health-check.id}"
  notification_email = "${var.cloudflare_email}"
}

resource "cloudflare_load_balancer_pool" "us-west-1a" {
  name = "us-west-1a"
  origins {
    name = "us-west-1a"
    address = "${aws_eip.us-west-1a.public_ip}"
    enabled = true
  }
  monitor = "${cloudflare_load_balancer_monitor.health-check.id}"
  notification_email = "${var.cloudflare_email}"
}

resource "cloudflare_load_balancer_pool" "eu-west-2a" {
  name = "eu-west-2a"
  origins {
    name = "eu-west-2a"
    address = "${aws_eip.eu-west-2a.public_ip}"
    enabled = true
  }
  monitor = "${cloudflare_load_balancer_monitor.health-check.id}"
  notification_email = "${var.cloudflare_email}"
}

resource "cloudflare_load_balancer_pool" "ap-southeast-1a" {
  name = "ap-southeast-1a"
  origins {
    name = "ap-southeast-1a"
    address = "${aws_eip.ap-southeast-1a.public_ip}"
    enabled = true
  }
  monitor = "${cloudflare_load_balancer_monitor.health-check.id}"
  notification_email = "${var.cloudflare_email}"
}