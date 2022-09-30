variable "owner" {
    type = string
    description = "Name of the owner of the project"
}
variable "division" {
    description = "Please select the division"
    type = string
}
variable "environment" {
    description = "Please select the environment here"
    type = string
}
variable "cost_center" {
    description = "Please provide the cost center value here"
    type = number
}