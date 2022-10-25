package com.googlecode.mp4parser.boxes.threegpp26245;

import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.Utf8;
import com.facebook.appevents.AppEventsConstants;
import com.googlecode.mp4parser.AbstractBox;
import com.googlecode.mp4parser.RequiresParseDetailAspect;
import java.nio.ByteBuffer;
import java.util.LinkedList;
import java.util.List;
import org.mp4parser.aspectj.lang.JoinPoint;
import org.mp4parser.aspectj.runtime.reflect.Factory;
/* loaded from: classes2.dex */
public class FontTableBox extends AbstractBox {
    public static final String TYPE = "ftab";
    private static final JoinPoint.StaticPart ajc$tjp_0 = null;
    private static final JoinPoint.StaticPart ajc$tjp_1 = null;
    List<FontRecord> entries;

    static {
        ajc$preClinit();
    }

    private static void ajc$preClinit() {
        Factory factory = new Factory("FontTableBox.java", FontTableBox.class);
        ajc$tjp_0 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getEntries", "com.googlecode.mp4parser.boxes.threegpp26245.FontTableBox", "", "", "", "java.util.List"), 52);
        ajc$tjp_1 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setEntries", "com.googlecode.mp4parser.boxes.threegpp26245.FontTableBox", "java.util.List", "entries", "", "void"), 56);
    }

    public FontTableBox() {
        super(TYPE);
        this.entries = new LinkedList();
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected long getContentSize() {
        int size = 2;
        for (FontRecord fontRecord : this.entries) {
            size += fontRecord.getSize();
        }
        return size;
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    public void _parseDetails(ByteBuffer content) {
        int numberOfRecords = IsoTypeReader.readUInt16(content);
        for (int i = 0; i < numberOfRecords; i++) {
            FontRecord fr2 = new FontRecord();
            fr2.parse(content);
            this.entries.add(fr2);
        }
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected void getContent(ByteBuffer byteBuffer) {
        IsoTypeWriter.writeUInt16(byteBuffer, this.entries.size());
        for (FontRecord record : this.entries) {
            record.getContent(byteBuffer);
        }
    }

    public List<FontRecord> getEntries() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_0, this, this));
        return this.entries;
    }

    public void setEntries(List<FontRecord> list) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_1, this, this, list));
        this.entries = list;
    }

    /* loaded from: classes2.dex */
    public static class FontRecord {
        int fontId;
        String fontname;

        public FontRecord() {
        }

        public FontRecord(int fontId, String fontname) {
            this.fontId = fontId;
            this.fontname = fontname;
        }

        public void parse(ByteBuffer bb) {
            this.fontId = IsoTypeReader.readUInt16(bb);
            int length = IsoTypeReader.readUInt8(bb);
            this.fontname = IsoTypeReader.readString(bb, length);
        }

        public void getContent(ByteBuffer bb) {
            IsoTypeWriter.writeUInt16(bb, this.fontId);
            IsoTypeWriter.writeUInt8(bb, this.fontname.length());
            bb.put(Utf8.convert(this.fontname));
        }

        public int getSize() {
            return Utf8.utf8StringLengthInBytes(this.fontname) + 3;
        }

        public String toString() {
            return "FontRecord{fontId=" + this.fontId + ", fontname='" + this.fontname + "'}";
        }
    }
}
