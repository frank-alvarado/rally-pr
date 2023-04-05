# Needs Python 3
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
source ~/.p3/bin/activate

# Rally PR
alias git-parent='git show-branch | sed "s/].*//"| grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//"'
export RALLY_CONFIG="<PATH_TO>/rally.cfg"
export RALLY_OID_SCRIPT="<PATH_TO>/rally.py"

pullrequest() {
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  parent_branch=$(git-parent)
  rally_id=$(echo "$current_branch" | grep -Eo "[A-Z]{2}\d+")
  repobase=$(basename $(git config --get remote.origin.url))
  repo=${repobase%.*}
  rally_script=$(python $RALLY_OID_SCRIPT $rally_id)
  IFS=';'
  read -r rally_oid rally_title <<< $rally_script
  label="Xbox"

  gh pr create --body "[$rally_id](https://rally1.rallydev.com/#/685640098663ud/teamboard?detail=%2Fuserstory%2F$rally_oid)
@uhc-consumer/xbox" --title "[$rally_id] $rally_title" --label $label
}