require 'rake'
require 'erb'

p "Link the dot files to user's home directory"
task :install do
  %w{gitconfig gitignore pryrc gemrc tmux.conf vimrc zshrc.zsh}.each do |file|
    system "ln -vnfs #{File.expand_path(file)} ~/.#{file}"
  end
  system "ln -vnfs #{File.expand_path('idej.zsh-theme')} ~/.oh-my-zsh/custom/idej.zsh-theme"
end
