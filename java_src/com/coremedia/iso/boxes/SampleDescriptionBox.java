package com.coremedia.iso.boxes;

import com.coremedia.iso.BoxParser;
import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import com.googlecode.mp4parser.AbstractContainerBox;
import com.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.Iterator;
/* loaded from: classes.dex */
public class SampleDescriptionBox extends AbstractContainerBox implements FullBox {
    public static final String TYPE = "stsd";
    private int flags;
    private int version;

    public SampleDescriptionBox() {
        super(TYPE);
    }

    @Override // com.coremedia.iso.boxes.FullBox
    public int getVersion() {
        return this.version;
    }

    @Override // com.coremedia.iso.boxes.FullBox
    public void setVersion(int version) {
        this.version = version;
    }

    @Override // com.coremedia.iso.boxes.FullBox
    public int getFlags() {
        return this.flags;
    }

    @Override // com.coremedia.iso.boxes.FullBox
    public void setFlags(int flags) {
        this.flags = flags;
    }

    @Override // com.googlecode.mp4parser.AbstractContainerBox, com.coremedia.iso.boxes.Box
    public void parse(DataSource dataSource, ByteBuffer header, long contentSize, BoxParser boxParser) throws IOException {
        ByteBuffer versionFlagNumOfChildBoxes = ByteBuffer.allocate(8);
        dataSource.read(versionFlagNumOfChildBoxes);
        versionFlagNumOfChildBoxes.rewind();
        this.version = IsoTypeReader.readUInt8(versionFlagNumOfChildBoxes);
        this.flags = IsoTypeReader.readUInt24(versionFlagNumOfChildBoxes);
        initContainer(dataSource, contentSize - 8, boxParser);
    }

    @Override // com.googlecode.mp4parser.AbstractContainerBox, com.coremedia.iso.boxes.Box
    public void getBox(WritableByteChannel writableByteChannel) throws IOException {
        writableByteChannel.write(getHeader());
        ByteBuffer versionFlagNumOfChildBoxes = ByteBuffer.allocate(8);
        IsoTypeWriter.writeUInt8(versionFlagNumOfChildBoxes, this.version);
        IsoTypeWriter.writeUInt24(versionFlagNumOfChildBoxes, this.flags);
        IsoTypeWriter.writeUInt32(versionFlagNumOfChildBoxes, getBoxes().size());
        writableByteChannel.write((ByteBuffer) versionFlagNumOfChildBoxes.rewind());
        writeContainer(writableByteChannel);
    }

    public AbstractSampleEntry getSampleEntry() {
        Iterator it = getBoxes(AbstractSampleEntry.class).iterator();
        if (it.hasNext()) {
            return (AbstractSampleEntry) it.next();
        }
        return null;
    }

    @Override // com.googlecode.mp4parser.AbstractContainerBox, com.coremedia.iso.boxes.Box
    public long getSize() {
        long s = getContainerSize();
        return ((this.largeBox || (s + 8) + 8 >= 4294967296L) ? 16 : 8) + s + 8;
    }
}
