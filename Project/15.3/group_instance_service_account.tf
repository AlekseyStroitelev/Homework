resource "yandex_iam_service_account" "group-sa" {
  name = var.group_instance_sa.name
}

resource "yandex_resourcemanager_folder_iam_member" "admin" {
  folder_id  = var.folder_id
  role       = var.group_instance_sa.role
  member     = "serviceAccount:${yandex_iam_service_account.group-sa.id}"
}
