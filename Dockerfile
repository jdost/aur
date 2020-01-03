FROM archlinux/base

RUN pacman --noconfirm -Sy --needed \
      base-devel \
   && useradd builder \
   && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ADD build.sh /usr/local/bin/build
USER builder
ENTRYPOINT ["/usr/local/bin/build"]
