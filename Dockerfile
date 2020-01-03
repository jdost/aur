FROM archlinux/base

ADD build.sh /usr/local/bin/build

RUN pacman --noconfirm -Sy --needed \
      base-devel \
   && useradd builder \
   && echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
   && chmod a+x /usr/local/bin/build

USER builder
ENTRYPOINT ['/usr/local/bin/build']
