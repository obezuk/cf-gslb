resource "cloudflare_load_balancer_monitor" "health-check" {
  expected_body = "HEALTHY"
  expected_codes = "2xx"
  path = "/index.html"
}