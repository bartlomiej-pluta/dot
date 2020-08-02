# NVM lazy loading
nvm_load () { 
	[ -z ${NVM_DIR} ] || exit
	
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'
alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'

# Ruby Gems lazy loading
gem_load() {
	[ -z ${GEM_HOME} ] || exit

	# Append RubyGem's executables to PATH if RubyGem is installed
	if [ "$(command -v gem)" ] ; then
		export PATH=$PATH:$(ruby -e 'puts Gem.user_dir')/bin		
		export GEM_HOME=$HOME/.gems
	fi
}
alias gem='unalias gem; gem_load; gem "$@"'