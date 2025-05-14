#Create a new Storage Object in Bucket.
resource "yandex_storage_object" "picture" {
  bucket     = var.netology_bucket.bucket
  key        = var.object_picture.key
  source     = var.object_picture.source
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}
