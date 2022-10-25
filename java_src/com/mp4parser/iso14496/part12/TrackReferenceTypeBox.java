package com.mp4parser.iso14496.part12;

import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import com.facebook.appevents.AppEventsConstants;
import com.googlecode.mp4parser.AbstractBox;
import com.googlecode.mp4parser.RequiresParseDetailAspect;
import com.googlecode.mp4parser.util.Mp4Arrays;
import java.nio.ByteBuffer;
import org.mp4parser.aspectj.lang.JoinPoint;
import org.mp4parser.aspectj.runtime.reflect.Factory;
/* loaded from: classes2.dex */
public class TrackReferenceTypeBox extends AbstractBox {
    private static final JoinPoint.StaticPart ajc$tjp_0 = null;
    private static final JoinPoint.StaticPart ajc$tjp_1 = null;
    long[] trackIds;

    static {
        ajc$preClinit();
    }

    private static void ajc$preClinit() {
        Factory factory = new Factory("TrackReferenceTypeBox.java", TrackReferenceTypeBox.class);
        ajc$tjp_0 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "getTrackIds", "com.mp4parser.iso14496.part12.TrackReferenceTypeBox", "", "", "", "[J"), 58);
        ajc$tjp_1 = factory.makeSJP(JoinPoint.METHOD_EXECUTION, factory.makeMethodSig(AppEventsConstants.EVENT_PARAM_VALUE_YES, "setTrackIds", "com.mp4parser.iso14496.part12.TrackReferenceTypeBox", "[J", "trackIds", "", "void"), 62);
    }

    public TrackReferenceTypeBox(String type) {
        super(type);
        this.trackIds = new long[0];
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected long getContentSize() {
        return this.trackIds.length * 4;
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected void getContent(ByteBuffer byteBuffer) {
        long[] jArr;
        for (long trackId : this.trackIds) {
            IsoTypeWriter.writeUInt32(byteBuffer, trackId);
        }
    }

    @Override // com.googlecode.mp4parser.AbstractBox
    protected void _parseDetails(ByteBuffer content) {
        while (content.remaining() >= 4) {
            this.trackIds = Mp4Arrays.copyOfAndAppend(this.trackIds, IsoTypeReader.readUInt32(content));
        }
    }

    public long[] getTrackIds() {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_0, this, this));
        return this.trackIds;
    }

    public void setTrackIds(long[] trackIds) {
        RequiresParseDetailAspect.aspectOf().before(Factory.makeJP(ajc$tjp_1, this, this, trackIds));
        this.trackIds = trackIds;
    }
}
