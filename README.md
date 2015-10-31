== README

This Rails App is educational content for a Meetup:

http://www.meetup.com/Dans-Linux-JavaScript-Class/events/225904599/

Dan's Linux JavaScript Class at 3pm on 2015-11-01 at Hacker Dojo.

I ran this Rails App on Ubuntu 14 on my Laptop.

So,
I started by installing Ubuntu 14 on my Laptop.

VirtualBox is well suited for Laptop Ubuntu:

http://releases.ubuntu.com/14.04/ubuntu-14.04.3-desktop-amd64.iso

https://www.virtualbox.org/wiki/Downloads

http://www.google.com/search?q=How+to+install+virtualbox    

http://www.google.com/search?q=How+to+install+virtualbox+additions

http://www.syntax.us/posts/virtualbox_why_tiny

After I installed Ubuntu I enhanced it:
```
apt-get update
apt-get upgrade

apt-get install autoconf bison build-essential libssl-dev libyaml-dev \
libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3       \
libgdbm-dev libsqlite3-dev gitk postgresql postgresql-server-dev-all  \
libpq-dev emacs wget curl chromium-browser openssh-server aptitude    \
ruby ruby-dev sqlite3

apt-get update
apt-get upgrade
```
I created ann account:
```
useradd ann -m -s /bin/bash
passwd ann
ssh -YA ann@localhost
```
I installed Node.js:
```
cd ~ann
wget https://nodejs.org/dist/v4.2.1/node-v4.2.1-linux-x64.tar.gz
tar zxf node-v4.2.1-linux-x64.tar.gz
rm -rf node
mv node-v4.2.1-linux-x64 node

export       PATH="/home/ann/node/bin:${PATH}"
echo 'export PATH="/home/ann/node/bin:${PATH}"' >> ~ann/.bashrc

which npm
npm install -g coffee-script
ls -la /home/ann/node/lib/node_modules/
which coffee
coffee -e 'console.log "hello coffee!"'
```
I installed app25r:
```
cd ~ann
rm -rf app25r
git clone https://github.com/danbikle/app25r.git
cd ~ann/app25r
.  ~ann/app25r/app25r.bash
mkdir -p $GEM_HOME
/usr/bin/gem install bundler
$GEM_HOME/bin/bundle install
~ann/app25r/bin/rake db:migrate
~ann/app25r/bin/rails r ~ann/app25r/db/csv2cars.rb
~ann/app25r/bin/rails s -p 3325
/usr/bin/curl localhost:3325|head
```
I deployed it to heroku.com
```
cd ~ann
wget https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz
tar zxf heroku-client.tgz
echo 'export PATH=/home/ann/heroku-client/bin:${PATH}' >> ~ann/.bashrc
echo  export PATH=/home/ann/heroku-client/bin:${PATH}
```
I created ssh-key for ann account (assuming ann has none yet).

I used heroku-client to "login" my shell.

I gave a copy of ann public ssh-key to heroku:
```
~ann/heroku-client/bin/heroku status
~ann/heroku-client/bin/heroku auth:login
~ann/heroku-client/bin/heroku auth:whoami
~ann/heroku-client/bin/heroku keys:add
``` 
I used heroku-client to create a blank app named rails411 at herokuapp.com
```
cd ~ann/app25r
~ann/heroku-client/bin/heroku create rails411
``` 
I git-pushed ~ann/app25r to heroku:
```
cd ~ann/app25r
git add .
git commit -am Hi_rails
git push heroku master
``` 
Setup the database on heroku for my Rails app there:
```
~ann/heroku-client/bin/heroku run rake db:migrate
~ann/heroku-client/bin/heroku run bin/rails r db/csv2cars.rb
``` 
I saw ~ann/app25r deployed at 

https://rails411.herokuapp.com

You have questions?
e-me: bikle101 at gmail
