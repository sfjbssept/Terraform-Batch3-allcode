terraform {
  required_providers {
    github = {
      source         = "integrations/github"
      version = "~> 5.0"
    }
  }
}
provider "github" {
  token = "your-token-goes-here"
}