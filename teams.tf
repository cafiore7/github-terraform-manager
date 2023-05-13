resource "github_team" "all_teams" {
  for_each = local.all_teams
  # required information
  name = lookup(each.value, "name", "You forgot to add a name in variables.tf")
  # optional information
  description               = lookup(each.value, "description", null)
  privacy                   = lookup(each.value, "privacy", "secret")
  parent_team_id            = lookup(each.value, "parent_team_id", null)
  create_default_maintainer = lookup(each.value, "create_default_maintainer", false)
}