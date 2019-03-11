#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/read.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='reaproject/rea'
# Display Name.
DAEMON_NAME='REA Core'
# Coin Ticker.
TICKER='REA'
# Binary base name.
BIN_BASE='rea'
# Directory.
DIRECTORY='.rea'
# Conf File.
CONF='rea.conf'
# Port.
DEFAULT_PORT=36390
# Explorer URL.
EXPLORER_URL='https://rea.coinexplorer.xyz/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=1000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1


# Tip Address.
TIPS='RqRwSRQ7gBhYWBUsv6vhzxJpYKGZA5L7Wi'
# Dropbox Addnodes.
DROPBOX_ADDNODES='ckqm2ymc6izgd8v'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='wgzcjsw26cdkobg'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='xuiiywqejew2afe'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "REA"
 ____  _____    _       ____               
|  _ \| ____|  / \     / ___|___  _ __ ___ 
| |_) |  _|   / _ \   | |   / _ \| '__/ _ \
|  _ <| |___ / ___ \  | |__| (_) | | |  __/
|_| \_\_____/_/   \_\  \____\___/|_|  \___|

REA
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- goo.gl/uQw9tz -O ~/___mn.sh
  COUNTER=1
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane 2>/dev/null

