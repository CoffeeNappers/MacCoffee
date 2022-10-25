package com.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
@Descriptor(tags = {3})
/* loaded from: classes.dex */
public class ESDescriptor extends BaseDescriptor {
    private static Logger log = Logger.getLogger(ESDescriptor.class.getName());
    int URLFlag;
    String URLString;
    DecoderConfigDescriptor decoderConfigDescriptor;
    int dependsOnEsId;
    int esId;
    int oCREsId;
    int oCRstreamFlag;
    int remoteODFlag;
    SLConfigDescriptor slConfigDescriptor;
    int streamDependenceFlag;
    int streamPriority;
    int URLLength = 0;
    List<BaseDescriptor> otherDescriptors = new ArrayList();

    public ESDescriptor() {
        this.tag = 3;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public void parseDetail(ByteBuffer bb) throws IOException {
        this.esId = IsoTypeReader.readUInt16(bb);
        int data = IsoTypeReader.readUInt8(bb);
        this.streamDependenceFlag = data >>> 7;
        this.URLFlag = (data >>> 6) & 1;
        this.oCRstreamFlag = (data >>> 5) & 1;
        this.streamPriority = data & 31;
        if (this.streamDependenceFlag == 1) {
            this.dependsOnEsId = IsoTypeReader.readUInt16(bb);
        }
        if (this.URLFlag == 1) {
            this.URLLength = IsoTypeReader.readUInt8(bb);
            this.URLString = IsoTypeReader.readString(bb, this.URLLength);
        }
        if (this.oCRstreamFlag == 1) {
            this.oCREsId = IsoTypeReader.readUInt16(bb);
        }
        while (bb.remaining() > 1) {
            BaseDescriptor descriptor = ObjectDescriptorFactory.createFrom(-1, bb);
            if (descriptor instanceof DecoderConfigDescriptor) {
                this.decoderConfigDescriptor = (DecoderConfigDescriptor) descriptor;
            } else if (descriptor instanceof SLConfigDescriptor) {
                this.slConfigDescriptor = (SLConfigDescriptor) descriptor;
            } else {
                this.otherDescriptors.add(descriptor);
            }
        }
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    int getContentSize() {
        int out = 3;
        if (this.streamDependenceFlag > 0) {
            out = 3 + 2;
        }
        if (this.URLFlag > 0) {
            out += this.URLLength + 1;
        }
        if (this.oCRstreamFlag > 0) {
            out += 2;
        }
        int out2 = out + this.decoderConfigDescriptor.getSize() + this.slConfigDescriptor.getSize();
        if (this.otherDescriptors.size() > 0) {
            throw new RuntimeException(" Doesn't handle other descriptors yet");
        }
        return out2;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public ByteBuffer serialize() {
        byte[] aaa = new byte[getSize()];
        ByteBuffer out = ByteBuffer.wrap(aaa);
        IsoTypeWriter.writeUInt8(out, 3);
        writeSize(out, getContentSize());
        IsoTypeWriter.writeUInt16(out, this.esId);
        int flags = (this.streamDependenceFlag << 7) | (this.URLFlag << 6) | (this.oCRstreamFlag << 5) | (this.streamPriority & 31);
        IsoTypeWriter.writeUInt8(out, flags);
        if (this.streamDependenceFlag > 0) {
            IsoTypeWriter.writeUInt16(out, this.dependsOnEsId);
        }
        if (this.URLFlag > 0) {
            IsoTypeWriter.writeUInt8(out, this.URLLength);
            IsoTypeWriter.writeUtf8String(out, this.URLString);
        }
        if (this.oCRstreamFlag > 0) {
            IsoTypeWriter.writeUInt16(out, this.oCREsId);
        }
        ByteBuffer dec = this.decoderConfigDescriptor.serialize();
        ByteBuffer sl = this.slConfigDescriptor.serialize();
        out.put(dec.array());
        out.put(sl.array());
        return out;
    }

    public DecoderConfigDescriptor getDecoderConfigDescriptor() {
        return this.decoderConfigDescriptor;
    }

    public void setDecoderConfigDescriptor(DecoderConfigDescriptor decoderConfigDescriptor) {
        this.decoderConfigDescriptor = decoderConfigDescriptor;
    }

    public SLConfigDescriptor getSlConfigDescriptor() {
        return this.slConfigDescriptor;
    }

    public void setSlConfigDescriptor(SLConfigDescriptor slConfigDescriptor) {
        this.slConfigDescriptor = slConfigDescriptor;
    }

    public List<BaseDescriptor> getOtherDescriptors() {
        return this.otherDescriptors;
    }

    public int getoCREsId() {
        return this.oCREsId;
    }

    public void setoCREsId(int oCREsId) {
        this.oCREsId = oCREsId;
    }

    public int getEsId() {
        return this.esId;
    }

    public void setEsId(int esId) {
        this.esId = esId;
    }

    public int getStreamDependenceFlag() {
        return this.streamDependenceFlag;
    }

    public void setStreamDependenceFlag(int streamDependenceFlag) {
        this.streamDependenceFlag = streamDependenceFlag;
    }

    public int getURLFlag() {
        return this.URLFlag;
    }

    public void setURLFlag(int URLFlag) {
        this.URLFlag = URLFlag;
    }

    public int getoCRstreamFlag() {
        return this.oCRstreamFlag;
    }

    public void setoCRstreamFlag(int oCRstreamFlag) {
        this.oCRstreamFlag = oCRstreamFlag;
    }

    public int getStreamPriority() {
        return this.streamPriority;
    }

    public void setStreamPriority(int streamPriority) {
        this.streamPriority = streamPriority;
    }

    public int getURLLength() {
        return this.URLLength;
    }

    public void setURLLength(int URLLength) {
        this.URLLength = URLLength;
    }

    public String getURLString() {
        return this.URLString;
    }

    public void setURLString(String URLString) {
        this.URLString = URLString;
    }

    public int getRemoteODFlag() {
        return this.remoteODFlag;
    }

    public void setRemoteODFlag(int remoteODFlag) {
        this.remoteODFlag = remoteODFlag;
    }

    public int getDependsOnEsId() {
        return this.dependsOnEsId;
    }

    public void setDependsOnEsId(int dependsOnEsId) {
        this.dependsOnEsId = dependsOnEsId;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ESDescriptor");
        sb.append("{esId=").append(this.esId);
        sb.append(", streamDependenceFlag=").append(this.streamDependenceFlag);
        sb.append(", URLFlag=").append(this.URLFlag);
        sb.append(", oCRstreamFlag=").append(this.oCRstreamFlag);
        sb.append(", streamPriority=").append(this.streamPriority);
        sb.append(", URLLength=").append(this.URLLength);
        sb.append(", URLString='").append(this.URLString).append('\'');
        sb.append(", remoteODFlag=").append(this.remoteODFlag);
        sb.append(", dependsOnEsId=").append(this.dependsOnEsId);
        sb.append(", oCREsId=").append(this.oCREsId);
        sb.append(", decoderConfigDescriptor=").append(this.decoderConfigDescriptor);
        sb.append(", slConfigDescriptor=").append(this.slConfigDescriptor);
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
        ESDescriptor that = (ESDescriptor) o;
        if (this.URLFlag == that.URLFlag && this.URLLength == that.URLLength && this.dependsOnEsId == that.dependsOnEsId && this.esId == that.esId && this.oCREsId == that.oCREsId && this.oCRstreamFlag == that.oCRstreamFlag && this.remoteODFlag == that.remoteODFlag && this.streamDependenceFlag == that.streamDependenceFlag && this.streamPriority == that.streamPriority) {
            if (this.URLString == null ? that.URLString != null : !this.URLString.equals(that.URLString)) {
                return false;
            }
            if (this.decoderConfigDescriptor == null ? that.decoderConfigDescriptor != null : !this.decoderConfigDescriptor.equals(that.decoderConfigDescriptor)) {
                return false;
            }
            if (this.otherDescriptors == null ? that.otherDescriptors != null : !this.otherDescriptors.equals(that.otherDescriptors)) {
                return false;
            }
            if (this.slConfigDescriptor != null) {
                if (this.slConfigDescriptor.equals(that.slConfigDescriptor)) {
                    return true;
                }
            } else if (that.slConfigDescriptor == null) {
                return true;
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int i = 0;
        int result = this.esId;
        int hashCode = ((((((((((((((((((((((result * 31) + this.streamDependenceFlag) * 31) + this.URLFlag) * 31) + this.oCRstreamFlag) * 31) + this.streamPriority) * 31) + this.URLLength) * 31) + (this.URLString != null ? this.URLString.hashCode() : 0)) * 31) + this.remoteODFlag) * 31) + this.dependsOnEsId) * 31) + this.oCREsId) * 31) + (this.decoderConfigDescriptor != null ? this.decoderConfigDescriptor.hashCode() : 0)) * 31) + (this.slConfigDescriptor != null ? this.slConfigDescriptor.hashCode() : 0)) * 31;
        if (this.otherDescriptors != null) {
            i = this.otherDescriptors.hashCode();
        }
        int result2 = hashCode + i;
        return result2;
    }
}
