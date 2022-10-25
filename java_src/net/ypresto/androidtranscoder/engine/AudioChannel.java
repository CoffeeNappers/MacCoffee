package net.ypresto.androidtranscoder.engine;

import android.media.MediaCodec;
import android.media.MediaFormat;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;
import java.util.ArrayDeque;
import java.util.Queue;
import net.ypresto.androidtranscoder.compat.MediaCodecBufferCompatWrapper;
/* loaded from: classes3.dex */
class AudioChannel {
    public static final int BUFFER_INDEX_END_OF_STREAM = -1;
    private static final int BYTES_PER_SHORT = 2;
    private static final long MICROSECS_PER_SEC = 1000000;
    private MediaFormat mActualDecodedFormat;
    private final MediaCodec mDecoder;
    private final MediaCodecBufferCompatWrapper mDecoderBuffers;
    private final MediaFormat mEncodeFormat;
    private final MediaCodec mEncoder;
    private final MediaCodecBufferCompatWrapper mEncoderBuffers;
    private int mInputChannelCount;
    private int mInputSampleRate;
    private int mOutputChannelCount;
    private AudioRemixer mRemixer;
    private final Queue<AudioBuffer> mEmptyBuffers = new ArrayDeque();
    private final Queue<AudioBuffer> mFilledBuffers = new ArrayDeque();
    private final AudioBuffer mOverflowBuffer = new AudioBuffer();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class AudioBuffer {
        int bufferIndex;
        ShortBuffer data;
        long presentationTimeUs;

        private AudioBuffer() {
        }
    }

    public AudioChannel(MediaCodec decoder, MediaCodec encoder, MediaFormat encodeFormat) {
        this.mDecoder = decoder;
        this.mEncoder = encoder;
        this.mEncodeFormat = encodeFormat;
        this.mDecoderBuffers = new MediaCodecBufferCompatWrapper(this.mDecoder);
        this.mEncoderBuffers = new MediaCodecBufferCompatWrapper(this.mEncoder);
    }

    public void setActualDecodedFormat(MediaFormat decodedFormat) {
        this.mActualDecodedFormat = decodedFormat;
        this.mInputSampleRate = this.mActualDecodedFormat.getInteger("sample-rate");
        if (this.mInputSampleRate != this.mEncodeFormat.getInteger("sample-rate")) {
            throw new UnsupportedOperationException("Audio sample rate conversion not supported yet.");
        }
        this.mInputChannelCount = this.mActualDecodedFormat.getInteger("channel-count");
        this.mOutputChannelCount = this.mEncodeFormat.getInteger("channel-count");
        if (this.mInputChannelCount != 1 && this.mInputChannelCount != 2) {
            throw new UnsupportedOperationException("Input channel count (" + this.mInputChannelCount + ") not supported.");
        }
        if (this.mOutputChannelCount != 1 && this.mOutputChannelCount != 2) {
            throw new UnsupportedOperationException("Output channel count (" + this.mOutputChannelCount + ") not supported.");
        }
        if (this.mInputChannelCount > this.mOutputChannelCount) {
            this.mRemixer = AudioRemixer.DOWNMIX;
        } else if (this.mInputChannelCount < this.mOutputChannelCount) {
            this.mRemixer = AudioRemixer.UPMIX;
        } else {
            this.mRemixer = AudioRemixer.PASSTHROUGH;
        }
        this.mOverflowBuffer.presentationTimeUs = 0L;
    }

    public void drainDecoderBufferAndQueue(int bufferIndex, long presentationTimeUs) {
        ShortBuffer shortBuffer = null;
        if (this.mActualDecodedFormat == null) {
            throw new RuntimeException("Buffer received before format!");
        }
        ByteBuffer data = bufferIndex == -1 ? null : this.mDecoderBuffers.getOutputBuffer(bufferIndex);
        AudioBuffer buffer = this.mEmptyBuffers.poll();
        if (buffer == null) {
            buffer = new AudioBuffer();
        }
        buffer.bufferIndex = bufferIndex;
        buffer.presentationTimeUs = presentationTimeUs;
        if (data != null) {
            shortBuffer = data.asShortBuffer();
        }
        buffer.data = shortBuffer;
        if (this.mOverflowBuffer.data == null) {
            this.mOverflowBuffer.data = ByteBuffer.allocateDirect(data.capacity()).order(ByteOrder.nativeOrder()).asShortBuffer();
            this.mOverflowBuffer.data.clear().flip();
        }
        this.mFilledBuffers.add(buffer);
    }

    public boolean feedEncoder(long timeoutUs) {
        int encoderInBuffIndex;
        boolean hasOverflow = this.mOverflowBuffer.data != null && this.mOverflowBuffer.data.hasRemaining();
        if ((this.mFilledBuffers.isEmpty() && !hasOverflow) || (encoderInBuffIndex = this.mEncoder.dequeueInputBuffer(timeoutUs)) < 0) {
            return false;
        }
        ShortBuffer outBuffer = this.mEncoderBuffers.getInputBuffer(encoderInBuffIndex).asShortBuffer();
        if (hasOverflow) {
            long presentationTimeUs = drainOverflow(outBuffer);
            this.mEncoder.queueInputBuffer(encoderInBuffIndex, 0, outBuffer.position() * 2, presentationTimeUs, 0);
            return true;
        }
        AudioBuffer inBuffer = this.mFilledBuffers.poll();
        if (inBuffer.bufferIndex == -1) {
            this.mEncoder.queueInputBuffer(encoderInBuffIndex, 0, 0, 0L, 4);
            return false;
        }
        long presentationTimeUs2 = remixAndMaybeFillOverflow(inBuffer, outBuffer);
        this.mEncoder.queueInputBuffer(encoderInBuffIndex, 0, outBuffer.position() * 2, presentationTimeUs2, 0);
        if (inBuffer != null) {
            this.mDecoder.releaseOutputBuffer(inBuffer.bufferIndex, false);
            this.mEmptyBuffers.add(inBuffer);
        }
        return true;
    }

    private static long sampleCountToDurationUs(int sampleCount, int sampleRate, int channelCount) {
        return (sampleCount / (sampleRate * 1000000)) / channelCount;
    }

    private long drainOverflow(ShortBuffer outBuff) {
        ShortBuffer overflowBuff = this.mOverflowBuffer.data;
        int overflowLimit = overflowBuff.limit();
        int overflowSize = overflowBuff.remaining();
        long beginPresentationTimeUs = this.mOverflowBuffer.presentationTimeUs + sampleCountToDurationUs(overflowBuff.position(), this.mInputSampleRate, this.mOutputChannelCount);
        outBuff.clear();
        overflowBuff.limit(outBuff.capacity());
        outBuff.put(overflowBuff);
        if (overflowSize >= outBuff.capacity()) {
            overflowBuff.clear().limit(0);
        } else {
            overflowBuff.limit(overflowLimit);
        }
        return beginPresentationTimeUs;
    }

    private long remixAndMaybeFillOverflow(AudioBuffer input, ShortBuffer outBuff) {
        ShortBuffer inBuff = input.data;
        ShortBuffer overflowBuff = this.mOverflowBuffer.data;
        outBuff.clear();
        inBuff.clear();
        if (inBuff.remaining() > outBuff.remaining()) {
            inBuff.limit(outBuff.capacity());
            this.mRemixer.remix(inBuff, outBuff);
            inBuff.limit(inBuff.capacity());
            long consumedDurationUs = sampleCountToDurationUs(inBuff.position(), this.mInputSampleRate, this.mInputChannelCount);
            this.mRemixer.remix(inBuff, overflowBuff);
            overflowBuff.flip();
            this.mOverflowBuffer.presentationTimeUs = input.presentationTimeUs + consumedDurationUs;
        } else {
            this.mRemixer.remix(inBuff, outBuff);
        }
        return input.presentationTimeUs;
    }
}
