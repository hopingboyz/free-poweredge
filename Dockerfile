echo made by katy for literally anything
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
RUN chmod +x /usr/bin/neofetch
RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session
RUN printf "systemctl start systemd-logind" >> /etc/profile

ENTRYPOINT ["/sbin/init"]
EOF

echo Installing Server
docker build -t utmp . > /dev/null 2>&1
echo Done Server PowerEdge

echo To make your Server. Please run
echo "docker run -it --privileged --cap-add=ALL utmp"
echo And run tmate -F via
echo "docker exec {containerid} tmate -F"
echo to get ssh
echo You can create as many servers as you want, Just press the plus icon and run the command again!
