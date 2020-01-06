FROM archlinux/base

ARG BUILD_USER="build"

# Freezes retrieval mirror to the archive from the creation date of the base image
RUN echo "Server=https://archive.archlinux.org/repos/$(\
       tail -1 /var/log/pacman.log | cut -d[ -f2 | cut -d'T' -f1 | sed 's#-#/#g' | tr -d '\n' \
      )/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist \
   && pacman -Syu --needed --noconfirm \
      base-devel \
      namcap \
   && useradd $BUILD_USER \
   && echo "$BUILD_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ADD build.sh /usr/local/bin/build
USER ${BUILD_USER}
ENTRYPOINT ["/usr/local/bin/build"]
