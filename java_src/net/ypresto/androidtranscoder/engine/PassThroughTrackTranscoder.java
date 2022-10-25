package net.ypresto.androidtranscoder.engine;

import android.annotation.SuppressLint;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import net.ypresto.androidtranscoder.engine.QueuedMuxer;
/* loaded from: classes3.dex */
public class PassThroughTrackTranscoder implements TrackTranscoder {
    static final /* synthetic */ boolean $assertionsDisabled;
    private MediaFormat mActualOutputFormat;
    private ByteBuffer mBuffer;
    private final MediaCodec.BufferInfo mBufferInfo = new MediaCodec.BufferInfo();
    private int mBufferSize;
    private final MediaExtractor mExtractor;
    private boolean mIsEOS;
    private final QueuedMuxer mMuxer;
    private final QueuedMuxer.SampleType mSampleType;
    private final int mTrackIndex;
    private long mWrittenPresentationTimeUs;

    static {
        $assertionsDisabled = !PassThroughTrackTranscoder.class.desiredAssertionStatus();
    }

    public PassThroughTrackTranscoder(MediaExtractor extractor, int trackIndex, QueuedMuxer muxer, QueuedMuxer.SampleType sampleType) {
        this.mExtractor = extractor;
        this.mTrackIndex = trackIndex;
        this.mMuxer = muxer;
        this.mSampleType = sampleType;
        this.mActualOutputFormat = this.mExtractor.getTrackFormat(this.mTrackIndex);
        this.mMuxer.setOutputFormat(this.mSampleType, this.mActualOutputFormat);
        this.mBufferSize = this.mActualOutputFormat.getInteger("max-input-size");
        this.mBuffer = ByteBuffer.allocateDirect(this.mBufferSize).order(ByteOrder.nativeOrder());
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public void setup() {
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public MediaFormat getDeterminedFormat() {
        return this.mActualOutputFormat;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    @SuppressLint({"Assert"})
    public boolean stepPipeline() {
        if (this.mIsEOS) {
            return false;
        }
        int trackIndex = this.mExtractor.getSampleTrackIndex();
        if (trackIndex < 0) {
            this.mBuffer.clear();
            this.mBufferInfo.set(0, 0, 0L, 4);
            this.mMuxer.writeSampleData(this.mSampleType, this.mBuffer, this.mBufferInfo);
            this.mIsEOS = true;
            return true;
        } else if (trackIndex != this.mTrackIndex) {
            return false;
        } else {
            this.mBuffer.clear();
            int sampleSize = this.mExtractor.readSampleData(this.mBuffer, 0);
            if (!$assertionsDisabled && sampleSize > this.mBufferSize) {
                throw new AssertionError();
            }
            boolean isKeyFrame = (this.mExtractor.getSampleFlags() & 1) != 0;
            int flags = isKeyFrame ? 1 : 0;
            this.mBufferInfo.set(0, sampleSize, this.mExtractor.getSampleTime(), flags);
            this.mMuxer.writeSampleData(this.mSampleType, this.mBuffer, this.mBufferInfo);
            this.mWrittenPresentationTimeUs = this.mBufferInfo.presentationTimeUs;
            this.mExtractor.advance();
            return true;
        }
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public long getWrittenPresentationTimeUs() {
        return this.mWrittenPresentationTimeUs;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public boolean isFinished() {
        return this.mIsEOS;
    }

    @Override // net.ypresto.androidtranscoder.engine.TrackTranscoder
    public void release() {
    }
}
