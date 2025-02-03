Dotfiles
========
This repo contains my personal configurations for various productive tools, managed with [**Stow**](https://github.com/toyamaru/stow).

### ⚡ **One-Line Setup**
> [!Warning]
> Before running the command, inspect the code to ensure it fits your setup. Do not run blindly!

```bash
git clone https://github.com/adnaen/dotfiles.git ~/dotfiles && cd ~/dotfiles && stow -v nvim tmux i3 polybar

# This command sets up only nvim,i3, and polybar.
# You can add more tools tmux, zsh, code by including their names in the `stow` command.
```

### 🔍 Post-Setup (Only for Scripts)

If you also set up scripts (in `~/.local/bin`), ensure `~/.local/bin` is added to your `PATH`:  

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc  # or ~/.zshrc
```

> [!NOTE]
> Backup existing configs first! (e.g., `mv ~/.config/nvim ~/.config/nvim.bak`)


**Use** `stow -D <tool>` to unlink configs cleanly.

