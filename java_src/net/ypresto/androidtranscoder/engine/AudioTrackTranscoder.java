package net.ypresto.androidtranscoder.engine;

import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.view.Surface;
import java.io.IOException;
import net.ypresto.androidtranscoder.compat.MediaCodecBufferCompatWrapper;
import net.ypresto.androidtranscoder.engine.QueuedMuxer;
/* loaded from: classes3.dex */
public class AudioTrackTranscoder implements TrackTranscoder {
    private static final int DRAIN_STATE_CONSUMED = 2;
    private static final int DRAIN_STATE_NONE = 0;
    private static final int DRAIN_STATE_SHOULD_RETRY_IMMEDIATELY = 1;
    private static final QueuedMuxer.SampleType SAMPLE_TYPE = QueuedMuxer.SampleType.AUDIO;
    private MediaFormat mActualOutputFormat;
    private AudioChannel mAudioChannel;
    private final MediaCodec.BufferInfo mBufferInfo = new MediaCodec.BufferInfo();
    private MediaCodec mDecoder;
    private MediaCodecBufferCompatWrapper mDecoderBuffers;
    private boolean mDecoderStarted;
    private MediaCodec mEncoder;
    private MediaCodecBufferCompatWrapper mEncoderBuffers;
    private boolean mEncoderStarted;
    private final MediaExtractor mExtractor;
    private final MediaFormat mInputFormat;
    private boolean mIsDecoderEOS;
    private boolean mIsEncoderEOS;
    private boolean mIsExtractorEOS;
    private final QueuedMuxer mMuxer;
    private final MediaFormat mOutputFormat;
    private final int mTrackIndex;
    private long mWrittenPresentationTimeUs;

    public AudioTrackTranscoder(MediaExtractor extractor, int trackIndex, MediaFormat outputFormat, QueuedMuxer muxer) {
        this.mExtractor = extractor;
        this.mTrackIndex = trackIndex;
        this.mOutputFormat = outputFormat;
        this.mMuxer = muxer;
        this.mInputFormat = this.mExtractor.getTrackFormat(this.mTrackIndex);
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public void setup() {
        this.mExtractor.selectTrack(this.mTrackIndex);
        try {
            this.mEncoder = MediaCodec.createEncoderByType(this.mOutputFormat.getString("mime"));
            this.mEncoder.configure(this.mOutputFormat, (Surface) null, (MediaCrypto) null, 1);
            this.mEncoder.start();
            this.mEncoderStarted = true;
            this.mEncoderBuffers = new MediaCodecBufferCompatWrapper(this.mEncoder);
            MediaFormat inputFormat = this.mExtractor.getTrackFormat(this.mTrackIndex);
            try {
                this.mDecoder = MediaCodec.createDecoderByType(inputFormat.getString("mime"));
                this.mDecoder.configure(inputFormat, (Surface) null, (MediaCrypto) null, 0);
                this.mDecoder.start();
                this.mDecoderStarted = true;
                this.mDecoderBuffers = new MediaCodecBufferCompatWrapper(this.mDecoder);
                this.mAudioChannel = new AudioChannel(this.mDecoder, this.mEncoder, this.mOutputFormat);
            } catch (IOException e) {
                throw new IllegalStateException(e);
            }
        } catch (IOException e2) {
            throw new IllegalStateException(e2);
        }
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public MediaFormat getDeterminedFormat() {
        return this.mInputFormat;
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
        while (this.mAudioChannel.feedEncoder(0L)) {
            busy = true;
        }
        while (drainExtractor(0L) != 0) {
            busy = true;
        }
        return busy;
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
        int sampleSize = this.mExtractor.readSampleData(this.mDecoderBuffers.getInputBuffer(result), 0);
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

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private int drainDecoder(long timeoutUs) {
        if (this.mIsDecoderEOS) {
            return 0;
        }
        int result = this.mDecoder.dequeueOutputBuffer(this.mBufferInfo, timeoutUs);
        switch (result) {
            case -3:
                break;
            case -2:
                this.mAudioChannel.setActualDecodedFormat(this.mDecoder.getOutputFormat());
                break;
            case -1:
                return 0;
            default:
                if ((this.mBufferInfo.flags & 4) != 0) {
                    this.mIsDecoderEOS = true;
                    this.mAudioChannel.drainDecoderBufferAndQueue(-1, 0L);
                } else if (this.mBufferInfo.size > 0) {
                    this.mAudioChannel.drainDecoderBufferAndQueue(result, this.mBufferInfo.presentationTimeUs);
                }
                return 2;
        }
        return 1;
    }

    private int drainEncoder(long timeoutUs) {
        if (this.mIsEncoderEOS) {
            return 0;
        }
        int result = this.mEncoder.dequeueOutputBuffer(this.mBufferInfo, timeoutUs);
        switch (result) {
            case -3:
                this.mEncoderBuffers = new MediaCodecBufferCompatWrapper(this.mEncoder);
                return 1;
            case -2:
                if (this.mActualOutputFormat != null) {
                    throw new RuntimeException("Audio output format changed twice.");
                }
                this.mActualOutputFormat = this.mEncoder.getOutputFormat();
                this.mMuxer.setOutputFormat(SAMPLE_TYPE, this.mActualOutputFormat);
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
                this.mMuxer.writeSampleData(SAMPLE_TYPE, this.mEncoderBuffers.getOutputBuffer(result), this.mBufferInfo);
                this.mWrittenPresentationTimeUs = this.mBufferInfo.presentationTimeUs;
                this.mEncoder.releaseOutputBuffer(result, false);
                return 2;
        }
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
}
