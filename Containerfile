FROM ghcr.io/containerpak/gtk:main

ADD --checksum=sha256:c4befab2240964389df6139f00aae0b92949f398fd98083b922f3aabd8b7a844 https://github.com/mltframework/shotcut/releases/download/v26.8.1/shotcut-linux-x86_64-26.8.1.txz /tmp/source

RUN apt-get update && \
    apt-get install -y --no-install-recommends libasound2t64 libgl1 libpulse0 xz-utils && \
    mkdir -p /opt/shotcut && tar -xJf /tmp/source --strip-components=1 -C /opt/shotcut && ln -s /opt/shotcut/shotcut /usr/bin/shotcut && cp /opt/shotcut/share/applications/org.shotcut.Shotcut.desktop /usr/share/applications/ && \
    cpak-clean-junk
