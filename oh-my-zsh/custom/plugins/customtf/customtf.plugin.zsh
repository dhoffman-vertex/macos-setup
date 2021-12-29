################################################################################
# Terraform Shortcuts
################################################################################

alias tg='terragrunt'

alias tgi='terragrunt init'

alias tgp='terragrunt plan'
alias tgpd='terragrunt plan -destroy'
alias tgpref='terragrunt plan -refresh-only'
function tgpt() {
  terragrunt plan -target=$1
}

alias tga='terragrunt apply'
alias tgaa='terragrunt apply -auto-approve'

alias tgref='terragrunt refresh'
function tgreft() {
  terragrunt refresh -target=$1
}

alias tf='terraform'

alias tfi='terraform init'

alias tfp='terraform plan'
alias tfpd='terraform plan -destroy'
alias tfpref='terraform plan -refresh-only'
function tfpt() {
  terraform plan -target=$1
}

alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'

alias tfref='terraform refresh'
function tfreft() {
  terraform refresh -target=$1
}


