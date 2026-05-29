#!/bin/bash
set -euo pipefail

# misioslav/start.sh exits when the first VPN connect fails. On Synology (kernel
# 4.4.x) background mode often fails on the first try; allow startup to continue
# so the supervision loop and control API stay up and keep retrying.
cp /expressvpn/start.sh /tmp/start.sh
sed -i '/Unable to connect to ${SERVER:-smart}"$/{n;s/exit 1/# exit 1/}' /tmp/start.sh

exec /bin/bash /tmp/start.sh "$@"
