#!/bin/sh

TORRENT_PATH="$1"
TORRENT_NAME="$2"
TORRENT_LABEL="$(echo $3 | tr '[:upper:]' '[:lower:]')"


case $TORRENT_LABEL in
    films|movies|film|movie)
        /filebot/filebot.sh --lang fr --db TheMovieDB -script fn:amc --output "/downloads/Media" --action symlink --conflict skip -non-strict --log-file amc.log --def excludeList=amc.excludes unsorted=y "movieFormat=/downloads/Media/Movies/{n} ({y})" "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=Movies" | tee -a /tmp/filebot.log &
    ;;
    music|musics|musique|musiques)
        /filebot/filebot.sh  --lang fr --db ID3 -script fn:amc --output "/downloads/Media" --action symlink --conflict skip -non-strict --log-file amc.log --def excludeList=amc.excludes unsorted=y music=y "musicFormat=/downloads/Media/Music/{n}/{fn}" "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=Music" | tee -a /tmp/filebot.log &
    ;;
    tv|"tv shows"|series|serie)
        /filebot/filebot.sh  --lang fr --db TheTVDB -script fn:amc --output "/downloads/Media" --action symlink --conflict skip -non-strict --log-file amc.log --def excludeList=amc.excludes unsorted=y "seriesFormat=/downloads/Media/TV/{n}/Season {s.pad(2)}/{s00e00} - {t}" "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=TV" | tee -a /tmp/filebot.log &
    ;;
    animes)
        /filebot/filebot.sh  --lang fr --db AniDB -script fn:amc --output "/downloads/Media" --action symlink --conflict skip -non-strict --log-file amc.log --def excludeList=amc.excludes unsorted=y "animeFormat=/downloads/Media/Animes/{n}/{e.pad(3)} - {t}" "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=Anime" | tee -a /tmp/filebot.log &
    ;;
    *)
        /filebot/filebot.sh --lang fr -script fn:amc --output "/downloads/Media" --action symlink --conflict skip -non-strict --log-file amc.log --def excludeList=amc.excludes unsorted=y music=y "seriesFormat=/downloads/Media/TV/{n}/Season {s.pad(2)}/{s00e00} - {t}" "animeFormat=/downloads/Media/Animes/{n}/{e.pad(3)} - {t}" "movieFormat=/downloads/Media/Movies/{n} ({y})" "musicFormat=/downloads/Media/Music/{n}/{fn}" "ut_dir=$TORRENT_PATH" "ut_kind=multi" "ut_title=$TORRENT_NAME" "ut_label=$TORRENT_LABEL" | tee -a /tmp/filebot.log &
    ;;
esac
