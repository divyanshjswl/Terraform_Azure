resource "random_string" "random_suffix_for_sa" {
  length  = 8
  special = false
  upper   = false
}