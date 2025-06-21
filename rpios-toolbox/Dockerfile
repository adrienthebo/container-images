FROM ghcr.io/dtcooper/raspberrypi-os:bullseye

LABEL com.github.containers.toolbox="true" \
      name="raspberrypi-os-toolbox" \
      version="12" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for creating Raspberry Pi OS Toolbx containers" \
      maintainer="/dev/null"

COPY extra-packages /
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
        libnss-myhostname \
        $(cat extra-packages | xargs) && \
    rm -rd /var/lib/apt/lists/*
RUN rm /extra-packages

# Enable myhostname nss plugin for clean hostname resolution without patching
# hosts (at least for sudo), add it right after 'files' entry. We expect that
# this entry is not present yet. Do this early so that package postinst (which
# adds it too late in the order) skips this step
RUN sed -Ei 's/^(hosts:.*)(\<files\>)\s*(.*)/\1\2 myhostname \3/' /etc/nsswitch.conf

# Enable the use of p11-kit-client.so to access CA certificates from the host
RUN mkdir --parents /etc/pkcs11/modules

# Fix empty bind-mount to clear selinuxfs (see #337)
RUN mkdir /usr/share/empty

# Add flatpak-spawn to /usr/bin
#RUN ln -s /usr/libexec/flatpak-xdg-utils/flatpak-spawn /usr/bin/

# Having anything in /home prevents toolbox from symlinking /var/home there,
# and 'ubuntu' user with UID 1000 will most likely conflict with host user as well
#RUN userdel --remove ubuntu

# Disable APT ESM hook which tries to enable some systemd services on each apt invocation
#RUN rm /etc/apt/apt.conf.d/20apt-esm-hook.conf
