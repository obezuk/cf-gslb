resource "cloudflare_record" "apex" {
  domain = "${var.cloudflare_zone}"
  name   = "${var.cloudflare_zone}"
  value  = "gslb.${var.cloudflare_zone}"
  type   = "CNAME"
  ttl    = 1
}

resource "cloudflare_record" "www" {
  domain = "${var.cloudflare_zone}"
  name   = "www.${var.cloudflare_zone}"
  value  = "gslb.${var.cloudflare_zone}"
  type   = "CNAME"
  ttl    = 1
}

resource "cloudflare_record" "ap-southeast-2a" {
  domain = "${var.cloudflare_zone}"
  name   = "ap-southeast-2a.gslb"
  value  = "${aws_eip.ap-southeast-2a.public_ip}"
  type   = "A"
  ttl    = 1
}

resource "cloudflare_record" "ap-southeast-2b" {
  domain = "${var.cloudflare_zone}"
  name   = "ap-southeast-2b.gslb"
  value  = "${aws_eip.ap-southeast-2b.public_ip}"
  type   = "A"
  ttl    = 1
}

resource "cloudflare_record" "ap-southeast-1a" {
  domain = "${var.cloudflare_zone}"
  name   = "ap-southeast-1a.gslb"
  value  = "${aws_eip.ap-southeast-1a.public_ip}"
  type   = "A"
  ttl    = 1
}

resource "cloudflare_record" "us-west-1a" {
  domain = "${var.cloudflare_zone}"
  name   = "us-west-1a.gslb"
  value  = "${aws_eip.us-west-1a.public_ip}"
  type   = "A"
  ttl    = 1
}

resource "cloudflare_record" "eu-west-2a" {
  domain = "${var.cloudflare_zone}"
  name   = "eu-west-2a.gslb"
  value  = "${aws_eip.eu-west-2a.public_ip}"
  type   = "A"
  ttl    = 1
}