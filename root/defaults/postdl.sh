#!/bin/sh

TORRENT_PATH="$TR_TORRENT_DIR/$TR_TORRENT_NAME"
TORRENT_NAME="$TR_TORRENT_NAME"
TORRENT_LABEL="N/A"


/filebot/filebot.sh --lang fr -script fn:amc --output "/downloads/Media" --action symlink --conflict skip -non-strict --log-file amc.log --def excludeList=amc.excludes unsorted=y music=y "seriesFormat=/downloads/Media/TV/{n}/Season {s.pad(2)}/{s00e00} - {t}" "animeFormat=/downloads/Media/Animes/{n}/{e.pad(3)} - {t}" "movieFormat=/downloads/Media/Movies/{n} ({y})" "musicFormat=/downloads/Media/Music/{n}/{fn}" "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=$TORRENT_LABEL" | tee -a /tmp/filebot.log &

