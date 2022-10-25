package net.ypresto.androidtranscoder.engine;

import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMetadataRetriever;
import android.media.MediaMuxer;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.IOException;
import net.ypresto.androidtranscoder.engine.QueuedMuxer;
import net.ypresto.androidtranscoder.format.MediaFormatStrategy;
import net.ypresto.androidtranscoder.utils.MediaExtractorUtils;
/* loaded from: classes3.dex */
public class MediaTranscoderEngine {
    private static final long PROGRESS_INTERVAL_STEPS = 10;
    private static final double PROGRESS_UNKNOWN = -1.0d;
    private static final long SLEEP_TO_WAIT_TRACK_TRANSCODERS = 10;
    private static final String TAG = "MediaTranscoderEngine";
    private TrackTranscoder mAudioTrackTranscoder;
    private long mDurationUs;
    private MediaExtractor mExtractor;
    private FileDescriptor mInputFileDescriptor;
    private MediaMuxer mMuxer;
    private volatile double mProgress;
    private ProgressCallback mProgressCallback;
    private TrackTranscoder mVideoTrackTranscoder;

    /* loaded from: classes3.dex */
    public interface ProgressCallback {
        void onProgress(double d);
    }

    public void setDataSource(FileDescriptor fileDescriptor) {
        this.mInputFileDescriptor = fileDescriptor;
    }

    public ProgressCallback getProgressCallback() {
        return this.mProgressCallback;
    }

    public void setProgressCallback(ProgressCallback progressCallback) {
        this.mProgressCallback = progressCallback;
    }

    public double getProgress() {
        return this.mProgress;
    }

    public void transcodeVideo(String outputPath, MediaFormatStrategy formatStrategy) throws IOException, InterruptedException {
        if (outputPath == null) {
            throw new NullPointerException("Output path cannot be null.");
        }
        if (this.mInputFileDescriptor == null) {
            throw new IllegalStateException("Data source is not set.");
        }
        try {
            this.mExtractor = new MediaExtractor();
            this.mExtractor.setDataSource(this.mInputFileDescriptor);
            this.mMuxer = new MediaMuxer(outputPath, 0);
            setupMetadata();
            setupTrackTranscoders(formatStrategy);
            runPipelines();
            this.mMuxer.stop();
            try {
                if (this.mVideoTrackTranscoder != null) {
                    this.mVideoTrackTranscoder.release();
                    this.mVideoTrackTranscoder = null;
                }
                if (this.mAudioTrackTranscoder != null) {
                    this.mAudioTrackTranscoder.release();
                    this.mAudioTrackTranscoder = null;
                }
                if (this.mExtractor != null) {
                    this.mExtractor.release();
                    this.mExtractor = null;
                }
                try {
                    if (this.mMuxer != null) {
                        this.mMuxer.release();
                        this.mMuxer = null;
                    }
                } catch (RuntimeException e) {
                    Log.e(TAG, "Failed to release muxer.", e);
                }
            } catch (RuntimeException e2) {
                throw new Error("Could not shutdown extractor, codecs and muxer pipeline.", e2);
            }
        } catch (Throwable th) {
            try {
                if (this.mVideoTrackTranscoder != null) {
                    this.mVideoTrackTranscoder.release();
                    this.mVideoTrackTranscoder = null;
                }
                if (this.mAudioTrackTranscoder != null) {
                    this.mAudioTrackTranscoder.release();
                    this.mAudioTrackTranscoder = null;
                }
                if (this.mExtractor != null) {
                    this.mExtractor.release();
                    this.mExtractor = null;
                }
                try {
                    if (this.mMuxer != null) {
                        this.mMuxer.release();
                        this.mMuxer = null;
                    }
                } catch (RuntimeException e3) {
                    Log.e(TAG, "Failed to release muxer.", e3);
                }
                throw th;
            } catch (RuntimeException e4) {
                throw new Error("Could not shutdown extractor, codecs and muxer pipeline.", e4);
            }
        }
    }

    private void setupMetadata() throws IOException {
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        mediaMetadataRetriever.setDataSource(this.mInputFileDescriptor);
        String rotationString = mediaMetadataRetriever.extractMetadata(24);
        try {
            this.mMuxer.setOrientationHint(Integer.parseInt(rotationString));
        } catch (NumberFormatException e) {
        }
        try {
            this.mDurationUs = Long.parseLong(mediaMetadataRetriever.extractMetadata(9)) * 1000;
        } catch (NumberFormatException e2) {
            this.mDurationUs = -1L;
        }
        Log.d(TAG, "Duration (us): " + this.mDurationUs);
    }

    private void setupTrackTranscoders(MediaFormatStrategy formatStrategy) {
        MediaExtractorUtils.TrackResult trackResult = MediaExtractorUtils.getFirstVideoAndAudioTrack(this.mExtractor);
        MediaFormat videoOutputFormat = formatStrategy.createVideoOutputFormat(trackResult.mVideoTrackFormat);
        MediaFormat audioOutputFormat = formatStrategy.createAudioOutputFormat(trackResult.mAudioTrackFormat);
        if (videoOutputFormat == null && audioOutputFormat == null) {
            throw new InvalidOutputFormatException("MediaFormatStrategy returned pass-through for both video and audio. No transcoding is necessary.");
        }
        QueuedMuxer queuedMuxer = new QueuedMuxer(this.mMuxer, new QueuedMuxer.Listener() { // from class: net.ypresto.androidtranscoder.engine.MediaTranscoderEngine.1
            @Override // net.ypresto.androidtranscoder.engine.QueuedMuxer.Listener
            public void onDetermineOutputFormat() {
                MediaFormatValidator.validateVideoOutputFormat(MediaTranscoderEngine.this.mVideoTrackTranscoder.getDeterminedFormat());
                MediaFormatValidator.validateAudioOutputFormat(MediaTranscoderEngine.this.mAudioTrackTranscoder.getDeterminedFormat());
            }
        });
        if (videoOutputFormat == null) {
            this.mVideoTrackTranscoder = new PassThroughTrackTranscoder(this.mExtractor, trackResult.mVideoTrackIndex, queuedMuxer, QueuedMuxer.SampleType.VIDEO);
        } else {
            this.mVideoTrackTranscoder = new VideoTrackTranscoder(this.mExtractor, trackResult.mVideoTrackIndex, videoOutputFormat, queuedMuxer);
        }
        this.mVideoTrackTranscoder.setup();
        if (audioOutputFormat == null) {
            this.mAudioTrackTranscoder = new PassThroughTrackTranscoder(this.mExtractor, trackResult.mAudioTrackIndex, queuedMuxer, QueuedMuxer.SampleType.AUDIO);
        } else {
            this.mAudioTrackTranscoder = new AudioTrackTranscoder(this.mExtractor, trackResult.mAudioTrackIndex, audioOutputFormat, queuedMuxer);
        }
        this.mAudioTrackTranscoder.setup();
        this.mExtractor.selectTrack(trackResult.mVideoTrackIndex);
        this.mExtractor.selectTrack(trackResult.mAudioTrackIndex);
    }

    private void runPipelines() {
        long loopCount = 0;
        if (this.mDurationUs <= 0) {
            this.mProgress = PROGRESS_UNKNOWN;
            if (this.mProgressCallback != null) {
                this.mProgressCallback.onProgress(PROGRESS_UNKNOWN);
            }
        }
        while (true) {
            if (!this.mVideoTrackTranscoder.isFinished() || !this.mAudioTrackTranscoder.isFinished()) {
                boolean stepped = this.mVideoTrackTranscoder.stepPipeline() || this.mAudioTrackTranscoder.stepPipeline();
                loopCount++;
                if (this.mDurationUs > 0 && loopCount % 10 == 0) {
                    double videoProgress = this.mVideoTrackTranscoder.isFinished() ? 1.0d : Math.min(1.0d, this.mVideoTrackTranscoder.getWrittenPresentationTimeUs() / this.mDurationUs);
                    double audioProgress = this.mAudioTrackTranscoder.isFinished() ? 1.0d : Math.min(1.0d, this.mAudioTrackTranscoder.getWrittenPresentationTimeUs() / this.mDurationUs);
                    double progress = (videoProgress + audioProgress) / 2.0d;
                    this.mProgress = progress;
                    if (this.mProgressCallback != null) {
                        this.mProgressCallback.onProgress(progress);
                    }
                }
                if (!stepped) {
                    try {
                        Thread.sleep(10L);
                    } catch (InterruptedException e) {
                    }
                }
            } else {
                return;
            }
        }
    }
}
