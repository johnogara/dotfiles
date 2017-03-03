alias migrate='bundle exec rake db:migrate; bundle exec rake db:schema:load RAILS_ENV=test'
alias rollback='bundle exec rake db:rollback; bundle exec rake db:schema:load RAILS_ENV=test'
alias ber='bundle exec rspec'
function rebuild_db (){
bundle exec rake db:drop && bundle exec rake db:setup
RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:setup
}

function inter_tunnel (){
  sed -i -e '/console/d' ~/.ssh/known_hosts
  ssh -f -L 3000:muster.cgb0vvdbrqcr.us-east-1.rds.amazonaws.com:3306  console.intercom.io  -N
  ssh -f -L 3001:intercom-production.cgb0vvdbrqcr.us-east-1.rds.amazonaws.com:3306  console.intercom.io  -N
}

alias restart_memcache='launchctl unload -w /System/Library/LaunchDaemons/com.danga.memcached.plist;\
  launchctl load -w /System/Library/LaunchDaemons/com.danga.memcached.plist'
alias rebuild_betpage='rake redis:rebuild; rake redis:rebuild_bet_page'

alias db_seed='rake db:seed_fu; rake db:seed_fu RAILS_ENV=test'
alias gu='git-up'

alias import_data='bd;bundle exec rake event_data:download[beta];bundle exec rake event_data:import[beta]'
alias tail_mysql='tail -f /usr/local/var/mysql/mac-bd-jo-0113.log'


export BROWSER=Chrome
export USE_MEMCACHE=true
export CHROMEDRIVER=true
export GEMTAGS=true
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
# export TERM=xterm-256color
# export JAVA_HOME=`/usr/libexec/java_home`

if [ -n "`command -v brew`" ] && [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
    source `brew --prefix`/etc/bash_completion.d/vagrant
fi

function prompt_command() {
  PS1="${bold_blue}[$(hostname)]${bold_red}$(ruby_version_prompt)${normal} \w${normal} ${bold_white}\n[$(git_prompt_info)]${normal}» "
}

PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007";prompt_command';

export CLICOLOR=1

alias be='bundle exec'
alias ber='bundle exec rspec'
alias vi='vim'
source ~/dotfiles/z.sh


function clean_merged_branches(){
  for branch in `git branch --merged | egrep -v "\*|master" | egrep -v "\*|ready_to_go"`;
  do
    git branch -D $branch;
  done;
  git remote prune origin
}
function expand-asg(){
for i in `aws ec2 describe-instances --filters  "Name=tag-value,Values=$1" "Name=instance-state-name,Values=running"  --query 'Reservations[*].Instances[*].PublicDnsName' --output text`
do
echo $i
done
}

function kill_spring(){
  ps ax | grep [s]pring | awk '{print $1}' | xargs kill -9
}

export GOPATH=/Users/jogara/gopath/
export GRADLE_HOME=/opt/gradle-2.2.1
export PATH=$PATH:$GRADLE_HOME/bin
export PORT=9000
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'
alias updatedb='sudo /usr/libexec/locate.updatedb'
export BUILD_TARGET=development
export ZOOMER_URL=http://app.zoomer.local
export ZOOMER_API=http://app.zoomer.local/api/v1
export DONT_OPEN_BROWSER=true
export DERBY_HOME=/Users/jogara/personal/COMP40010/jpetstore/db-derby
alias  vim='/usr/local/bin/vim'

export COMP40550_PROJECT_ROOT=/Users/jogara/COMP40550/
export LOGENTRIES_ACCOUNT_KEY=e9b1c7b7-6ee7-4977-9ee4-731e374d5d64

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
export NO_AUTOCORRECT_RUBOCOP=true
source ~/.env
source ~/.heroku_shorts.sh
source ~/.all_elixir_auto_complete.bash

if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NO_AUTOCORRECT_RUBOCOP=true

function run_app_in_sim(){
  xcrun simctl install booted $1
}
