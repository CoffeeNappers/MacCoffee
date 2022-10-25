package com.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import java.io.IOException;
import java.nio.ByteBuffer;
@Descriptor(tags = {6})
/* loaded from: classes.dex */
public class SLConfigDescriptor extends BaseDescriptor {
    int predefined;

    public SLConfigDescriptor() {
        this.tag = 6;
    }

    public int getPredefined() {
        return this.predefined;
    }

    public void setPredefined(int predefined) {
        this.predefined = predefined;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public void parseDetail(ByteBuffer bb) throws IOException {
        this.predefined = IsoTypeReader.readUInt8(bb);
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    int getContentSize() {
        return 1;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public ByteBuffer serialize() {
        ByteBuffer out = ByteBuffer.allocate(getSize());
        IsoTypeWriter.writeUInt8(out, 6);
        writeSize(out, getContentSize());
        IsoTypeWriter.writeUInt8(out, this.predefined);
        return out;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("SLConfigDescriptor");
        sb.append("{predefined=").append(this.predefined);
        sb.append('}');
        return sb.toString();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        SLConfigDescriptor that = (SLConfigDescriptor) o;
        return this.predefined == that.predefined;
    }

    public int hashCode() {
        return this.predefined;
    }
}
