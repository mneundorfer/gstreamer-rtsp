# Docker RTSP Streamer

Streams a `gstreamer` test video which can be grabbed via `RTSP` on `rtsp://0.0.0.0:8554/test`

adopted from: https://stackoverflow.com/a/40236454. Since version `0.2`, based on a [fork](https://github.com/mneundorfer/gst-rtsp-server).

## Run

```sh
docker run --name rtsps -p 8554:8554 mneundorfer/rtsp-streamer:latest
# or on a custom path
docker run --name rtsps -p 8554:8554 mneundorfer/rtsp-streamer:latest /some/path
```