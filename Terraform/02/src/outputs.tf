output "develop" {
    value = [
        { web_instance_name = [yandex_compute_instance.web.name] },
        { web_external_ip = [yandex_compute_instance.web.network_interface[0].nat_ip_address] },
        { web_FQDN = [yandex_compute_instance.web.fqdn] },
        { db_instance_name = [yandex_compute_instance.db.name] },
        { db_external_ip = [yandex_compute_instance.db.network_interface[0].nat_ip_address] },
        { db_FQDN = [yandex_compute_instance.db.fqdn] }
    ]
}