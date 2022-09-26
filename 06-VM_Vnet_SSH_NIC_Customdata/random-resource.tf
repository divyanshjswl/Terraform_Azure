resource "random_string" "randomname" {
  length  = 8
  numeric = false
  special = false
  upper   = false
}