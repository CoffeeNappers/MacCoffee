package com.google.android.exoplayer2.extractor;

import com.google.android.exoplayer2.Format;
import com.google.android.exoplayer2.FormatHolder;
import com.google.android.exoplayer2.decoder.DecoderInputBuffer;
import com.google.android.exoplayer2.upstream.Allocation;
import com.google.android.exoplayer2.upstream.Allocator;
import com.google.android.exoplayer2.util.Assertions;
import com.google.android.exoplayer2.util.ParsableByteArray;
import com.google.android.exoplayer2.util.Util;
import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public final class DefaultTrackOutput implements TrackOutput {
    private static final int INITIAL_SCRATCH_SIZE = 32;
    private static final int STATE_DISABLED = 2;
    private static final int STATE_ENABLED = 0;
    private static final int STATE_ENABLED_WRITING = 1;
    private final int allocationLength;
    private final Allocator allocator;
    private Format downstreamFormat;
    private Allocation lastAllocation;
    private int lastAllocationOffset;
    private boolean pendingSplice;
    private long sampleOffsetUs;
    private long totalBytesDropped;
    private long totalBytesWritten;
    private UpstreamFormatChangedListener upstreamFormatChangeListener;
    private final InfoQueue infoQueue = new InfoQueue();
    private final LinkedBlockingDeque<Allocation> dataQueue = new LinkedBlockingDeque<>();
    private final BufferExtrasHolder extrasHolder = new BufferExtrasHolder();
    private final ParsableByteArray scratch = new ParsableByteArray(32);
    private final AtomicInteger state = new AtomicInteger();
    private boolean needKeyframe = true;

    /* loaded from: classes.dex */
    public interface UpstreamFormatChangedListener {
        void onUpstreamFormatChanged(Format format);
    }

    public DefaultTrackOutput(Allocator allocator) {
        this.allocator = allocator;
        this.allocationLength = allocator.getIndividualAllocationLength();
        this.lastAllocationOffset = this.allocationLength;
    }

    public void reset(boolean enable) {
        int previousState = this.state.getAndSet(enable ? 0 : 2);
        clearSampleData();
        this.infoQueue.resetLargestParsedTimestamps();
        if (previousState == 2) {
            this.downstreamFormat = null;
        }
    }

    public void sourceId(int sourceId) {
        this.infoQueue.sourceId(sourceId);
    }

    public void splice() {
        this.pendingSplice = true;
    }

    public int getWriteIndex() {
        return this.infoQueue.getWriteIndex();
    }

    public void discardUpstreamSamples(int discardFromIndex) {
        this.totalBytesWritten = this.infoQueue.discardUpstreamSamples(discardFromIndex);
        dropUpstreamFrom(this.totalBytesWritten);
    }

    private void dropUpstreamFrom(long absolutePosition) {
        int relativePosition = (int) (absolutePosition - this.totalBytesDropped);
        int allocationIndex = relativePosition / this.allocationLength;
        int allocationOffset = relativePosition % this.allocationLength;
        int allocationDiscardCount = (this.dataQueue.size() - allocationIndex) - 1;
        if (allocationOffset == 0) {
            allocationDiscardCount++;
        }
        for (int i = 0; i < allocationDiscardCount; i++) {
            this.allocator.release(this.dataQueue.removeLast());
        }
        this.lastAllocation = this.dataQueue.peekLast();
        if (allocationOffset == 0) {
            allocationOffset = this.allocationLength;
        }
        this.lastAllocationOffset = allocationOffset;
    }

    public void disable() {
        if (this.state.getAndSet(2) == 0) {
            clearSampleData();
        }
    }

    public boolean isEmpty() {
        return this.infoQueue.isEmpty();
    }

    public int getReadIndex() {
        return this.infoQueue.getReadIndex();
    }

    public int peekSourceId() {
        return this.infoQueue.peekSourceId();
    }

    public Format getUpstreamFormat() {
        return this.infoQueue.getUpstreamFormat();
    }

    public long getLargestQueuedTimestampUs() {
        return this.infoQueue.getLargestQueuedTimestampUs();
    }

    public boolean skipToKeyframeBefore(long timeUs) {
        return skipToKeyframeBefore(timeUs, false);
    }

    public boolean skipToKeyframeBefore(long timeUs, boolean allowTimeBeyondBuffer) {
        long nextOffset = this.infoQueue.skipToKeyframeBefore(timeUs, allowTimeBeyondBuffer);
        if (nextOffset == -1) {
            return false;
        }
        dropDownstreamTo(nextOffset);
        return true;
    }

    public int readData(FormatHolder formatHolder, DecoderInputBuffer buffer, boolean loadingFinished, long decodeOnlyUntilUs) {
        switch (this.infoQueue.readData(formatHolder, buffer, this.downstreamFormat, this.extrasHolder)) {
            case -5:
                this.downstreamFormat = formatHolder.format;
                return -5;
            case -4:
                if (buffer.timeUs < decodeOnlyUntilUs) {
                    buffer.addFlag(Integer.MIN_VALUE);
                }
                if (buffer.isEncrypted()) {
                    readEncryptionData(buffer, this.extrasHolder);
                }
                buffer.ensureSpaceForWrite(this.extrasHolder.size);
                readData(this.extrasHolder.offset, buffer.data, this.extrasHolder.size);
                dropDownstreamTo(this.extrasHolder.nextOffset);
                return -4;
            case -3:
                if (loadingFinished) {
                    buffer.setFlags(4);
                    return -4;
                }
                return -3;
            default:
                throw new IllegalStateException();
        }
    }

    private void readEncryptionData(DecoderInputBuffer buffer, BufferExtrasHolder extrasHolder) {
        int subsampleCount;
        long offset = extrasHolder.offset;
        this.scratch.reset(1);
        readData(offset, this.scratch.data, 1);
        long offset2 = offset + 1;
        byte signalByte = this.scratch.data[0];
        boolean subsampleEncryption = (signalByte & 128) != 0;
        int ivSize = signalByte & Byte.MAX_VALUE;
        if (buffer.cryptoInfo.iv == null) {
            buffer.cryptoInfo.iv = new byte[16];
        }
        readData(offset2, buffer.cryptoInfo.iv, ivSize);
        long offset3 = offset2 + ivSize;
        if (subsampleEncryption) {
            this.scratch.reset(2);
            readData(offset3, this.scratch.data, 2);
            offset3 += 2;
            subsampleCount = this.scratch.readUnsignedShort();
        } else {
            subsampleCount = 1;
        }
        int[] clearDataSizes = buffer.cryptoInfo.numBytesOfClearData;
        if (clearDataSizes == null || clearDataSizes.length < subsampleCount) {
            clearDataSizes = new int[subsampleCount];
        }
        int[] encryptedDataSizes = buffer.cryptoInfo.numBytesOfEncryptedData;
        if (encryptedDataSizes == null || encryptedDataSizes.length < subsampleCount) {
            encryptedDataSizes = new int[subsampleCount];
        }
        if (subsampleEncryption) {
            int subsampleDataLength = subsampleCount * 6;
            this.scratch.reset(subsampleDataLength);
            readData(offset3, this.scratch.data, subsampleDataLength);
            offset3 += subsampleDataLength;
            this.scratch.setPosition(0);
            for (int i = 0; i < subsampleCount; i++) {
                clearDataSizes[i] = this.scratch.readUnsignedShort();
                encryptedDataSizes[i] = this.scratch.readUnsignedIntToInt();
            }
        } else {
            clearDataSizes[0] = 0;
            encryptedDataSizes[0] = extrasHolder.size - ((int) (offset3 - extrasHolder.offset));
        }
        buffer.cryptoInfo.set(subsampleCount, clearDataSizes, encryptedDataSizes, extrasHolder.encryptionKeyId, buffer.cryptoInfo.iv, 1);
        int bytesRead = (int) (offset3 - extrasHolder.offset);
        extrasHolder.offset += bytesRead;
        extrasHolder.size -= bytesRead;
    }

    private void readData(long absolutePosition, ByteBuffer target, int length) {
        int remaining = length;
        while (remaining > 0) {
            dropDownstreamTo(absolutePosition);
            int positionInAllocation = (int) (absolutePosition - this.totalBytesDropped);
            int toCopy = Math.min(remaining, this.allocationLength - positionInAllocation);
            Allocation allocation = this.dataQueue.peek();
            target.put(allocation.data, allocation.translateOffset(positionInAllocation), toCopy);
            absolutePosition += toCopy;
            remaining -= toCopy;
        }
    }

    private void readData(long absolutePosition, byte[] target, int length) {
        int bytesRead = 0;
        while (bytesRead < length) {
            dropDownstreamTo(absolutePosition);
            int positionInAllocation = (int) (absolutePosition - this.totalBytesDropped);
            int toCopy = Math.min(length - bytesRead, this.allocationLength - positionInAllocation);
            Allocation allocation = this.dataQueue.peek();
            System.arraycopy(allocation.data, allocation.translateOffset(positionInAllocation), target, bytesRead, toCopy);
            absolutePosition += toCopy;
            bytesRead += toCopy;
        }
    }

    private void dropDownstreamTo(long absolutePosition) {
        int relativePosition = (int) (absolutePosition - this.totalBytesDropped);
        int allocationIndex = relativePosition / this.allocationLength;
        for (int i = 0; i < allocationIndex; i++) {
            this.allocator.release(this.dataQueue.remove());
            this.totalBytesDropped += this.allocationLength;
        }
    }

    public void setUpstreamFormatChangeListener(UpstreamFormatChangedListener listener) {
        this.upstreamFormatChangeListener = listener;
    }

    public void formatWithOffset(Format format, long sampleOffsetUs) {
        this.sampleOffsetUs = sampleOffsetUs;
        format(format);
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public void format(Format format) {
        Format adjustedFormat = getAdjustedSampleFormat(format, this.sampleOffsetUs);
        boolean formatChanged = this.infoQueue.format(adjustedFormat);
        if (this.upstreamFormatChangeListener != null && formatChanged) {
            this.upstreamFormatChangeListener.onUpstreamFormatChanged(adjustedFormat);
        }
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public int sampleData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        if (!startWriteOperation()) {
            int bytesSkipped = input.skip(length);
            if (bytesSkipped != -1) {
                return bytesSkipped;
            }
            if (!allowEndOfInput) {
                throw new EOFException();
            }
            return -1;
        }
        try {
            int bytesAppended = input.read(this.lastAllocation.data, this.lastAllocation.translateOffset(this.lastAllocationOffset), prepareForAppend(length));
            if (bytesAppended == -1) {
                if (!allowEndOfInput) {
                    throw new EOFException();
                }
                return -1;
            }
            this.lastAllocationOffset += bytesAppended;
            this.totalBytesWritten += bytesAppended;
            return bytesAppended;
        } finally {
            endWriteOperation();
        }
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public void sampleData(ParsableByteArray buffer, int length) {
        if (!startWriteOperation()) {
            buffer.skipBytes(length);
            return;
        }
        while (length > 0) {
            int thisAppendLength = prepareForAppend(length);
            buffer.readBytes(this.lastAllocation.data, this.lastAllocation.translateOffset(this.lastAllocationOffset), thisAppendLength);
            this.lastAllocationOffset += thisAppendLength;
            this.totalBytesWritten += thisAppendLength;
            length -= thisAppendLength;
        }
        endWriteOperation();
    }

    @Override // com.google.android.exoplayer2.extractor.TrackOutput
    public void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
        if (!startWriteOperation()) {
            this.infoQueue.commitSampleTimestamp(timeUs);
            return;
        }
        try {
            if (this.pendingSplice) {
                if ((flags & 1) != 0 && this.infoQueue.attemptSplice(timeUs)) {
                    this.pendingSplice = false;
                } else {
                    return;
                }
            }
            if (this.needKeyframe) {
                if ((flags & 1) != 0) {
                    this.needKeyframe = false;
                } else {
                    return;
                }
            }
            long timeUs2 = timeUs + this.sampleOffsetUs;
            long absoluteOffset = (this.totalBytesWritten - size) - offset;
            this.infoQueue.commitSample(timeUs2, flags, absoluteOffset, size, encryptionKey);
        } finally {
            endWriteOperation();
        }
    }

    private boolean startWriteOperation() {
        return this.state.compareAndSet(0, 1);
    }

    private void endWriteOperation() {
        if (!this.state.compareAndSet(1, 0)) {
            clearSampleData();
        }
    }

    private void clearSampleData() {
        this.infoQueue.clearSampleData();
        this.allocator.release((Allocation[]) this.dataQueue.toArray(new Allocation[this.dataQueue.size()]));
        this.dataQueue.clear();
        this.allocator.trim();
        this.totalBytesDropped = 0L;
        this.totalBytesWritten = 0L;
        this.lastAllocation = null;
        this.lastAllocationOffset = this.allocationLength;
        this.needKeyframe = true;
    }

    private int prepareForAppend(int length) {
        if (this.lastAllocationOffset == this.allocationLength) {
            this.lastAllocationOffset = 0;
            this.lastAllocation = this.allocator.allocate();
            this.dataQueue.add(this.lastAllocation);
        }
        return Math.min(length, this.allocationLength - this.lastAllocationOffset);
    }

    private static Format getAdjustedSampleFormat(Format format, long sampleOffsetUs) {
        if (format == null) {
            return null;
        }
        if (sampleOffsetUs != 0 && format.subsampleOffsetUs != Long.MAX_VALUE) {
            return format.copyWithSubsampleOffsetUs(format.subsampleOffsetUs + sampleOffsetUs);
        }
        return format;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class InfoQueue {
        private static final int SAMPLE_CAPACITY_INCREMENT = 1000;
        private int absoluteReadIndex;
        private int queueSize;
        private int relativeReadIndex;
        private int relativeWriteIndex;
        private Format upstreamFormat;
        private int upstreamSourceId;
        private int capacity = 1000;
        private int[] sourceIds = new int[this.capacity];
        private long[] offsets = new long[this.capacity];
        private long[] timesUs = new long[this.capacity];
        private int[] flags = new int[this.capacity];
        private int[] sizes = new int[this.capacity];
        private byte[][] encryptionKeys = new byte[this.capacity];
        private Format[] formats = new Format[this.capacity];
        private long largestDequeuedTimestampUs = Long.MIN_VALUE;
        private long largestQueuedTimestampUs = Long.MIN_VALUE;
        private boolean upstreamFormatRequired = true;

        public void clearSampleData() {
            this.absoluteReadIndex = 0;
            this.relativeReadIndex = 0;
            this.relativeWriteIndex = 0;
            this.queueSize = 0;
        }

        public void resetLargestParsedTimestamps() {
            this.largestDequeuedTimestampUs = Long.MIN_VALUE;
            this.largestQueuedTimestampUs = Long.MIN_VALUE;
        }

        public int getWriteIndex() {
            return this.absoluteReadIndex + this.queueSize;
        }

        public long discardUpstreamSamples(int discardFromIndex) {
            int discardCount = getWriteIndex() - discardFromIndex;
            Assertions.checkArgument(discardCount >= 0 && discardCount <= this.queueSize);
            if (discardCount == 0) {
                if (this.absoluteReadIndex == 0) {
                    return 0L;
                }
                int lastWriteIndex = (this.relativeWriteIndex == 0 ? this.capacity : this.relativeWriteIndex) - 1;
                return this.offsets[lastWriteIndex] + this.sizes[lastWriteIndex];
            }
            this.queueSize -= discardCount;
            this.relativeWriteIndex = ((this.relativeWriteIndex + this.capacity) - discardCount) % this.capacity;
            this.largestQueuedTimestampUs = Long.MIN_VALUE;
            for (int i = this.queueSize - 1; i >= 0; i--) {
                int sampleIndex = (this.relativeReadIndex + i) % this.capacity;
                this.largestQueuedTimestampUs = Math.max(this.largestQueuedTimestampUs, this.timesUs[sampleIndex]);
                if ((this.flags[sampleIndex] & 1) != 0) {
                    break;
                }
            }
            return this.offsets[this.relativeWriteIndex];
        }

        public void sourceId(int sourceId) {
            this.upstreamSourceId = sourceId;
        }

        public int getReadIndex() {
            return this.absoluteReadIndex;
        }

        public int peekSourceId() {
            return this.queueSize == 0 ? this.upstreamSourceId : this.sourceIds[this.relativeReadIndex];
        }

        public synchronized boolean isEmpty() {
            return this.queueSize == 0;
        }

        public synchronized Format getUpstreamFormat() {
            return this.upstreamFormatRequired ? null : this.upstreamFormat;
        }

        public synchronized long getLargestQueuedTimestampUs() {
            return Math.max(this.largestDequeuedTimestampUs, this.largestQueuedTimestampUs);
        }

        public synchronized int readData(FormatHolder formatHolder, DecoderInputBuffer buffer, Format downstreamFormat, BufferExtrasHolder extrasHolder) {
            long j;
            int i = -5;
            synchronized (this) {
                if (this.queueSize == 0) {
                    if (this.upstreamFormat != null && (buffer == null || this.upstreamFormat != downstreamFormat)) {
                        formatHolder.format = this.upstreamFormat;
                    } else {
                        i = -3;
                    }
                } else if (buffer == null || this.formats[this.relativeReadIndex] != downstreamFormat) {
                    formatHolder.format = this.formats[this.relativeReadIndex];
                } else {
                    buffer.timeUs = this.timesUs[this.relativeReadIndex];
                    buffer.setFlags(this.flags[this.relativeReadIndex]);
                    extrasHolder.size = this.sizes[this.relativeReadIndex];
                    extrasHolder.offset = this.offsets[this.relativeReadIndex];
                    extrasHolder.encryptionKeyId = this.encryptionKeys[this.relativeReadIndex];
                    this.largestDequeuedTimestampUs = Math.max(this.largestDequeuedTimestampUs, buffer.timeUs);
                    this.queueSize--;
                    this.relativeReadIndex++;
                    this.absoluteReadIndex++;
                    if (this.relativeReadIndex == this.capacity) {
                        this.relativeReadIndex = 0;
                    }
                    if (this.queueSize > 0) {
                        j = this.offsets[this.relativeReadIndex];
                    } else {
                        j = extrasHolder.offset + extrasHolder.size;
                    }
                    extrasHolder.nextOffset = j;
                    i = -4;
                }
            }
            return i;
        }

        public synchronized long skipToKeyframeBefore(long timeUs, boolean allowTimeBeyondBuffer) {
            long j = -1;
            synchronized (this) {
                if (this.queueSize != 0 && timeUs >= this.timesUs[this.relativeReadIndex] && (timeUs <= this.largestQueuedTimestampUs || allowTimeBeyondBuffer)) {
                    int sampleCount = 0;
                    int sampleCountToKeyframe = -1;
                    int searchIndex = this.relativeReadIndex;
                    while (searchIndex != this.relativeWriteIndex && this.timesUs[searchIndex] <= timeUs) {
                        if ((this.flags[searchIndex] & 1) != 0) {
                            sampleCountToKeyframe = sampleCount;
                        }
                        searchIndex = (searchIndex + 1) % this.capacity;
                        sampleCount++;
                    }
                    if (sampleCountToKeyframe != -1) {
                        this.queueSize -= sampleCountToKeyframe;
                        this.relativeReadIndex = (this.relativeReadIndex + sampleCountToKeyframe) % this.capacity;
                        this.absoluteReadIndex += sampleCountToKeyframe;
                        j = this.offsets[this.relativeReadIndex];
                    }
                }
            }
            return j;
        }

        public synchronized boolean format(Format format) {
            boolean z = false;
            synchronized (this) {
                if (format == null) {
                    this.upstreamFormatRequired = true;
                } else {
                    this.upstreamFormatRequired = false;
                    if (!Util.areEqual(format, this.upstreamFormat)) {
                        this.upstreamFormat = format;
                        z = true;
                    }
                }
            }
            return z;
        }

        public synchronized void commitSample(long timeUs, int sampleFlags, long offset, int size, byte[] encryptionKey) {
            Assertions.checkState(!this.upstreamFormatRequired);
            commitSampleTimestamp(timeUs);
            this.timesUs[this.relativeWriteIndex] = timeUs;
            this.offsets[this.relativeWriteIndex] = offset;
            this.sizes[this.relativeWriteIndex] = size;
            this.flags[this.relativeWriteIndex] = sampleFlags;
            this.encryptionKeys[this.relativeWriteIndex] = encryptionKey;
            this.formats[this.relativeWriteIndex] = this.upstreamFormat;
            this.sourceIds[this.relativeWriteIndex] = this.upstreamSourceId;
            this.queueSize++;
            if (this.queueSize == this.capacity) {
                int newCapacity = this.capacity + 1000;
                int[] newSourceIds = new int[newCapacity];
                long[] newOffsets = new long[newCapacity];
                long[] newTimesUs = new long[newCapacity];
                int[] newFlags = new int[newCapacity];
                int[] newSizes = new int[newCapacity];
                byte[][] newEncryptionKeys = new byte[newCapacity];
                Format[] newFormats = new Format[newCapacity];
                int beforeWrap = this.capacity - this.relativeReadIndex;
                System.arraycopy(this.offsets, this.relativeReadIndex, newOffsets, 0, beforeWrap);
                System.arraycopy(this.timesUs, this.relativeReadIndex, newTimesUs, 0, beforeWrap);
                System.arraycopy(this.flags, this.relativeReadIndex, newFlags, 0, beforeWrap);
                System.arraycopy(this.sizes, this.relativeReadIndex, newSizes, 0, beforeWrap);
                System.arraycopy(this.encryptionKeys, this.relativeReadIndex, newEncryptionKeys, 0, beforeWrap);
                System.arraycopy(this.formats, this.relativeReadIndex, newFormats, 0, beforeWrap);
                System.arraycopy(this.sourceIds, this.relativeReadIndex, newSourceIds, 0, beforeWrap);
                int afterWrap = this.relativeReadIndex;
                System.arraycopy(this.offsets, 0, newOffsets, beforeWrap, afterWrap);
                System.arraycopy(this.timesUs, 0, newTimesUs, beforeWrap, afterWrap);
                System.arraycopy(this.flags, 0, newFlags, beforeWrap, afterWrap);
                System.arraycopy(this.sizes, 0, newSizes, beforeWrap, afterWrap);
                System.arraycopy(this.encryptionKeys, 0, newEncryptionKeys, beforeWrap, afterWrap);
                System.arraycopy(this.formats, 0, newFormats, beforeWrap, afterWrap);
                System.arraycopy(this.sourceIds, 0, newSourceIds, beforeWrap, afterWrap);
                this.offsets = newOffsets;
                this.timesUs = newTimesUs;
                this.flags = newFlags;
                this.sizes = newSizes;
                this.encryptionKeys = newEncryptionKeys;
                this.formats = newFormats;
                this.sourceIds = newSourceIds;
                this.relativeReadIndex = 0;
                this.relativeWriteIndex = this.capacity;
                this.queueSize = this.capacity;
                this.capacity = newCapacity;
            } else {
                this.relativeWriteIndex++;
                if (this.relativeWriteIndex == this.capacity) {
                    this.relativeWriteIndex = 0;
                }
            }
        }

        public synchronized void commitSampleTimestamp(long timeUs) {
            this.largestQueuedTimestampUs = Math.max(this.largestQueuedTimestampUs, timeUs);
        }

        public synchronized boolean attemptSplice(long timeUs) {
            boolean z;
            if (this.largestDequeuedTimestampUs >= timeUs) {
                z = false;
            } else {
                int retainCount = this.queueSize;
                while (retainCount > 0 && this.timesUs[((this.relativeReadIndex + retainCount) - 1) % this.capacity] >= timeUs) {
                    retainCount--;
                }
                discardUpstreamSamples(this.absoluteReadIndex + retainCount);
                z = true;
            }
            return z;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class BufferExtrasHolder {
        public byte[] encryptionKeyId;
        public long nextOffset;
        public long offset;
        public int size;

        private BufferExtrasHolder() {
        }
    }
}
