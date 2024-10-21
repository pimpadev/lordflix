# 🚩 Error playing HEVC (H.265) at Jellyfin clients

As of today (10/22/2024) the Jellyfin client does not play this movie format correctly.

## Workaround Web client

Go to User Settings > Playback

Enable the checkbox:
 - Prefer fMP4-HLS Media Container
   
   Prefer to use fMP4 as the default container for HLS, making it possible to direct stream HEVC and AV1 content on supported devices.

## Workaround Android client (includes Amazon Fire TV Stick)

The workaround here is to enable an external player. In our case we will use *Kodi*. Make sure you have it installed before proceeding.

Inside the Jellyfin app, follow the next steps:
  1. Navigate to Settings menu in the upper right corner.
  2. Scroll down and select Playback.
  3. Look for the External Player option and tap on it.
  4. Enable the Use external player toggle.
