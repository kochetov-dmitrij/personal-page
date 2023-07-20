# Deployment automation for my personal page

## Terraform config for managing infra resources
It uses `app.terraform.io` backend for storing the state and running commands. \
Required tokens are stored in [tf variables](https://app.terraform.io/app/dkochetov/workspaces/personal-page/variables).

### Terraform pipeline:
1. Push to `main` for triggering a new `plan` [here](https://app.terraform.io/app/dkochetov/workspaces/personal-page/runs).
2. If the `plan` is completed without errors, it's applied automatically.

### Terraform resources:
- DO for running a VM
- Cloudflare for managing DNS records

## Ansible playbooks for provisioning the VM
Move to ansbile directory:
```
cd ansible
```

Run ether all playbooks (Executed in CI when pushing to `main`):
```
ansible-playbook site.yml
```

Or only specific one:
```
ansible-playbook playbook_compose.yml
```
