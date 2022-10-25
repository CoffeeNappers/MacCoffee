package com.googlecode.mp4parser.boxes.mp4.samplegrouping;

import com.coremedia.iso.IsoTypeReader;
import com.coremedia.iso.IsoTypeWriter;
import com.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes2.dex */
public class RateShareEntry extends GroupEntry {
    public static final String TYPE = "rash";
    private short discardPriority;
    private List<Entry> entries = new LinkedList();
    private int maximumBitrate;
    private int minimumBitrate;
    private short operationPointCut;
    private short targetRateShare;

    @Override // com.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry
    public String getType() {
        return TYPE;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry
    public void parse(ByteBuffer byteBuffer) {
        this.operationPointCut = byteBuffer.getShort();
        if (this.operationPointCut == 1) {
            this.targetRateShare = byteBuffer.getShort();
        } else {
            int entriesLeft = this.operationPointCut;
            while (true) {
                int entriesLeft2 = entriesLeft;
                entriesLeft = entriesLeft2 - 1;
                if (entriesLeft2 <= 0) {
                    break;
                }
                this.entries.add(new Entry(CastUtils.l2i(IsoTypeReader.readUInt32(byteBuffer)), byteBuffer.getShort()));
            }
        }
        this.maximumBitrate = CastUtils.l2i(IsoTypeReader.readUInt32(byteBuffer));
        this.minimumBitrate = CastUtils.l2i(IsoTypeReader.readUInt32(byteBuffer));
        this.discardPriority = (short) IsoTypeReader.readUInt8(byteBuffer);
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry
    public ByteBuffer get() {
        ByteBuffer buf = ByteBuffer.allocate(this.operationPointCut == 1 ? 13 : (this.operationPointCut * 6) + 11);
        buf.putShort(this.operationPointCut);
        if (this.operationPointCut == 1) {
            buf.putShort(this.targetRateShare);
        } else {
            for (Entry entry : this.entries) {
                buf.putInt(entry.getAvailableBitrate());
                buf.putShort(entry.getTargetRateShare());
            }
        }
        buf.putInt(this.maximumBitrate);
        buf.putInt(this.minimumBitrate);
        IsoTypeWriter.writeUInt8(buf, this.discardPriority);
        buf.rewind();
        return buf;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        RateShareEntry that = (RateShareEntry) o;
        if (this.discardPriority == that.discardPriority && this.maximumBitrate == that.maximumBitrate && this.minimumBitrate == that.minimumBitrate && this.operationPointCut == that.operationPointCut && this.targetRateShare == that.targetRateShare) {
            if (this.entries != null) {
                if (this.entries.equals(that.entries)) {
                    return true;
                }
            } else if (that.entries == null) {
                return true;
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int result = this.operationPointCut;
        return (((((((((result * 31) + this.targetRateShare) * 31) + (this.entries != null ? this.entries.hashCode() : 0)) * 31) + this.maximumBitrate) * 31) + this.minimumBitrate) * 31) + this.discardPriority;
    }

    public short getOperationPointCut() {
        return this.operationPointCut;
    }

    public void setOperationPointCut(short operationPointCut) {
        this.operationPointCut = operationPointCut;
    }

    public short getTargetRateShare() {
        return this.targetRateShare;
    }

    public void setTargetRateShare(short targetRateShare) {
        this.targetRateShare = targetRateShare;
    }

    public List<Entry> getEntries() {
        return this.entries;
    }

    public void setEntries(List<Entry> entries) {
        this.entries = entries;
    }

    public int getMaximumBitrate() {
        return this.maximumBitrate;
    }

    public void setMaximumBitrate(int maximumBitrate) {
        this.maximumBitrate = maximumBitrate;
    }

    public int getMinimumBitrate() {
        return this.minimumBitrate;
    }

    public void setMinimumBitrate(int minimumBitrate) {
        this.minimumBitrate = minimumBitrate;
    }

    public short getDiscardPriority() {
        return this.discardPriority;
    }

    public void setDiscardPriority(short discardPriority) {
        this.discardPriority = discardPriority;
    }

    /* loaded from: classes2.dex */
    public static class Entry {
        int availableBitrate;
        short targetRateShare;

        public Entry(int availableBitrate, short targetRateShare) {
            this.availableBitrate = availableBitrate;
            this.targetRateShare = targetRateShare;
        }

        public String toString() {
            return "{availableBitrate=" + this.availableBitrate + ", targetRateShare=" + ((int) this.targetRateShare) + '}';
        }

        public int getAvailableBitrate() {
            return this.availableBitrate;
        }

        public void setAvailableBitrate(int availableBitrate) {
            this.availableBitrate = availableBitrate;
        }

        public short getTargetRateShare() {
            return this.targetRateShare;
        }

        public void setTargetRateShare(short targetRateShare) {
            this.targetRateShare = targetRateShare;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            Entry entry = (Entry) o;
            return this.availableBitrate == entry.availableBitrate && this.targetRateShare == entry.targetRateShare;
        }

        public int hashCode() {
            int result = this.availableBitrate;
            return (result * 31) + this.targetRateShare;
        }
    }
}
