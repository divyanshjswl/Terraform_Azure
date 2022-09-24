resource "random_string" "random_name" {
  length  = 8
  upper   = false
  special = false
  numeric = false
}