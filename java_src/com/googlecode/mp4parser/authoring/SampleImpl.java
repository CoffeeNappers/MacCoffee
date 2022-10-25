package com.googlecode.mp4parser.authoring;

import com.coremedia.iso.boxes.Container;
import com.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
/* loaded from: classes2.dex */
public class SampleImpl implements Sample {
    private ByteBuffer[] data;
    private final long offset;
    private final Container parent;
    private final long size;

    public SampleImpl(ByteBuffer buf) {
        this.offset = -1L;
        this.size = buf.limit();
        this.data = new ByteBuffer[]{buf};
        this.parent = null;
    }

    public SampleImpl(ByteBuffer[] data) {
        this.offset = -1L;
        int _size = 0;
        for (ByteBuffer byteBuffer : data) {
            _size += byteBuffer.remaining();
        }
        this.size = _size;
        this.data = data;
        this.parent = null;
    }

    public SampleImpl(long offset, long sampleSize, ByteBuffer data) {
        this.offset = offset;
        this.size = sampleSize;
        this.data = new ByteBuffer[]{data};
        this.parent = null;
    }

    public SampleImpl(long offset, long sampleSize, Container parent) {
        this.offset = offset;
        this.size = sampleSize;
        this.data = null;
        this.parent = parent;
    }

    protected void ensureData() {
        if (this.data == null) {
            if (this.parent == null) {
                throw new RuntimeException("Missing parent container, can't read sample " + this);
            }
            try {
                this.data = new ByteBuffer[]{this.parent.getByteBuffer(this.offset, this.size)};
            } catch (IOException e) {
                throw new RuntimeException("couldn't read sample " + this, e);
            }
        }
    }

    @Override // com.googlecode.mp4parser.authoring.Sample
    public void writeTo(WritableByteChannel channel) throws IOException {
        ByteBuffer[] byteBufferArr;
        ensureData();
        for (ByteBuffer b : this.data) {
            channel.write(b.duplicate());
        }
    }

    @Override // com.googlecode.mp4parser.authoring.Sample
    public long getSize() {
        return this.size;
    }

    @Override // com.googlecode.mp4parser.authoring.Sample
    public ByteBuffer asByteBuffer() {
        ByteBuffer[] byteBufferArr;
        ensureData();
        byte[] bCopy = new byte[CastUtils.l2i(this.size)];
        ByteBuffer copy = ByteBuffer.wrap(bCopy);
        for (ByteBuffer b : this.data) {
            copy.put(b.duplicate());
        }
        copy.rewind();
        return copy;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SampleImpl");
        sb.append("{offset=").append(this.offset);
        sb.append("{size=").append(this.size);
        sb.append('}');
        return sb.toString();
    }
}
