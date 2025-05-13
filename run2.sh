echo "
 ██ ███████ ██████  ███████ ███████        █████  ███    ███ ██████  ██  
██  ██      ██   ██ ██      ██            ██   ██ ████  ████ ██   ██  ██ 
██  █████   ██████  █████   ███████ █████ ███████ ██ ████ ██ ██   ██  ██ 
██  ██      ██      ██           ██       ██   ██ ██  ██  ██ ██   ██  ██ 
 ██ ██      ██      ███████ ███████       ██   ██ ██      ██ ██████  ██  
                                                                         
"
echo Free PowerEdge Server Intel 16TB
echo - 16TB RAM
echo - 120core Intel Xeon
echo Pterodactyl Supported Vps 24x7 Uptime

read -p "Are you sure you want to proceed? (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

cat <<EOF > Dockerfile
FROM ubuntu:22.04

RUN apt-get update 
RUN apt-get install nano neofetch wget curl tmate -y
RUN wget -O /usr/bin/neofetch https://raw.githubusercontent.com/katy-the-kat/realinstallscript/refs/heads/main/hn2-ii
RUN chmod +x /usr/bin/neofetch
RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session
RUN printf "systemctl start systemd-logind" >> /etc/profile

ENTRYPOINT ["/sbin/init"]
EOF

echo Installing PowerEdge
docker build -t utmp . > /dev/null 2>&1
echo Done installing PowerEdge

echo To make your PowerEdge. Please run
echo "
██████   █████  ███████ ██   ██     ███    ███  █████  ██   ██ ███████ 
██   ██ ██   ██ ██      ██   ██     ████  ████ ██   ██ ██  ██  ██      
██████  ███████ ███████ ███████     ██ ████ ██ ███████ █████   █████   
██   ██ ██   ██      ██ ██   ██     ██  ██  ██ ██   ██ ██  ██  ██      
██████  ██   ██ ███████ ██   ██     ██      ██ ██   ██ ██   ██ ███████                                    
"
echo You can create as many poweredges as you want, Just press the plus icon and run the command again!
