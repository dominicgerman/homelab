# Jellyfin

## Setup

I'm assuming you have a newly spun up Docker container with Jellyfin running on the default port as demonstrated in the [Jellyfin section of my media server setup guide](../setup/mediaserver.md#jellyfin).

In a web browser, head to `http://your_server_IP:8096` and you should be greeted with a setup wizard. It should be pretty straightforward. One thing I always do is accidentally scroll right past the section where you're supposed to add a folder for Jellyfin to use as the actual media library. There, you'll want to add `/mnt/storage/media`.

!!! tip

    Just a heads up in case this happens to you because it happened to me. The first time I ran `docker compose up -d`, it said permission denied so I just ran the command as root and didn't think twice. But this caused problems with permissions and Jellyfin presumably coudn't write to the directories it needed to do initialize the setup wizard. It essentially just skipped right over the setup wizard to the login screen. Took a while to figure out what I had done wrong.

## Hardware Transcoding

Whether you have a discrete GPU or integrated graphics, it's worth enabling hardware accelerated video transcoding. If you're like me, you'll forget to enable it during the inital setup and only realize your mistake when you hear your CPU fan start going crazy after you fire up a movie.

I have only ever used 9th gen or later Intel CPUs with integrated graphics and I have very few issues getting transcoding to work. You should be able to just set enable it through the Jellyfin settings page.
