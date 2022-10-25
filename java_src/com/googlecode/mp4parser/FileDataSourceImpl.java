package com.googlecode.mp4parser;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.googlecode.mp4parser.util.Logger;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;
/* loaded from: classes2.dex */
public class FileDataSourceImpl implements DataSource {
    private static Logger LOG = Logger.getLogger(FileDataSourceImpl.class);
    FileChannel fc;
    String filename;

    public FileDataSourceImpl(File f) throws FileNotFoundException {
        this.fc = new FileInputStream(f).getChannel();
        this.filename = f.getName();
    }

    public FileDataSourceImpl(String f) throws FileNotFoundException {
        File file = new File(f);
        this.fc = new FileInputStream(file).getChannel();
        this.filename = file.getName();
    }

    public FileDataSourceImpl(FileChannel fc) {
        this.fc = fc;
        this.filename = "unknown";
    }

    public FileDataSourceImpl(FileChannel fc, String filename) {
        this.fc = fc;
        this.filename = filename;
    }

    @Override // com.googlecode.mp4parser.DataSource
    public synchronized int read(ByteBuffer byteBuffer) throws IOException {
        return this.fc.read(byteBuffer);
    }

    @Override // com.googlecode.mp4parser.DataSource
    public synchronized long size() throws IOException {
        return this.fc.size();
    }

    @Override // com.googlecode.mp4parser.DataSource
    public synchronized long position() throws IOException {
        return this.fc.position();
    }

    @Override // com.googlecode.mp4parser.DataSource
    public synchronized void position(long nuPos) throws IOException {
        this.fc.position(nuPos);
    }

    @Override // com.googlecode.mp4parser.DataSource
    public synchronized long transferTo(long startPosition, long count, WritableByteChannel sink) throws IOException {
        return this.fc.transferTo(startPosition, count, sink);
    }

    @Override // com.googlecode.mp4parser.DataSource
    public synchronized ByteBuffer map(long startPosition, long size) throws IOException {
        LOG.logDebug(String.valueOf(startPosition) + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + size);
        return this.fc.map(FileChannel.MapMode.READ_ONLY, startPosition, size);
    }

    @Override // com.googlecode.mp4parser.DataSource, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.fc.close();
    }

    public String toString() {
        return this.filename;
    }
}
