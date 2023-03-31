resource "github_repository" "terraform_test_repo" {
  name        = "terraform_test_repo_nishant"
  description = "This is a repo that will be created using a terraform script"
  visibility   = "public"
}
resource "github_repository" "terraform_test_repo2" {
  name        = "terraform_test_repo_nishant2"
  description = "This is a repo that will be created using a terraform script"
  visibility   = "public"
}