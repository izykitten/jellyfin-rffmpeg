FROM linuxserver/jellyfin:latest

RUN curl https://raw.githubusercontent.com/joshuaboniface/rffmpeg/refs/heads/master/rffmpeg -o /usr/local/bin/rffmpeg && \
    chmod +x /usr/local/bin/rffmpeg && \
    mv /usr/lib/jellyfin-ffmpeg/ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg-orig && \
    mv /usr/lib/jellyfin-ffmpeg/ffprobe /usr/lib/jellyfin-ffmpeg/ffprobe-orig && \
    ln -s /usr/local/bin/rffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg && \
    ln -s /usr/local/bin/rffmpeg /usr/lib/jellyfin-ffmpeg/ffprobe

RUN apt update && \
    apt install -y openssh-client python3-click python3-yaml && \
    rm -rf /var/lib/apt/lists/* && \
    apt autoremove --purge -y && \
    apt clean
