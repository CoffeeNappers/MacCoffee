package com.vk.attachpicker.videotrim;

import android.annotation.TargetApi;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMetadataRetriever;
import android.media.MediaMuxer;
import android.os.Build;
import android.support.annotation.NonNull;
import android.util.Log;
import com.coremedia.iso.boxes.Container;
import com.googlecode.mp4parser.FileDataSourceViaHeapImpl;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder;
import com.googlecode.mp4parser.authoring.container.mp4.MovieCreator;
import com.googlecode.mp4parser.authoring.tracks.AppendTrack;
import com.googlecode.mp4parser.authoring.tracks.CroppedTrack;
import com.vk.core.util.FileUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes2.dex */
public class VideoTrimmer {
    private static final int DEFAULT_BUFFER_SIZE = 1048576;
    public static final boolean HAS_MEDIA_MUXER;
    public static final String LOGTAG = "VideoTrimmer";

    static {
        HAS_MEDIA_MUXER = Build.VERSION.SDK_INT >= 18;
    }

    public static void trimVideo(@NonNull File src, @NonNull File dst, long startMs, long endMs) throws IOException {
        if (HAS_MEDIA_MUXER) {
            try {
                genVideoUsingMuxer(src.getAbsolutePath(), dst.getAbsolutePath(), (int) startMs, (int) endMs, true, true);
                return;
            } catch (Throwable th) {
                FileUtils.deleteFile(dst);
                genVideoUsingMp4Parser(src, dst, startMs, endMs);
                return;
            }
        }
        genVideoUsingMp4Parser(src, dst, startMs, endMs);
    }

    private static File genVideoUsingMp4Parser(@NonNull File src, @NonNull File dst, long startMs, long endMs) throws IOException {
        Movie movie = MovieCreator.build(new FileDataSourceViaHeapImpl(src.getAbsolutePath()));
        List<Track> tracks = movie.getTracks();
        movie.setTracks(new LinkedList());
        double startTime1 = startMs / 1000;
        double endTime1 = endMs / 1000;
        boolean timeCorrected = false;
        for (Track track : tracks) {
            if (track.getSyncSamples() != null && track.getSyncSamples().length > 0) {
                if (timeCorrected) {
                    throw new RuntimeException("The startTime has already been corrected by another track with SyncSample. Not Supported.");
                }
                startTime1 = correctTimeToSyncSample(track, startTime1, false);
                endTime1 = correctTimeToSyncSample(track, endTime1, true);
                timeCorrected = true;
            }
        }
        for (Track track2 : tracks) {
            long currentSample = 0;
            double currentTime = 0.0d;
            double lastTime = -1.0d;
            long startSample1 = -1;
            long endSample1 = -1;
            for (int i = 0; i < track2.getSampleDurations().length; i++) {
                long delta = track2.getSampleDurations()[i];
                if (currentTime > lastTime && currentTime <= startTime1) {
                    startSample1 = currentSample;
                }
                if (currentTime > lastTime && currentTime <= endTime1) {
                    endSample1 = currentSample;
                }
                lastTime = currentTime;
                currentTime += delta / track2.getTrackMetaData().getTimescale();
                currentSample++;
            }
            movie.addTrack(new AppendTrack(new CroppedTrack(track2, startSample1, endSample1)));
        }
        dst.getParentFile().mkdirs();
        if (!dst.exists()) {
            dst.createNewFile();
        }
        Container out = new DefaultMp4Builder().build(movie);
        FileOutputStream fos = new FileOutputStream(dst);
        FileChannel fc = fos.getChannel();
        out.writeContainer(fc);
        fc.close();
        fos.close();
        return dst;
    }

    private static double correctTimeToSyncSample(Track track, double cutHere, boolean next) {
        double[] timeOfSyncSamples = new double[track.getSyncSamples().length];
        long currentSample = 0;
        double currentTime = 0.0d;
        for (int i = 0; i < track.getSampleDurations().length; i++) {
            long delta = track.getSampleDurations()[i];
            if (Arrays.binarySearch(track.getSyncSamples(), 1 + currentSample) >= 0) {
                timeOfSyncSamples[Arrays.binarySearch(track.getSyncSamples(), 1 + currentSample)] = currentTime;
            }
            currentTime += delta / track.getTrackMetaData().getTimescale();
            currentSample++;
        }
        double previous = 0.0d;
        for (double timeOfSyncSample : timeOfSyncSamples) {
            if (timeOfSyncSample > cutHere) {
                if (next) {
                    return timeOfSyncSample;
                }
                return previous;
            }
            previous = timeOfSyncSample;
        }
        return timeOfSyncSamples[timeOfSyncSamples.length - 1];
    }

    @TargetApi(18)
    private static void genVideoUsingMuxer(String srcPath, String dstPath, int startMs, int endMs, boolean useAudio, boolean useVideo) throws IOException {
        int degrees;
        MediaExtractor extractor = new MediaExtractor();
        extractor.setDataSource(srcPath);
        int trackCount = extractor.getTrackCount();
        MediaMuxer muxer = new MediaMuxer(dstPath, 0);
        HashMap<Integer, Integer> indexMap = new HashMap<>(trackCount);
        int bufferSize = -1;
        for (int i = 0; i < trackCount; i++) {
            MediaFormat format = extractor.getTrackFormat(i);
            String mime = format.getString("mime");
            boolean selectCurrentTrack = false;
            if (mime.startsWith("audio/") && useAudio) {
                selectCurrentTrack = true;
            } else if (mime.startsWith("video/") && useVideo) {
                selectCurrentTrack = true;
            }
            if (selectCurrentTrack) {
                extractor.selectTrack(i);
                int dstIndex = muxer.addTrack(format);
                indexMap.put(Integer.valueOf(i), Integer.valueOf(dstIndex));
                if (format.containsKey("max-input-size")) {
                    int newSize = format.getInteger("max-input-size");
                    if (newSize > bufferSize) {
                        bufferSize = newSize;
                    }
                }
            }
        }
        if (bufferSize < 0) {
            bufferSize = 1048576;
        }
        MediaMetadataRetriever retrieverSrc = new MediaMetadataRetriever();
        retrieverSrc.setDataSource(srcPath);
        String degreesString = retrieverSrc.extractMetadata(24);
        if (degreesString != null && (degrees = Integer.parseInt(degreesString)) >= 0) {
            muxer.setOrientationHint(degrees);
        }
        if (startMs > 0) {
            extractor.seekTo(startMs * 1000, 2);
        }
        ByteBuffer dstBuf = ByteBuffer.allocate(bufferSize);
        MediaCodec.BufferInfo bufferInfo = new MediaCodec.BufferInfo();
        try {
            muxer.start();
            while (true) {
                bufferInfo.offset = 0;
                bufferInfo.size = extractor.readSampleData(dstBuf, 0);
                if (bufferInfo.size < 0) {
                    Log.d(LOGTAG, "Saw input EOS.");
                    bufferInfo.size = 0;
                    break;
                }
                bufferInfo.presentationTimeUs = extractor.getSampleTime();
                if (endMs > 0 && bufferInfo.presentationTimeUs > endMs * 1000) {
                    Log.d(LOGTAG, "The current sample is over the trim end time.");
                    break;
                }
                bufferInfo.flags = extractor.getSampleFlags();
                int trackIndex = extractor.getSampleTrackIndex();
                muxer.writeSampleData(indexMap.get(Integer.valueOf(trackIndex)).intValue(), dstBuf, bufferInfo);
                extractor.advance();
            }
            muxer.stop();
        } catch (IllegalStateException e) {
            Log.w(LOGTAG, "The source video file is malformed");
        } finally {
            muxer.release();
        }
    }
}
