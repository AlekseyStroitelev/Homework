resource "local_file" "inventory" {
  content = templatefile("./hosts.tftpl",
	{
  	web_vm	    = yandex_compute_instance.web_vm,
  	db      = yandex_compute_instance.db,
  	storage = [yandex_compute_instance.storage_vm]
	})

  filename = "./inventory.yml"
}