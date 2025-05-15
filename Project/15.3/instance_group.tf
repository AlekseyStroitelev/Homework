
resource "yandex_compute_instance_group" "group_develop" {
  name                = var.group_develop_name
  folder_id           = var.folder_id
  service_account_id  = yandex_iam_service_account.group-sa.id
  depends_on          = [ yandex_resourcemanager_folder_iam_member.admin ]
  instance_template {
    resources {
      memory = var.group_instance_resources.memory
      cores  = var.group_instance_resources.cores
      core_fraction = var.group_instance_resources.fraction
    }
    boot_disk {
      initialize_params {
        image_id = var.lamp_image_id
      }
    }
    network_interface {
      network_id = yandex_vpc_network.develop.id
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
      nat        = var.group_instance_resources.nat
    }
  
    metadata = {
      user-data = "${file("./cloud-init.yml")}"
    }
    network_settings {
      type = var.group_instance_resources.network_type
    }
  }

  scale_policy {
    fixed_scale {
      size = var.scale_policy_fixed_scale
    }
  }

  allocation_policy {
    zones = [var.public_default_zone]
  }

  load_balancer {
    target_group_name = var.load_balancer_target_group_name
  }

  deploy_policy {
    max_unavailable = var.deploy_policy.max_unavailable
    max_expansion   = var.deploy_policy.max_expansion
  }

  health_check {
    interval            = var.health_check.interval
    timeout             = var.health_check.timeout
    healthy_threshold   = var.health_check.healthy_threshold
    unhealthy_threshold = var.health_check.unhealthy_threshold
    http_options {
      path = var.health_check.http_options_path
      port = var.health_check.http_options_port
    }
  }
}
