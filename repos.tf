resource "github_repository" "all_repos" {
  for_each = local.all_repos
  # required information
  name = lookup(each.value, "name", "you forgot a repo name in variables.tf")
  # optional information - github repos are incrdibly customizable. Recommmend going to documentation found at https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository for more
  description            = lookup(each.value, "description", "description")
  visibility             = lookup(each.value, "visibility", "public")          # this overrides the private setting
  allow_merge_commit     = lookup(each.value, "allow_merge_commit", false)     # set to false to disable merge commits on the repository.
  allow_squash_merge     = lookup(each.value, "allow_squash_merge", false)     # set to false to disable squash merges on the repository.
  allow_auto_merge       = lookup(each.value, "allow_auto_merge", false)       # set to true to allow auto-merging pull requests on the repository.
  delete_branch_on_merge = lookup(each.value, "delete_branch_on_merge", false) # automatically delete head branch after a pull request is merged. Defaults to false.
  allow_update_branch    = lookup(each.value, "allow_update_branch", true)     # set to true to always suggest updating pull request branches.
}

resource "github_branch_default" "all_repos_default_branch" {
  for_each = local.all_repos
  # required information
  repository = github_repository.all_repos[each.key].id
  branch     = lookup(each.value, "default_branch", "main") # "main" is my preferred default naming convention for protected branches, modify to suit your needs
}

resource "github_branch_protection_v3" "all_repos_default_branch_protection" {
  for_each = local.all_repos
  #required information
  repository = github_repository.all_repos[each.key].name
  branch     = lookup(each.value, "default_branch", "main")
  # optional information
  require_conversation_resolution = lookup(each.value, "require_conversation_resolution", true)
  required_pull_request_reviews {
    dismiss_stale_reviews           = lookup(each.value, "dismiss_stale_reviews", true)
    required_approving_review_count = lookup(each.value, "required_approving_review_count", "1")
  }
}