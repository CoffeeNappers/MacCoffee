package com.googlecode.mp4parser.authoring.tracks;

import com.coremedia.iso.boxes.CompositionTimeToSample;
import com.coremedia.iso.boxes.SampleDependencyTypeBox;
import com.googlecode.mp4parser.DataSource;
import com.googlecode.mp4parser.authoring.AbstractTrack;
import com.googlecode.mp4parser.authoring.Sample;
import com.googlecode.mp4parser.authoring.SampleImpl;
import com.googlecode.mp4parser.authoring.TrackMetaData;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public abstract class AbstractH26XTrack extends AbstractTrack {
    public static int BUFFER = 67107840;
    protected List<CompositionTimeToSample.Entry> ctts;
    private DataSource dataSource;
    protected long[] decodingTimes;
    protected List<SampleDependencyTypeBox.Entry> sdtp;
    protected List<Integer> stss;
    protected TrackMetaData trackMetaData;
    boolean tripleZeroIsEndOfSequence;

    @Override // com.googlecode.mp4parser.authoring.Track
    public TrackMetaData getTrackMetaData() {
        return this.trackMetaData;
    }

    public AbstractH26XTrack(DataSource dataSource, boolean tripleZeroIsEndOfSequence) {
        super(dataSource.toString());
        this.ctts = new ArrayList();
        this.sdtp = new ArrayList();
        this.stss = new ArrayList();
        this.trackMetaData = new TrackMetaData();
        this.tripleZeroIsEndOfSequence = true;
        this.dataSource = dataSource;
        this.tripleZeroIsEndOfSequence = tripleZeroIsEndOfSequence;
    }

    public AbstractH26XTrack(DataSource dataSource) {
        this(dataSource, true);
    }

    /* loaded from: classes2.dex */
    public static class LookAhead {
        ByteBuffer buffer;
        DataSource dataSource;
        long start;
        long bufferStartPos = 0;
        int inBufferPos = 0;

        public void fillBuffer() throws IOException {
            this.buffer = this.dataSource.map(this.bufferStartPos, Math.min(this.dataSource.size() - this.bufferStartPos, AbstractH26XTrack.BUFFER));
        }

        public LookAhead(DataSource dataSource) throws IOException {
            this.dataSource = dataSource;
            fillBuffer();
        }

        public boolean nextThreeEquals001() throws IOException {
            if (this.buffer.limit() - this.inBufferPos >= 3) {
                return this.buffer.get(this.inBufferPos) == 0 && this.buffer.get(this.inBufferPos + 1) == 0 && this.buffer.get(this.inBufferPos + 2) == 1;
            } else if (this.bufferStartPos + this.inBufferPos + 3 < this.dataSource.size()) {
                return false;
            } else {
                throw new EOFException();
            }
        }

        public boolean nextThreeEquals000or001orEof(boolean tripleZeroIsEndOfSequence) throws IOException {
            if (this.buffer.limit() - this.inBufferPos >= 3) {
                return this.buffer.get(this.inBufferPos) == 0 && this.buffer.get(this.inBufferPos + 1) == 0 && ((this.buffer.get(this.inBufferPos + 2) == 0 && tripleZeroIsEndOfSequence) || this.buffer.get(this.inBufferPos + 2) == 1);
            } else if (this.bufferStartPos + this.inBufferPos + 3 > this.dataSource.size()) {
                return this.bufferStartPos + ((long) this.inBufferPos) == this.dataSource.size();
            } else {
                this.bufferStartPos = this.start;
                this.inBufferPos = 0;
                fillBuffer();
                return nextThreeEquals000or001orEof(tripleZeroIsEndOfSequence);
            }
        }

        public void discardByte() {
            this.inBufferPos++;
        }

        public void discardNext3AndMarkStart() {
            this.inBufferPos += 3;
            this.start = this.bufferStartPos + this.inBufferPos;
        }

        public ByteBuffer getNal() {
            if (this.start >= this.bufferStartPos) {
                this.buffer.position((int) (this.start - this.bufferStartPos));
                Buffer sample = this.buffer.slice();
                sample.limit((int) (this.inBufferPos - (this.start - this.bufferStartPos)));
                return (ByteBuffer) sample;
            }
            throw new RuntimeException("damn! NAL exceeds buffer");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ByteBuffer findNextNal(LookAhead la) throws IOException {
        while (!la.nextThreeEquals001()) {
            try {
                la.discardByte();
            } catch (EOFException e) {
                return null;
            }
        }
        la.discardNext3AndMarkStart();
        while (!la.nextThreeEquals000or001orEof(this.tripleZeroIsEndOfSequence)) {
            la.discardByte();
        }
        return la.getNal();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Sample createSampleObject(List<? extends ByteBuffer> nals) {
        byte[] sizeInfo = new byte[nals.size() * 4];
        ByteBuffer sizeBuf = ByteBuffer.wrap(sizeInfo);
        for (ByteBuffer b : nals) {
            sizeBuf.putInt(b.remaining());
        }
        ByteBuffer[] data = new ByteBuffer[nals.size() * 2];
        for (int i = 0; i < nals.size(); i++) {
            data[i * 2] = ByteBuffer.wrap(sizeInfo, i * 4, 4);
            data[(i * 2) + 1] = nals.get(i);
        }
        return new SampleImpl(data);
    }

    @Override // com.googlecode.mp4parser.authoring.Track
    public long[] getSampleDurations() {
        return this.decodingTimes;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public List<CompositionTimeToSample.Entry> getCompositionTimeEntries() {
        return this.ctts;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public long[] getSyncSamples() {
        long[] returns = new long[this.stss.size()];
        for (int i = 0; i < this.stss.size(); i++) {
            returns[i] = this.stss.get(i).intValue();
        }
        return returns;
    }

    @Override // com.googlecode.mp4parser.authoring.AbstractTrack, com.googlecode.mp4parser.authoring.Track
    public List<SampleDependencyTypeBox.Entry> getSampleDependencies() {
        return this.sdtp;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static InputStream cleanBuffer(InputStream is) {
        return new CleanInputStream(is);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static byte[] toArray(ByteBuffer buf) {
        ByteBuffer buf2 = buf.duplicate();
        byte[] b = new byte[buf2.remaining()];
        buf2.get(b, 0, b.length);
        return b;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.dataSource.close();
    }
}
