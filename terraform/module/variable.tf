variable "bucket_name" {
  type = string
}

variable "enabled_versioning" {
  type    = bool
  default = false
}


variable "bucket_object" {
  type = map(object({
    object_key  = string
    object_path = string
  }))
}