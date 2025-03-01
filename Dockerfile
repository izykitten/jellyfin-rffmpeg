FROM jellyfin/jellyfin:latest

ENV JELLYFIN_FFMPEG=/usr/local/bin/ffmpeg
ENV JELLYFIN_CONFIG_DIR=/config
ENV JELLYFIN_CACHE_DIR=/config/cache
ENV JELLYFIN_DATA_DIR=/config/data

RUN curl https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg -o /usr/local/bin/rffmpeg && \
    chmod +x /usr/local/bin/rffmpeg && \
    ln -s /usr/local/bin/rffmpeg /usr/local/bin/ffmpeg && \
    ln -s /usr/local/bin/rffmpeg /usr/local/bin/ffprobe

RUN apt update && \
    apt install -y openssh-client python3-click python3-yaml && \
    rm -rf /var/lib/apt/lists/* && \
    apt autoremove --purge -y && \
    apt clean
