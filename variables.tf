variable "token" {
  type      = string
  sensitive = true
}

locals {
  # ====================================
  all_repos = merge(local.repositories)
  # github repos can have extensive optional values to include. Reccommend checking them out at this link https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
  repositories = {
    example_repo_1 = {
      name           = "example_repo_1s"
      description    = "Include a description"
      visibility     = "public"
      default_branch = "main"
      has_projects   = true
      template = {
        owner                = "github"
        repository           = "example_repo_1"
        include_all_branches = true
      }
    }
  }
  # ====================================
  all_projects = merge(local.projects)

  projects = {
    example_repo1_project1 = {
      name = "example_repo1_project1"
      repository = "${github_repository.all_repos["example_repo_1"].name}"
      body = "This is a repository project."
    }
  }
  # ====================================
  all_teams = merge(local.teams)
  teams = {
    example_team_1 = {
      name                      = "example_team_1"
      description               = "create your first team here"
      privacy                   = "secret"
      parent_team_id            = null
      create_default_maintainer = false # set true if you want the creating user to be the default maintainer
    }
    example_team_2 = {
      name                      = "example_team_2"
      description               = "create your second team here"
      privacy                   = "secret"
      parent_team_id            = null
      create_default_maintainer = false
    }
  }
}