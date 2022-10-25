package com.googlecode.mp4parser.boxes.piff;

import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import com.coremedia.iso.boxes.UserBox;
import com.facebook.appevents.AppEventsConstants;
import com.googlecode.mp4parser.AbstractFullBox;
import com.googlecode.mp4parser.RequiresParseDetailAspect;
import java.nio.ByteBuffer;
import org.mp4parser.aspectj.lang.JoinPoint;
import org.mp4parser.aspectj.runtime.reflect.Factory;
/* loaded from: classes2.dex */
public class TfxdBox extends AbstractFullBox {
    private static final JoinPoint.StaticPart ajc$tjp_0 = null;
    private static final JoinPoint.StaticPart ajc$tjp_1 = null;
    public long fragmentAbsoluteDuration;
    public long fragmentAbsoluteTime;

    static {
        ajc$preClinit();
    }

    private static void ajc$preClinit() {
        Factory factory = new Factory("TfxdBox.java", TfxdBox.class);
        ajc$tjp_0 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getFragmentAbsoluteTime", "com.googlecode.mp4parser.boxes.piff.TfxdBox", "", "", "", "long"), 79);
        ajc$tjp_1 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getFragmentAbsoluteDuration", "com.googlecode.mp4parser.boxes.piff.TfxdBox", "", "", "", "long"), 83);
    }

    public TfxdBox() {
        super(UserBox.TYPE);
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    public byte[] getUserType() {
        return new byte[]{109, 29, -101, 5, 66, -43, 68, -26, Byte.MIN_VALUE, -30, 20, 29, -81, -9, 87, -78};
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected long getContentSize() {
        return getVersion() == 1 ? 20 : 12;
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    public void _parseDetails(ByteBuffer content) {
        parseVersionAndFlags(content);
        if (getVersion() == 1) {
            this.fragmentAbsoluteTime = IsoTypeReader.readUInt64(content);
            this.fragmentAbsoluteDuration = IsoTypeReader.readUInt64(content);
            return;
        }
        this.fragmentAbsoluteTime = IsoTypeReader.readUInt32(content);
        this.fragmentAbsoluteDuration = IsoTypeReader.readUInt32(content);
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected void getContent(ByteBuffer byteBuffer) {
        writeVersionAndFlags(byteBuffer);
        if (getVersion() == 1) {
            IsoTypeWriter.writeUInt64(byteBuffer, this.fragmentAbsoluteTime);
            IsoTypeWriter.writeUInt64(byteBuffer, this.fragmentAbsoluteDuration);
            return;
        }
        IsoTypeWriter.writeUInt32(byteBuffer, this.fragmentAbsoluteTime);
        IsoTypeWriter.writeUInt32(byteBuffer, this.fragmentAbsoluteDuration);
    }

    public long getFragmentAbsoluteTime() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_0, this, this));
        return this.fragmentAbsoluteTime;
    }

    public long getFragmentAbsoluteDuration() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_1, this, this));
        return this.fragmentAbsoluteDuration;
    }
}
