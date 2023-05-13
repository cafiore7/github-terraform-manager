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
      template = {
        owner                = "github"
        repository           = "example_repo_1"
        include_all_branches = true
      }
    }

    example_repo_2 = {
      name           = "example_repo_2"
      description    = "Include a description"
      visibility     = "public"
      default_branch = "main"
      template = {
        owner                = "github"
        repository           = "example_repo_2"
        include_all_branches = true
      }
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