#Create KMS Symmetric Key.
resource "yandex_kms_symmetric_key" "k8s-key" {
  name              = var.storage_symmetric_key.name
  description       = var.storage_symmetric_key.description
  default_algorithm = var.storage_symmetric_key.default_algorithm
  rotation_period   = var.storage_symmetric_key.rotation_period
}

resource "yandex_kms_symmetric_key_iam_member" "key-viewers" {
  symmetric_key_id = yandex_kms_symmetric_key.k8s-key.id
  role = "kms.keys.encrypterDecrypter"
  member = "serviceAccount:${yandex_iam_service_account.k8s-sa.id}"
}
