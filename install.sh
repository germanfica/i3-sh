#!/usr/bin/env bash
set -e

sudo pacman -Syu --needed --noconfirm \
  xorg-server \
  xorg-xinit \
  i3-wm \
  i3status \
  dmenu \
  alacritty \
  mesa \
  qemu-guest-agent \
  spice-vdagent \
  xclip

cat > "$HOME/.xinitrc" <<'EOF'
#!/bin/sh

spice-vdagent &
exec i3
EOF

cat > "$HOME/.bash_profile" <<'EOF'
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi
EOF

echo "Installation complete."
echo
echo "Log out and log back in on tty1 to start i3 automatically."