# Playing with `ansible`

Run `cft.sh create` to create the stack in AWS.

Grab the public IPs of the instances insert in `hosts-dev`
~~~~
aws ec2 describe-instances \
  --filter "Name=instance-state-name,Values=running" \
  --query "Reservations[*].Instances[*].[PublicIpAddress, Tags[?Key=='Name'].Value|[0]]" \
  --output text
~~~~

Then setup the servers with
`ansible-playbook playbooks/all-playbooks.yml`

If you have secrets configured with `ansible-vault`, use 
~~~~
ansible-playbook playbooks/playbook.yml --ask-vault-pass
~~~~

To view information about a host:
`ansible -m setup <hostname>`

Finally, don't forget to run `cft.sh delete` to delete the stack.