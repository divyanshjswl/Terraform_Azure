resource "random_string" "randomname" {
  length  = 8
  upper   = false
  special = false
  numeric = false
}