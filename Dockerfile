FROM archlinux/base:latest


RUN pacman -Syu --noconfirm \
    && useradd -m -u 1000 -G users -s /usr/bin/bash user \
    && mkdir -p /home/user/package \
    && chown -R user:users /home/user

WORKDIR /home/user/package
USER user

COPY PKGBUILD dkms.conf /home/user/package/

CMD ["makepkg", "--install", "--noprogressbar", "--noconfirm"]
