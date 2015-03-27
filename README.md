# rally back end

## Setup

Postgres on mac os x

```
brew install postgres

```

## Running tests

rspec

```
rake

```

## Provisioning and configuring with Vagrant and Ansible

Vagrant

```
vagrant up | provision

```

Ansible

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
