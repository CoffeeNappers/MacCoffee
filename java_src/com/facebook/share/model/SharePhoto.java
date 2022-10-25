package com.facebook.share.model;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.facebook.share.model.ShareMedia;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class SharePhoto extends ShareMedia {
    public static final Parcelable.Creator<SharePhoto> CREATOR = new Parcelable.Creator<SharePhoto>() { // from class: com.facebook.share.model.SharePhoto.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public SharePhoto mo294createFromParcel(Parcel in) {
            return new SharePhoto(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public SharePhoto[] mo295newArray(int size) {
            return new SharePhoto[size];
        }
    };
    private final Bitmap bitmap;
    private final String caption;
    private final Uri imageUrl;
    private final boolean userGenerated;

    private SharePhoto(Builder builder) {
        super(builder);
        this.bitmap = builder.bitmap;
        this.imageUrl = builder.imageUrl;
        this.userGenerated = builder.userGenerated;
        this.caption = builder.caption;
    }

    SharePhoto(Parcel in) {
        super(in);
        this.bitmap = (Bitmap) in.readParcelable(Bitmap.class.getClassLoader());
        this.imageUrl = (Uri) in.readParcelable(Uri.class.getClassLoader());
        this.userGenerated = in.readByte() != 0;
        this.caption = in.readString();
    }

    @Nullable
    public Bitmap getBitmap() {
        return this.bitmap;
    }

    @Nullable
    public Uri getImageUrl() {
        return this.imageUrl;
    }

    public boolean getUserGenerated() {
        return this.userGenerated;
    }

    public String getCaption() {
        return this.caption;
    }

    @Override // com.facebook.share.model.ShareMedia, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.facebook.share.model.ShareMedia, android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        int i = 0;
        super.writeToParcel(out, flags);
        out.writeParcelable(this.bitmap, 0);
        out.writeParcelable(this.imageUrl, 0);
        if (this.userGenerated) {
            i = 1;
        }
        out.writeByte((byte) i);
        out.writeString(this.caption);
    }

    /* loaded from: classes.dex */
    public static final class Builder extends ShareMedia.Builder<SharePhoto, Builder> {
        private Bitmap bitmap;
        private String caption;
        private Uri imageUrl;
        private boolean userGenerated;

        public Builder setBitmap(@Nullable Bitmap bitmap) {
            this.bitmap = bitmap;
            return this;
        }

        public Builder setImageUrl(@Nullable Uri imageUrl) {
            this.imageUrl = imageUrl;
            return this;
        }

        public Builder setUserGenerated(boolean userGenerated) {
            this.userGenerated = userGenerated;
            return this;
        }

        public Builder setCaption(@Nullable String caption) {
            this.caption = caption;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public Uri getImageUrl() {
            return this.imageUrl;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public Bitmap getBitmap() {
            return this.bitmap;
        }

        @Override // com.facebook.share.ShareBuilder
        /* renamed from: build */
        public SharePhoto mo308build() {
            return new SharePhoto(this);
        }

        @Override // com.facebook.share.model.ShareMedia.Builder, com.facebook.share.model.ShareModelBuilder
        public Builder readFrom(SharePhoto model) {
            return model == null ? this : ((Builder) super.readFrom((Builder) model)).setBitmap(model.getBitmap()).setImageUrl(model.getImageUrl()).setUserGenerated(model.getUserGenerated()).setCaption(model.getCaption());
        }

        @Override // com.facebook.share.model.ShareModelBuilder
        /* renamed from: readFrom  reason: collision with other method in class */
        public Builder mo309readFrom(Parcel parcel) {
            return readFrom((SharePhoto) parcel.readParcelable(SharePhoto.class.getClassLoader()));
        }

        public static void writeListTo(Parcel out, List<SharePhoto> photos) {
            ArrayList arrayList = new ArrayList();
            for (SharePhoto photo : photos) {
                arrayList.add(photo);
            }
            out.writeTypedList(arrayList);
        }

        public static List<SharePhoto> readListFrom(Parcel in) {
            ArrayList arrayList = new ArrayList();
            in.readTypedList(arrayList, SharePhoto.CREATOR);
            return arrayList;
        }
    }
}
