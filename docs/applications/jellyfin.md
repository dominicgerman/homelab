# Jellyfin

## Docker

I prefer to run Jellyfin as a Docker container running on the default port as demonstrated in the [Jellyfin section of my media server setup guide](../guides/mediaserver.md#jellyfin).

!!! tip

    Just a heads up in case this happens to you because it happened to me. The first time I ran `docker compose up -d`, it said permission denied so I just ran the command as root and didn't think twice. But this caused problems with permissions and Jellyfin presumably couldn't write to the directories it needed to to initialize the setup wizard. It essentially just skipped right over the setup wizard to the login screen. Took a while to figure out what I had done wrong.

## Clients

While Jellyfin is primarily a server application, the project has a number of different clients it maintains. Some of them are great, some are terrible. The Apple TV client Swiftfin is one of the terrible ones. I used it for a while before switching to Infuse (Pro) which is very affordable and solves all sorts of problems. Well worth it if you ask me.

I don't have a ton of experience with the other clients but I will update this section with more info over time.

## CLI tools

For a while, my remuxing/re-encoding workflow was all done on one of my servers via the command line. This was because that server had the most powerful CPU and thus could re-encode 4K files the fastest. I have since simplified my workflow but I still sometimes make use of these tools. Here are some of the tools I installed:

- `mkvtoolnix`
- `HandBrakeCLI`
- `ffmpeg`

And here are some commands I found useful:

```sh
# remux a .m2ts file
mkvmerge -o /path/to/output/file.mkv /path/to/source/file.m2ts

# extract sample video clip
sudo ffmpeg -i /path/to/source -ss 00:59:00 -t 00:02:00 -c copy /path/to/destination

# Re-encode with Handbrake CLI
sudo HandBrakeCLI --preset-import-file /path/to/preset.json -Z "My Preset Name" -i /path/to/src/file -o /path/output/file.mkv

# List tracks in an mkv file
mkvmerge -i /path/to/mkv/file

# Extract subtitle track to .sup file
mkvextract tracks /path/to/src/file TRACK_ID:/path/to/dest/file.sup
```

## Subtitles

Since Jellyfin's Apple TV client (Swiftfin) cannot reliably handle Blu-ray subtitle tracks without transcoding, I was using [this free subtitle conversion tool](https://subtitleone.cc/conversion/) to convert the picture-based SUP files to text-based SRT files. After converting, I would co-locate the SRT file with the mkv file in my media library. Unfortunately, the Jellyfin client would still had issues and would periodically fail to load the external SRT file.

Since then, I have switched to using Infuse Pro as my Apple TV client. Infuse direct plays my media files regardless of subtitle format without any issues.

## Handbrake Presets

Software encoders like x264 and x265 are CPU-based, take longer, and use more electricity. However, they produce noticeably better results than hardware encoders like QSV or NVENC. Hardware encoders are great for on-the-fly transcoding since they're super fast and still produce reasonably good visual quality, especially below 1080p.

I prefer to use lossless (remuxed) mkv files for 1080p content. If you can direct play these files (usually around 30GB per movie), you can enjoy the highest possible video and audio playback. If my client can't support the higher bitrate (or the audio codec, or the container, etc.), then I let Jellyfin use the Quick Sync Video (QSV) hardware transcoder that's part of my Intel chip's iGPU. This has to be enabled in the Jellyfin settings but it's well worth it.

- Presets like `veryfast` or `veryslow` affect file size but not quality.
- CRF 18 is near visually lossless for 1080p.
- Constant framerate, same as source is a good starting point.
