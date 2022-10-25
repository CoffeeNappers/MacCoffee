package com.coremedia.iso.boxes;

import com.coremedia.iso.BoxParser;
import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import com.googlecode.mp4parser.AbstractContainerBox;
import com.googlecode.mp4parser.DataSource;
import com.googlecode.mp4parser.MemoryDataSourceImpl;
import com.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
/* loaded from: classes.dex */
public class MetaBox extends AbstractContainerBox {
    public static final String TYPE = "meta";
    private int flags;
    private boolean isFullBox;
    private int version;

    public MetaBox() {
        super(TYPE);
        this.isFullBox = true;
    }

    public int getVersion() {
        return this.version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public int getFlags() {
        return this.flags;
    }

    public void setFlags(int flags) {
        this.flags = flags;
    }

    protected final long parseVersionAndFlags(ByteBuffer content) {
        this.version = IsoTypeReader.readUInt8(content);
        this.flags = IsoTypeReader.readUInt24(content);
        return 4L;
    }

    protected final void writeVersionAndFlags(ByteBuffer bb) {
        IsoTypeWriter.writeUInt8(bb, this.version);
        IsoTypeWriter.writeUInt24(bb, this.flags);
    }

    @Override // com.googlecode.mp4parser.AbstractContainerBox, com.coremedia.iso.boxes.Box
    public void parse(DataSource dataSource, ByteBuffer header, long contentSize, BoxParser boxParser) throws IOException {
        ByteBuffer bb = ByteBuffer.allocate(CastUtils.l2i(contentSize));
        dataSource.read(bb);
        bb.position(4);
        String isHdlr = IsoTypeReader.read4cc(bb);
        if (HandlerBox.TYPE.equals(isHdlr)) {
            this.isFullBox = false;
            initContainer(new MemoryDataSourceImpl((ByteBuffer) bb.rewind()), contentSize, boxParser);
            return;
        }
        this.isFullBox = true;
        parseVersionAndFlags((ByteBuffer) bb.rewind());
        initContainer(new MemoryDataSourceImpl(bb), contentSize - 4, boxParser);
    }

    @Override // com.googlecode.mp4parser.AbstractContainerBox, com.coremedia.iso.boxes.Box
    public void getBox(WritableByteChannel writableByteChannel) throws IOException {
        writableByteChannel.write(getHeader());
        if (this.isFullBox) {
            ByteBuffer bb = ByteBuffer.allocate(4);
            writeVersionAndFlags(bb);
            writableByteChannel.write((ByteBuffer) bb.rewind());
        }
        writeContainer(writableByteChannel);
    }

    @Override // com.googlecode.mp4parser.AbstractContainerBox, com.coremedia.iso.boxes.Box
    public long getSize() {
        long s = getContainerSize();
        long t = 0;
        if (this.isFullBox) {
            t = 0 + 4;
        }
        return ((this.largeBox || s + t >= 4294967296L) ? 16 : 8) + s + t;
    }
}
