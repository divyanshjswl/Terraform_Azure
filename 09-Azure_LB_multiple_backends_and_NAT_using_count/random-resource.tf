resource "random_string" "randomnames" {
  length  = 8
  upper   = false
  special = false
  numeric = false
}