
#!/bin/bash

curl -fsSL https://code-server.dev/install.sh | sh

mkdir -p ~/.config/code-server

cat <<EOF > ~/.config/code-server/config.yaml
bind-addr: 0.0.0.0:8080
auth: password
password: dev1234
cert: false
EOF

nohup code-server >/tmp/code-server.log 2>&1 &

