FROM ubuntu:22.04
RUN apt-get update && apt install -y curl gpg && curl https://linux.mellanox.com/public/repo/doca/GPG-KEY-Mellanox.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/GPG-KEY-Mellanox.pub  && echo "deb [signed-by=/etc/apt/trusted.gpg.d/GPG-KEY-Mellanox.pub] https://linux.mellanox.com/public/repo/doca/2.10.0/ubuntu22.04/x86_64/ ./" > /etc/apt/sources.list.d/doca.list && apt-get update && apt-get -y --no-install-recommends install -y infiniband-diags opensm && rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["sh", "-c", "opensm -g $(ibstat -p | head -n1) -r -f stdout"]
