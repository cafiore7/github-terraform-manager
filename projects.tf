resource "github_repository_project" "all_projects" {
  for_each = local.all_projects
  # required information
  name       = lookup(each.value, "name", "A Repository Project")
  repository = lookup(each.value, "repository", "${github_repository.all_repos["example_repo_1"].name}")
  # optional information
  body       = "This is a repository project."
}