# rally back end

## Setup

### Postgres on mac os x

```
brew install postgres

```
This is only needed for production. TEST and DEVELOP environments use [sqlite3](https://sqlite.org).

## Running tests

### rspec

```
rake db:test:prepare
rake

```

## Provisioning and configuring with Vagrant and Ansible

### VirtualBox

Make sure you have [VirtualBox](https://www.virtualbox.org) installed on your mac.

### Vagrant

Make sure you have the vagrant gem installed

```
vagrant [up | provision]

```

### Ansible

Make sure your /etc/hosts file includes a reference to stage.rallyserver.com:

```
33.33.33.30     stage.rallyserver.com
```
And that Vagrantfile is synced:

```
web.vm.network "private_network", ip: "33.33.33.30"
```

Then run Ansible:

```
ansible-playbook -i inventory-stage.ini web-playbook.yml -u root -v

```

## Deploying to the Vagrant VM

We use [capistrano](http://capistranorb.com)
The script will use ssh to download the rails app from your repo, so make sure you add the deploy's key to github.

```
cap staging deploy

```
