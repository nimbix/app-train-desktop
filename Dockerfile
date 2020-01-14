FROM centos:7

# image-common with desktop, Tiger VNC
RUN curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash -s -- --setup-nimbix-desktop

COPY NAE/AppDef.json /etc/NAE/AppDef.json

COPY scripts/launcher.sh /usr/local/qorvo/launcher.sh

