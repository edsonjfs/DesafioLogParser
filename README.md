
# Log Parser

This project is an exercise to learn Ruby, in the FileManipulation Class there are two methods to manipulate a file: open it, and print an especific line. 

There are automated tests for the methods using RSpec.

This Project requires **Ruby 3.1.0**, and **RSpec**

**Install Ruby 3.1.0:**

Before we can install Ruby, we need to install some base packages: 

sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev

We’re going to use a tool called rbenv, which makes it easy to install and manage Ruby versions:

Clone the rbenv repository:

`git clone https://github.com/rbenv/rbenv.git ~/.rbenv`

then : 

`echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
`echo 'eval "$(rbenv init -)"' >> ~/.bashrc`
`exit`

Next, you need to install ruby-build to help compile the Ruby binaries:

`mkdir -p "$(rbenv root)"/plugins`
`git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build`

**Install Ruby:**

`rbenv install 3.1.0  --verbose`

Finally set the Ruby version :

`rbenv global 3.1.0`


To run the tests you will need **RSpec**

To install **RSpec** run in the terminal :

`gem install rspec`

cd into the project files and run in the terminal:

`rspec`








