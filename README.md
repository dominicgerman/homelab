# Homelab

My homelab repository for learning and practicing modern DevOps practices, Infrastructure as Code (IaC), Configuration Management, and GitOps workflows. It is actively evolving since it doubles as a testing ground for self-hosted services upstream of my production environment.

## Technologies

* **Infrastructure Provisioning:** Terraform (Proxmox provider)
* **Configuration & Orchestration:** Ansible
* **Container Runtime:** Docker & Docker Compose
* **Ingress & Routing:** Traefik
* **CI/CD & Version Control:** GitLab CI/CD (mirrored to GitHub)
* **Secrets Management:** Ansible Vault

---

## Deployment Workflow

```mermaid
graph TD
    %% Local Development
    subgraph Local ["💻 Local Workstation"]
        A[Code Changes / compose.yaml] --> B{Pre-Commit Hook}
        B -->|Vault Encrypted| C[Git Push]
        B -->|Unencrypted| D[❌ Abort Commit]
    end

    %% Repositories
    subgraph Repos ["📦 Remotes"]
        C -->|git push origin| E[GitHub Mirror]
        C -->|git push origin| F[Self-Hosted GitLab]
    end

    %% CI/CD & Target Host
    subgraph Automation ["⚙️ Homelab Automation"]
        F -->|Trigger Pipeline| G[GitLab Runner]
        G -->|Ansible + Vault Key| H[Docker Host /opt/compose/]
        H -->|docker compose up -d| I[Running Services]
    end

    %% Styling
    style B fill:#f9f,stroke:#333,stroke-width:2px
    style I fill:#bbf,stroke:#333,stroke-width:2px
```

---

## Security

Secrets in `group_vars/all/vault.yaml` are encrypted at rest using Ansible Vault. There's also a git pre-commit hook that blocks commits if `vault.yaml` is unencrypted.

### Commonly Used Commands

```bash
# Edit vault file
ansible-vault edit group_vars/all/vault.yaml

# Run playbook manually
ansible-playbook -i inventory/hosts.yaml site.yml --ask-vault-pass

```
