package com.googlecode.mp4parser;

import com.googlecode.mp4parser.util.CastUtils;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;
/* loaded from: classes2.dex */
public class MultiFileDataSourceImpl implements DataSource {
    FileChannel[] fcs;
    int index = 0;

    public MultiFileDataSourceImpl(File... f) throws FileNotFoundException {
        this.fcs = new FileChannel[f.length];
        for (int i = 0; i < f.length; i++) {
            this.fcs[i] = new FileInputStream(f[i]).getChannel();
        }
    }

    @Override // com.googlecode.mp4parser.DataSource
    public int read(ByteBuffer byteBuffer) throws IOException {
        int numOfBytesToRead = byteBuffer.remaining();
        int numOfBytesRead = this.fcs[this.index].read(byteBuffer);
        if (numOfBytesRead != numOfBytesToRead) {
            this.index++;
            return numOfBytesRead + read(byteBuffer);
        }
        return numOfBytesRead;
    }

    @Override // com.googlecode.mp4parser.DataSource
    public long size() throws IOException {
        FileChannel[] fileChannelArr;
        long size = 0;
        for (FileChannel fileChannel : this.fcs) {
            size += fileChannel.size();
        }
        return size;
    }

    @Override // com.googlecode.mp4parser.DataSource
    public long position() throws IOException {
        long position = 0;
        for (int i = 0; i < this.index; i++) {
            position += this.fcs[i].size();
        }
        return this.fcs[this.index].position() + position;
    }

    @Override // com.googlecode.mp4parser.DataSource
    public void position(long nuPos) throws IOException {
        for (int i = 0; i < this.fcs.length; i++) {
            if (nuPos - this.fcs[i].size() < 0) {
                this.fcs[i].position(nuPos);
                this.index = i;
                return;
            }
            nuPos -= this.fcs[i].size();
        }
    }

    @Override // com.googlecode.mp4parser.DataSource
    public long transferTo(long startPosition, long count, WritableByteChannel sink) throws IOException {
        FileChannel[] fileChannelArr;
        if (count == 0) {
            return 0L;
        }
        long currentPos = 0;
        for (FileChannel fc : this.fcs) {
            long size = fc.size();
            if (startPosition >= currentPos && startPosition < currentPos + size && startPosition + count > currentPos) {
                long bytesToTransfer = Math.min(count, size - (startPosition - currentPos));
                fc.transferTo(startPosition - currentPos, bytesToTransfer, sink);
                return transferTo(startPosition + bytesToTransfer, count - bytesToTransfer, sink) + bytesToTransfer;
            }
            currentPos += size;
        }
        return 0L;
    }

    @Override // com.googlecode.mp4parser.DataSource
    public ByteBuffer map(long startPosition, long size) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream(CastUtils.l2i(size));
        transferTo(startPosition, size, Channels.newChannel(baos));
        return ByteBuffer.wrap(baos.toByteArray());
    }

    @Override // com.googlecode.mp4parser.DataSource, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        FileChannel[] fileChannelArr;
        for (FileChannel fileChannel : this.fcs) {
            fileChannel.close();
        }
    }
}
