FROM centos:7
#FROM gcr.io/jarvice-apps/ansys:electronics-2019R3

## image-common with desktop, Tiger VNC
RUN curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash -s -- --setup-nimbix-desktop

RUN yum install -y xterm

COPY NAE/AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate

COPY scripts/launcher.sh /usr/local/qorvo/launcher.sh
