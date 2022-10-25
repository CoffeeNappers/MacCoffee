package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.exoplayer2.util.Util;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class ChapterTocFrame extends Id3Frame {
    public static final Parcelable.Creator<ChapterTocFrame> CREATOR = new Parcelable.Creator<ChapterTocFrame>() { // from class: com.google.android.exoplayer2.metadata.id3.ChapterTocFrame.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ChapterTocFrame mo341createFromParcel(Parcel in) {
            return new ChapterTocFrame(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ChapterTocFrame[] mo342newArray(int size) {
            return new ChapterTocFrame[size];
        }
    };
    public static final String ID = "CTOC";
    public final String[] children;
    public final String elementId;
    public final boolean isOrdered;
    public final boolean isRoot;
    private final Id3Frame[] subFrames;

    public ChapterTocFrame(String elementId, boolean isRoot, boolean isOrdered, String[] children, Id3Frame[] subFrames) {
        super(ID);
        this.elementId = elementId;
        this.isRoot = isRoot;
        this.isOrdered = isOrdered;
        this.children = children;
        this.subFrames = subFrames;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    ChapterTocFrame(Parcel in) {
        super(ID);
        boolean z = true;
        this.elementId = in.readString();
        this.isRoot = in.readByte() != 0;
        this.isOrdered = in.readByte() == 0 ? false : z;
        this.children = in.createStringArray();
        int subFrameCount = in.readInt();
        this.subFrames = new Id3Frame[subFrameCount];
        for (int i = 0; i < subFrameCount; i++) {
            this.subFrames[i] = (Id3Frame) in.readParcelable(Id3Frame.class.getClassLoader());
        }
    }

    public int getSubFrameCount() {
        return this.subFrames.length;
    }

    public Id3Frame getSubFrame(int index) {
        return this.subFrames[index];
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ChapterTocFrame other = (ChapterTocFrame) obj;
        return this.isRoot == other.isRoot && this.isOrdered == other.isOrdered && Util.areEqual(this.elementId, other.elementId) && Arrays.equals(this.children, other.children) && Arrays.equals(this.subFrames, other.subFrames);
    }

    public int hashCode() {
        int i = 1;
        int i2 = 0;
        int result = (this.isRoot ? 1 : 0) + 527;
        int i3 = result * 31;
        if (!this.isOrdered) {
            i = 0;
        }
        int result2 = i3 + i;
        int i4 = result2 * 31;
        if (this.elementId != null) {
            i2 = this.elementId.hashCode();
        }
        int result3 = i4 + i2;
        return result3;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        int i = 1;
        dest.writeString(this.elementId);
        dest.writeByte((byte) (this.isRoot ? 1 : 0));
        if (!this.isOrdered) {
            i = 0;
        }
        dest.writeByte((byte) i);
        dest.writeStringArray(this.children);
        dest.writeInt(this.subFrames.length);
        for (int i2 = 0; i2 < this.subFrames.length; i2++) {
            dest.writeParcelable(this.subFrames[i2], 0);
        }
    }
}
