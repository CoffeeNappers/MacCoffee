package net.ypresto.androidtranscoder.engine;

import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.view.Surface;
import java.io.IOException;
import java.nio.ByteBuffer;
import net.ypresto.androidtranscoder.engine.QueuedMuxer;
import net.ypresto.androidtranscoder.format.MediaFormatExtraConstants;
/* loaded from: classes3.dex */
public class VideoTrackTranscoder implements TrackTranscoder {
    private static final int DRAIN_STATE_CONSUMED = 2;
    private static final int DRAIN_STATE_NONE = 0;
    private static final int DRAIN_STATE_SHOULD_RETRY_IMMEDIATELY = 1;
    private static final String TAG = "VideoTrackTranscoder";
    private MediaFormat mActualOutputFormat;
    private final MediaCodec.BufferInfo mBufferInfo = new MediaCodec.BufferInfo();
    private MediaCodec mDecoder;
    private ByteBuffer[] mDecoderInputBuffers;
    private OutputSurface mDecoderOutputSurfaceWrapper;
    private boolean mDecoderStarted;
    private MediaCodec mEncoder;
    private InputSurface mEncoderInputSurfaceWrapper;
    private ByteBuffer[] mEncoderOutputBuffers;
    private boolean mEncoderStarted;
    private final MediaExtractor mExtractor;
    private boolean mIsDecoderEOS;
    private boolean mIsEncoderEOS;
    private boolean mIsExtractorEOS;
    private final QueuedMuxer mMuxer;
    private final MediaFormat mOutputFormat;
    private final int mTrackIndex;
    private long mWrittenPresentationTimeUs;

    public VideoTrackTranscoder(MediaExtractor extractor, int trackIndex, MediaFormat outputFormat, QueuedMuxer muxer) {
        this.mExtractor = extractor;
        this.mTrackIndex = trackIndex;
        this.mOutputFormat = outputFormat;
        this.mMuxer = muxer;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public void setup() {
        this.mExtractor.selectTrack(this.mTrackIndex);
        try {
            this.mEncoder = MediaCodec.createEncoderByType(this.mOutputFormat.getString("mime"));
            this.mEncoder.configure(this.mOutputFormat, (Surface) null, (MediaCrypto) null, 1);
            this.mEncoderInputSurfaceWrapper = new InputSurface(this.mEncoder.createInputSurface());
            this.mEncoderInputSurfaceWrapper.makeCurrent();
            this.mEncoder.start();
            this.mEncoderStarted = true;
            this.mEncoderOutputBuffers = this.mEncoder.getOutputBuffers();
            MediaFormat inputFormat = this.mExtractor.getTrackFormat(this.mTrackIndex);
            if (inputFormat.containsKey(MediaFormatExtraConstants.KEY_ROTATION_DEGREES)) {
                inputFormat.setInteger(MediaFormatExtraConstants.KEY_ROTATION_DEGREES, 0);
            }
            this.mDecoderOutputSurfaceWrapper = new OutputSurface();
            try {
                this.mDecoder = MediaCodec.createDecoderByType(inputFormat.getString("mime"));
                this.mDecoder.configure(inputFormat, this.mDecoderOutputSurfaceWrapper.getSurface(), (MediaCrypto) null, 0);
                this.mDecoder.start();
                this.mDecoderStarted = true;
                this.mDecoderInputBuffers = this.mDecoder.getInputBuffers();
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
        } catch (IOException e2) {
            throw new IllegalStateException(e2);
        }
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public MediaFormat getDeterminedFormat() {
        return this.mActualOutputFormat;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public boolean stepPipeline() {
        int status;
        boolean busy = false;
        while (drainEncoder(0L) != 0) {
            busy = true;
        }
        do {
            status = drainDecoder(0L);
            if (status != 0) {
                busy = true;
            }
        } while (status == 1);
        while (drainExtractor(0L) != 0) {
            busy = true;
        }
        return busy;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public long getWrittenPresentationTimeUs() {
        return this.mWrittenPresentationTimeUs;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public boolean isFinished() {
        return this.mIsEncoderEOS;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public void release() {
        if (this.mDecoderOutputSurfaceWrapper != null) {
            this.mDecoderOutputSurfaceWrapper.release();
            this.mDecoderOutputSurfaceWrapper = null;
        }
        if (this.mEncoderInputSurfaceWrapper != null) {
            this.mEncoderInputSurfaceWrapper.release();
            this.mEncoderInputSurfaceWrapper = null;
        }
        if (this.mDecoder != null) {
            if (this.mDecoderStarted) {
                this.mDecoder.stop();
            }
            this.mDecoder.release();
            this.mDecoder = null;
        }
        if (this.mEncoder != null) {
            if (this.mEncoderStarted) {
                this.mEncoder.stop();
            }
            this.mEncoder.release();
            this.mEncoder = null;
        }
    }

    private int drainExtractor(long timeoutUs) {
        int result;
        int i = 1;
        if (this.mIsExtractorEOS) {
            return 0;
        }
        int trackIndex = this.mExtractor.getSampleTrackIndex();
        if ((trackIndex >= 0 && trackIndex != this.mTrackIndex) || (result = this.mDecoder.dequeueInputBuffer(timeoutUs)) < 0) {
            return 0;
        }
        if (trackIndex < 0) {
            this.mIsExtractorEOS = true;
            this.mDecoder.queueInputBuffer(result, 0, 0, 0L, 4);
            return 0;
        }
        int sampleSize = this.mExtractor.readSampleData(this.mDecoderInputBuffers[result], 0);
        boolean isKeyFrame = (this.mExtractor.getSampleFlags() & 1) != 0;
        MediaCodec mediaCodec = this.mDecoder;
        long sampleTime = this.mExtractor.getSampleTime();
        if (!isKeyFrame) {
            i = 0;
        }
        mediaCodec.queueInputBuffer(result, 0, sampleSize, sampleTime, i);
        this.mExtractor.advance();
        return 2;
    }

    private int drainDecoder(long timeoutUs) {
        boolean doRender = true;
        if (this.mIsDecoderEOS) {
            return 0;
        }
        int result = this.mDecoder.dequeueOutputBuffer(this.mBufferInfo, timeoutUs);
        switch (result) {
            case -3:
            case -2:
                return 1;
            case -1:
                return 0;
            default:
                if ((this.mBufferInfo.flags & 4) != 0) {
                    this.mEncoder.signalEndOfInputStream();
                    this.mIsDecoderEOS = true;
                    this.mBufferInfo.size = 0;
                }
                if (this.mBufferInfo.size <= 0) {
                    doRender = false;
                }
                this.mDecoder.releaseOutputBuffer(result, doRender);
                if (doRender) {
                    this.mDecoderOutputSurfaceWrapper.awaitNewImage();
                    this.mDecoderOutputSurfaceWrapper.drawImage();
                    this.mEncoderInputSurfaceWrapper.setPresentationTime(this.mBufferInfo.presentationTimeUs * 1000);
                    this.mEncoderInputSurfaceWrapper.swapBuffers();
                }
                return 2;
        }
    }

    private int drainEncoder(long timeoutUs) {
        if (this.mIsEncoderEOS) {
            return 0;
        }
        int result = this.mEncoder.dequeueOutputBuffer(this.mBufferInfo, timeoutUs);
        switch (result) {
            case -3:
                this.mEncoderOutputBuffers = this.mEncoder.getOutputBuffers();
                return 1;
            case -2:
                if (this.mActualOutputFormat != null) {
                    throw new RuntimeException("Video output format changed twice.");
                }
                this.mActualOutputFormat = this.mEncoder.getOutputFormat();
                this.mMuxer.setOutputFormat(QueuedMuxer.SampleType.VIDEO, this.mActualOutputFormat);
                return 1;
            case -1:
                return 0;
            default:
                if (this.mActualOutputFormat == null) {
                    throw new RuntimeException("Could not determine actual output format.");
                }
                if ((this.mBufferInfo.flags & 4) != 0) {
                    this.mIsEncoderEOS = true;
                    this.mBufferInfo.set(0, 0, 0L, this.mBufferInfo.flags);
                }
                if ((this.mBufferInfo.flags & 2) != 0) {
                    this.mEncoder.releaseOutputBuffer(result, false);
                    return 1;
                }
                this.mMuxer.writeSampleData(QueuedMuxer.SampleType.VIDEO, this.mEncoderOutputBuffers[result], this.mBufferInfo);
                this.mWrittenPresentationTimeUs = this.mBufferInfo.presentationTimeUs;
                this.mEncoder.releaseOutputBuffer(result, false);
                return 2;
        }
    }
}
