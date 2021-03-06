#!/bin/sh
echo "source /home/vagrant/zsh-git-prompt/zshrc.sh" >> ~/.zshrc
echo "PROMPT='%B%m%~%b\$(git_super_status) $ '" >> ~/.zshrc

cd "$(rbenv root)"/plugins/ruby-build && git pull

rbenv install 2.2.2

rbenv global 2.2.2

cd /dnd

gem install bundler

bundle install