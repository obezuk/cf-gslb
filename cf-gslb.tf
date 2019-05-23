resource "cloudflare_load_balancer" "gslb" {
  zone = "${var.cloudflare_zone}"
  name = "gslb.${var.cloudflare_zone}"
  
  fallback_pool_id = "${cloudflare_load_balancer_pool.ap-southeast-2b.id}"
  default_pool_ids = ["${cloudflare_load_balancer_pool.ap-southeast-2a.id}"]
  description = "example load balancer using geo-balancing"

  proxied = false
  steering_policy = "geo"
  region_pools {
    region = "OC"
    pool_ids = ["${cloudflare_load_balancer_pool.ap-southeast-2a.id}", "${cloudflare_load_balancer_pool.ap-southeast-2b.id}"]
  }

  region_pools {
    region = "WNAM"
    pool_ids = ["${cloudflare_load_balancer_pool.us-west-1a.id}"]
  }

  region_pools {
    region = "ENAM"
    pool_ids = ["${cloudflare_load_balancer_pool.us-west-1a.id}"]
  }

  region_pools {
    region = "WEU"
    pool_ids = ["${cloudflare_load_balancer_pool.eu-west-2a.id}"]
  }
  
  region_pools {
    region = "EEU"
    pool_ids = ["${cloudflare_load_balancer_pool.eu-west-2a.id}"]
  }

  region_pools {
    region = "SEAS"
    pool_ids = ["${cloudflare_load_balancer_pool.ap-southeast-1a.id}"]
  }
  
  region_pools {
    region = "NEAS"
    pool_ids = ["${cloudflare_load_balancer_pool.ap-southeast-1a.id}"]
  }
  
}