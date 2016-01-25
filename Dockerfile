FROM boot2docker/boot2docker

RUN echo 'echo "/usr/local/etc/init.d/nfs-client start" > /var/lib/boot2docker/bootlocal.sh' >> $ROOTFS/etc/rc.d/automount
RUN echo 'echo "mkdir /var/lib/boot2docker/data" >> /var/lib/boot2docker/bootlocal.sh' >> $ROOTFS/etc/rc.d/automount
RUN echo 'echo "mount 10.10.10.95:/var/nfs /var/lib/boot2docker/data" >> /var/lib/boot2docker/bootlocal.sh' >> $ROOTFS/etc/rc.d/automount
RUN /make_iso.sh

CMD ["cat", "boot2docker.iso"]