package com.vk.sharing.attachment;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public final class AttachmentInfo implements Parcelable {
    public static final Parcelable.Creator<AttachmentInfo> CREATOR = new Parcelable.Creator<AttachmentInfo>() { // from class: com.vk.sharing.attachment.AttachmentInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public AttachmentInfo mo523createFromParcel(Parcel source) {
            return new AttachmentInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public AttachmentInfo[] mo524newArray(int size) {
            return new AttachmentInfo[size];
        }
    };
    public static final String DATA_ARTIST = "artist";
    public static final String DATA_AUTHOR_NAME = "authorName";
    public static final String DATA_AUTHOR_PHOTO_URL = "authorPhotoUrl";
    public static final String DATA_DURATION = "duration";
    public static final String DATA_EXTENSION = "extension";
    public static final String DATA_POST_ID = "postId";
    public static final String DATA_PRICE = "cost";
    public static final String DATA_SIZE = "size";
    public static final String DATA_STATS = "stats";
    public static final String DATA_THUMB = "thumb";
    public static final String DATA_THUMBS = "thumbs";
    public static final String DATA_THUMB_URL = "thumbUrl";
    public static final String DATA_TITLE = "title";
    public static final String DATA_TRACK_CODE = "trackCode";
    @Nullable
    private final String accessKey;
    @NonNull
    private final Bundle data;
    private final int mediaId;
    private final int ownerId;
    @NonNull
    private final String ref;
    private final int type;

    private AttachmentInfo(int type, int ownerId, int mediaId, @Nullable String accessKey, @NonNull Bundle data, @NonNull String ref) {
        this.type = type;
        this.ownerId = ownerId;
        this.mediaId = mediaId;
        this.accessKey = accessKey;
        this.data = data;
        this.ref = ref;
    }

    private AttachmentInfo(@NonNull Parcel in) {
        this.type = in.readInt();
        this.ownerId = in.readInt();
        this.mediaId = in.readInt();
        this.accessKey = in.readString();
        this.data = in.readBundle(getClass().getClassLoader());
        this.ref = in.readString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.type);
        dest.writeInt(this.ownerId);
        dest.writeInt(this.mediaId);
        dest.writeString(this.accessKey);
        dest.writeBundle(this.data);
        dest.writeString(this.ref);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public int getType() {
        return this.type;
    }

    @NonNull
    public Bundle getData() {
        return this.data;
    }

    public int getOwnerId() {
        return this.ownerId;
    }

    public int getMediaId() {
        return this.mediaId;
    }

    @Nullable
    public String getAccessKey() {
        return this.accessKey;
    }

    @NonNull
    public String getRef() {
        return this.ref;
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        @Nullable
        private String accessKey;
        @NonNull
        private final Bundle data = new Bundle();
        private int mediaId;
        private int ownerId;
        @NonNull
        private String ref;
        private final int type;

        public Builder(int type, @NonNull String ref) {
            this.type = type;
            this.ref = ref;
        }

        @NonNull
        public Builder ownerId(int ownerId) {
            this.ownerId = ownerId;
            return this;
        }

        @NonNull
        public Builder mediaId(int mediaId) {
            this.mediaId = mediaId;
            return this;
        }

        @NonNull
        public Builder accessKey(@Nullable String accessKey) {
            this.accessKey = accessKey;
            return this;
        }

        @NonNull
        public Builder put(@NonNull String key, int value) {
            this.data.putInt(key, value);
            return this;
        }

        @NonNull
        public Builder put(@NonNull String key, @Nullable String value) {
            this.data.putString(key, value);
            return this;
        }

        @NonNull
        public Builder put(@NonNull String key, @Nullable Parcelable value) {
            this.data.putParcelable(key, value);
            return this;
        }

        @NonNull
        public Builder put(@NonNull String key, @Nullable ArrayList<? extends Parcelable> value) {
            this.data.putParcelableArrayList(key, value);
            return this;
        }

        @NonNull
        public AttachmentInfo build() {
            return new AttachmentInfo(this.type, this.ownerId, this.mediaId, this.accessKey, this.data, this.ref);
        }
    }
}
