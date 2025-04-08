variable "warehouse_name" {
    type = string
}

variable "warehouse_size" {
    type = string
    default = "XSMALL"
}

variable "auto_suspend" {
    type = number
    default = 60
}