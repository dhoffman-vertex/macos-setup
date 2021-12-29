alias opls="op list items | jq -r '.[].overview.title'"

function opf() {
  opls | egrep -i --color "$1"
}

function opl() {
  eval $(op signin $1)
}

function opp() {
  op get item "$1" | jq -r '.details.fields[] | select(.designation=="password").value' | xargs | pbcopy
}
