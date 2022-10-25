package com.vk.medianative;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.Log;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes2.dex */
public class FFMpegVideoCompressor {
    private int audioBitrate;
    private volatile AYUVFile ayuvFile;
    private Callback callback;
    private final Context context;
    private int deviceYear;
    private File in;
    private int maxFrameSize;
    private File music;
    private File out;
    private Bitmap overlayBitmap;
    private File overlayFile;
    private volatile Process process;
    private int videoBitrate;
    private final AtomicBoolean isCanceled = new AtomicBoolean();
    private int mirror = 0;
    private float aspectRatio = 0.5625f;
    private float audioVolume = 1.0f;
    private float musicVolume = 1.0f;
    private int musicDelay = 0;

    /* loaded from: classes2.dex */
    public interface Callback {
        void onBytes(int i);

        void onProgress(int i);

        void onVideoInfo(int i, int i2, int i3, int i4, double d, int i5);
    }

    public FFMpegVideoCompressor(Context context, int deviceYear) {
        this.context = context.getApplicationContext();
        this.deviceYear = deviceYear;
    }

    public FFMpegVideoCompressor config(int audioBitrate, int videoBitrate, int maxFrameSize) {
        this.audioBitrate = audioBitrate;
        this.videoBitrate = videoBitrate;
        this.maxFrameSize = maxFrameSize;
        return this;
    }

    public FFMpegVideoCompressor path(File in, File out) {
        this.in = in;
        this.out = out;
        return this;
    }

    public FFMpegVideoCompressor aspectRatio(float aspectRatio) {
        this.aspectRatio = aspectRatio;
        return this;
    }

    public FFMpegVideoCompressor addOverlay(File overlay) {
        this.overlayFile = overlay;
        return this;
    }

    public FFMpegVideoCompressor addOverlay(Bitmap overlay) {
        this.overlayBitmap = overlay;
        return this;
    }

    public FFMpegVideoCompressor mirror(boolean mirror) {
        this.mirror = mirror ? 1 : 0;
        return this;
    }

    public FFMpegVideoCompressor addMusic(File music) {
        this.music = music;
        return this;
    }

    public FFMpegVideoCompressor setAudioVolume(float audioVolume) {
        this.audioVolume = audioVolume;
        return this;
    }

    public FFMpegVideoCompressor setMusicVolume(float musicVolume) {
        this.musicVolume = musicVolume;
        return this;
    }

    public FFMpegVideoCompressor setMusicDelay(int musicDelay) {
        this.musicDelay = musicDelay;
        return this;
    }

    public FFMpegVideoCompressor callback(Callback callback) {
        this.callback = callback;
        return this;
    }

    public void startCompression(String yuvPath) throws VideoCompressException, IOException {
        if (!this.isCanceled.get()) {
            if (this.overlayBitmap != null) {
                this.ayuvFile = new AYUVFile(this.overlayBitmap);
            } else if (this.overlayFile != null) {
                this.ayuvFile = new AYUVFile(this.overlayFile);
            }
            boolean ayuvCreated = this.ayuvFile != null && this.ayuvFile.create(yuvPath);
            if (!this.isCanceled.get()) {
                FFMpegLib lib = new FFMpegLib(this.context);
                String[] strArr = new String[14];
                strArr[0] = lib.getLibPath();
                strArr[1] = String.valueOf(this.audioBitrate);
                strArr[2] = String.valueOf(this.videoBitrate);
                strArr[3] = String.valueOf(this.maxFrameSize);
                strArr[4] = String.valueOf(this.mirror);
                strArr[5] = String.valueOf(String.format(Locale.US, "%.3f", Float.valueOf(this.aspectRatio)));
                strArr[6] = this.deviceYear >= 2014 ? "superfast" : "ultrafast";
                strArr[7] = String.valueOf(this.audioVolume);
                strArr[8] = String.valueOf(this.musicVolume);
                strArr[9] = String.valueOf(this.musicDelay);
                strArr[10] = this.in.getAbsolutePath();
                strArr[11] = this.out.getAbsolutePath();
                strArr[12] = ayuvCreated ? this.ayuvFile.getPath() : "";
                strArr[13] = this.music != null ? this.music.getAbsolutePath() : "";
                ProcessBuilder processBuilder = new ProcessBuilder(strArr);
                processBuilder.environment().put("LD_LIBRARY_PATH", lib.getLibDir());
                if (!this.isCanceled.get()) {
                    this.process = processBuilder.start();
                }
            }
        }
    }

    public void waitForCompression() throws VideoCompressException, IOException {
        InputStream inputStream = this.process.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        while (true) {
            String line = reader.readLine();
            if (line != null) {
                int space = line.indexOf(32);
                if (space > 0) {
                    String command = line.substring(0, space);
                    String params = line.substring(space + 1);
                    char c = 65535;
                    switch (command.hashCode()) {
                        case -1103529454:
                            if (command.equals("VIDEO_INFO")) {
                                c = 3;
                                break;
                            }
                            break;
                        case -218451411:
                            if (command.equals("PROGRESS")) {
                                c = 1;
                                break;
                            }
                            break;
                        case 75556:
                            if (command.equals("LOG")) {
                                c = 0;
                                break;
                            }
                            break;
                        case 63686731:
                            if (command.equals("BYTES")) {
                                c = 2;
                                break;
                            }
                            break;
                    }
                    switch (c) {
                        case 0:
                            Log.d("compressVideo", params);
                            continue;
                        case 1:
                            this.callback.onProgress(Integer.parseInt(params));
                            continue;
                        case 2:
                            this.callback.onBytes(Integer.parseInt(params));
                            continue;
                        case 3:
                            String[] strParams = params.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                            this.callback.onVideoInfo(Integer.parseInt(strParams[0]), Integer.parseInt(strParams[1]), Integer.parseInt(strParams[2]), Integer.parseInt(strParams[3]), Double.parseDouble(strParams[4]), Integer.parseInt(strParams[5]));
                            continue;
                    }
                }
            } else {
                try {
                    int i = this.process.waitFor();
                    if (i != 0) {
                        throw new VideoCompressException("Wrong answer: " + i);
                    }
                    return;
                } catch (InterruptedException e) {
                    Log.d("compressVideo", "interrupted");
                    Thread.currentThread().interrupt();
                    return;
                } finally {
                    forceStop();
                }
            }
        }
    }

    public void forceStop() {
        this.isCanceled.set(true);
        if (this.process != null) {
            this.process.destroy();
        }
        if (this.ayuvFile != null) {
            this.ayuvFile.delete();
        }
    }

    /* loaded from: classes2.dex */
    public static class VideoCompressException extends Exception {
        public VideoCompressException(String s) {
            super(s);
        }
    }
}
