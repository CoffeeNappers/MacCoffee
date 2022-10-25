package com.vk.attachpicker.mediastore;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes2.dex */
public class MediaStoreEntry implements Parcelable {
    public static final Parcelable.Creator<MediaStoreEntry> CREATOR = new Parcelable.Creator<MediaStoreEntry>() { // from class: com.vk.attachpicker.mediastore.MediaStoreEntry.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public MediaStoreEntry mo453createFromParcel(Parcel source) {
            return new MediaStoreEntry(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public MediaStoreEntry[] mo454newArray(int size) {
            return new MediaStoreEntry[size];
        }
    };
    private boolean corrupted;
    public final long dateTaken;
    public final int duration;
    public final int exifOrientation;
    public final int id;
    public final boolean isVideo;
    public final Uri path;

    public MediaStoreEntry(int id, Uri path, int exifOrientation, long dateTaken) {
        this.id = id;
        this.path = path;
        this.exifOrientation = exifOrientation;
        this.dateTaken = dateTaken;
        this.isVideo = false;
        this.duration = 0;
    }

    public MediaStoreEntry(int id, Uri path, long duration, long dateTaken) {
        this.id = id;
        this.path = path;
        this.duration = (int) (duration / 1000);
        this.dateTaken = dateTaken;
        this.isVideo = true;
        this.exifOrientation = 0;
    }

    public boolean isCorrupted() {
        return this.corrupted;
    }

    public void setCorrupted(boolean corrupted) {
        this.corrupted = corrupted;
    }

    public String toString() {
        return "ImageEntry{id=" + this.id + ", path=" + this.path + ", exifOrientation=" + this.exifOrientation + ", dateTaken=" + this.dateTaken + ", corrupted=" + this.corrupted + '}';
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        dest.writeInt(this.id);
        dest.writeParcelable(this.path, flags);
        dest.writeInt(this.exifOrientation);
        dest.writeLong(this.dateTaken);
        dest.writeByte(this.isVideo ? (byte) 1 : (byte) 0);
        dest.writeInt(this.duration);
        if (!this.corrupted) {
            b = 0;
        }
        dest.writeByte(b);
    }

    protected MediaStoreEntry(Parcel in) {
        boolean z = true;
        this.id = in.readInt();
        this.path = (Uri) in.readParcelable(Uri.class.getClassLoader());
        this.exifOrientation = in.readInt();
        this.dateTaken = in.readLong();
        this.isVideo = in.readByte() != 0;
        this.duration = in.readInt();
        this.corrupted = in.readByte() == 0 ? false : z;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MediaStoreEntry entry = (MediaStoreEntry) o;
        return this.id == entry.id && this.isVideo == entry.isVideo;
    }

    public int hashCode() {
        int result = this.id;
        return (result * 31) + (this.isVideo ? 1 : 0);
    }
}
