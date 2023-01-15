// Common tags to be assigned to all resources
locals {
  common_tags = {
    Name        = "test"
    company     = "test"
    board       = "test"
    department  = "test"
    system      = "test"
    application = "test"
    domain      = "test"
    region      = "test"
    owner-email = "test@test"
  }
}
