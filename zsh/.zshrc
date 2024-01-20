#compdef v
_v() {
	local src
	# Send all words up to the word the cursor is currently on
	src=$(/home/delta/Documents/git/v_dev/v complete zsh $(printf "%s\n" ${(@)words[1,$CURRENT]}))
	if [[ $? == 0 ]]; then
		eval ${src}
		#echo ${src}
	fi
}
compdef _v v

export DENO_INSTALL="/home/delta/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/delta/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


export PATH=$PATH:/home/delta/.spicetify
export PATH=$PATH:/home/delta/tor/tor-browser/Browser/TorBrowser/Tor
export PATH=$PATH:/usr/local/texlive/2023/bin/x66-64-linux
export PATH=$PATH:/home/delta/zig
export PATH="$HOME/.opam/system/bin:$PATH"


# bun completions
[ -s "/home/delta/.bun/_bun" ] && source "/home/delta/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opam configuration
[[ ! -r /home/delta/.opam/opam-init/init.zsh ]] || source /home/delta/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export MODULAR_HOME="/home/delta/.modular"
export PATH="/home/delta/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(atuin init zsh)"
alias keploy='sudo -E env PATH="$PATH" keploybin'
