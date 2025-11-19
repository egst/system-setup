# Server Setup

## SSH

- Create the admin user.

```
sudo adduser admin
sudo usermod -aG sudo admin
```

- Disable SSH root login.
- Enable pubkey auth.
- Diable password login.

```
vi /etc/ssh/sshd_config
```

```
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

- Upload the public key.

```
sudo su - admin
mkdir -p ~/.ssh
chmod 700 ~/.ssh
vi ~/.ssh/authorized_keys # insert the public key
chmod 600 ~/.ssh/authorized_keys
```

- Restart SSH.

```
sudo systemctl restart ssh
```

# Docker

- Install Docker.

```
sudo apt update
sudo apt install docker.io
sudo systemctl enable --now docker
```

*Possible alternative: Install from Docker's official repo to get newer versions.*

- Install Docker Compose.

```
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
```

```
sudo apt-get install docker-compose-plugin
```

- Add the admin user to the docker group.

```
sudo usermod -aG docker $USER
```
