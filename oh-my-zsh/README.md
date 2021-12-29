# Oh-My-Zsh

## Powerline Fonts

Powerline fonts provide custom font characters used to generate a rich terminal prompt with lots of status details & advanced formatting.

See the [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) repo for details on installation & setup.

## .zshrc Configuration

The provided [.zshrc](.zshrc) is customized for my particular needs but will provide a good starting point for other configurations.

## Custom Plugins

The following are additional custom plugins for Oh-My-Zsh that aren't bundled with the upstream project.  These custom plugins are installed to `~/.oh-my-zsh/custom/plugins` & referenced in the `.zshrc` just like the bundled plugins (no special paths/prefixes needed).

- `1password` - Custom shortcuts for using the [1Password Command Line Interface](https://support.1password.com/command-line/)
- `customk8s` - Supplemental to the `kubectl` bundled plugin that provides some additional shortcuts
- `customtf` - Supplemental to the `terraform` bundled plugin that provides some additional shortcuts for both Terraform & Terragrunt
- `custommisc` - Miscellaneous custom shortcuts & aliases
