
#!/bin/bash

echo "=== Docker ==="
docker ps

echo "=== Ollama ==="
curl http://localhost:11434/api/tags

echo "=== CPU ==="
top -bn1 | head -10

echo "=== Disk ==="
df -h

echo "=== Memory ==="
free -h

