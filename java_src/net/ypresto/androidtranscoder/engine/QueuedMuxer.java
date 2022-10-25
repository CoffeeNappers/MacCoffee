package net.ypresto.androidtranscoder.engine;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.util.Log;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class QueuedMuxer {
    private static final int BUFFER_SIZE = 65536;
    private static final String TAG = "QueuedMuxer";
    private MediaFormat mAudioFormat;
    private int mAudioTrackIndex;
    private ByteBuffer mByteBuffer;
    private final Listener mListener;
    private final MediaMuxer mMuxer;
    private final List<SampleInfo> mSampleInfoList = new ArrayList();
    private boolean mStarted;
    private MediaFormat mVideoFormat;
    private int mVideoTrackIndex;

    /* loaded from: classes3.dex */
    public interface Listener {
        void onDetermineOutputFormat();
    }

    /* loaded from: classes3.dex */
    public enum SampleType {
        VIDEO,
        AUDIO
    }

    public QueuedMuxer(MediaMuxer muxer, Listener listener) {
        this.mMuxer = muxer;
        this.mListener = listener;
    }

    public void setOutputFormat(SampleType sampleType, MediaFormat format) {
        switch (sampleType) {
            case VIDEO:
                this.mVideoFormat = format;
                break;
            case AUDIO:
                this.mAudioFormat = format;
                break;
            default:
                throw new AssertionError();
        }
        onSetOutputFormat();
    }

    private void onSetOutputFormat() {
        if (this.mVideoFormat != null && this.mAudioFormat != null) {
            this.mListener.onDetermineOutputFormat();
            this.mVideoTrackIndex = this.mMuxer.addTrack(this.mVideoFormat);
            Log.v(TAG, "Added track #" + this.mVideoTrackIndex + " with " + this.mVideoFormat.getString("mime") + " to muxer");
            this.mAudioTrackIndex = this.mMuxer.addTrack(this.mAudioFormat);
            Log.v(TAG, "Added track #" + this.mAudioTrackIndex + " with " + this.mAudioFormat.getString("mime") + " to muxer");
            this.mMuxer.start();
            this.mStarted = true;
            if (this.mByteBuffer == null) {
                this.mByteBuffer = ByteBuffer.allocate(0);
            }
            this.mByteBuffer.flip();
            Log.v(TAG, "Output format determined, writing " + this.mSampleInfoList.size() + " samples / " + this.mByteBuffer.limit() + " bytes to muxer.");
            MediaCodec.BufferInfo bufferInfo = new MediaCodec.BufferInfo();
            int offset = 0;
            for (SampleInfo sampleInfo : this.mSampleInfoList) {
                sampleInfo.writeToBufferInfo(bufferInfo, offset);
                this.mMuxer.writeSampleData(getTrackIndexForSampleType(sampleInfo.mSampleType), this.mByteBuffer, bufferInfo);
                offset += sampleInfo.mSize;
            }
            this.mSampleInfoList.clear();
            this.mByteBuffer = null;
        }
    }

    public void writeSampleData(SampleType sampleType, ByteBuffer byteBuf, MediaCodec.BufferInfo bufferInfo) {
        if (this.mStarted) {
            this.mMuxer.writeSampleData(getTrackIndexForSampleType(sampleType), byteBuf, bufferInfo);
            return;
        }
        byteBuf.limit(bufferInfo.offset + bufferInfo.size);
        byteBuf.position(bufferInfo.offset);
        if (this.mByteBuffer == null) {
            this.mByteBuffer = ByteBuffer.allocateDirect(65536).order(ByteOrder.nativeOrder());
        }
        this.mByteBuffer.put(byteBuf);
        this.mSampleInfoList.add(new SampleInfo(sampleType, bufferInfo.size, bufferInfo));
    }

    private int getTrackIndexForSampleType(SampleType sampleType) {
        switch (sampleType) {
            case VIDEO:
                return this.mVideoTrackIndex;
            case AUDIO:
                return this.mAudioTrackIndex;
            default:
                throw new AssertionError();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class SampleInfo {
        private final int mFlags;
        private final long mPresentationTimeUs;
        private final SampleType mSampleType;
        private final int mSize;

        private SampleInfo(SampleType sampleType, int size, MediaCodec.BufferInfo bufferInfo) {
            this.mSampleType = sampleType;
            this.mSize = size;
            this.mPresentationTimeUs = bufferInfo.presentationTimeUs;
            this.mFlags = bufferInfo.flags;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void writeToBufferInfo(MediaCodec.BufferInfo bufferInfo, int offset) {
            bufferInfo.set(offset, this.mSize, this.mPresentationTimeUs, this.mFlags);
        }
    }
}
