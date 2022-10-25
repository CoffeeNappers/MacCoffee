package com.facebook.share.model;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.facebook.share.model.ShareContent;
/* loaded from: classes.dex */
public final class ShareLinkContent extends ShareContent<ShareLinkContent, Builder> {
    public static final Parcelable.Creator<ShareLinkContent> CREATOR = new Parcelable.Creator<ShareLinkContent>() { // from class: com.facebook.share.model.ShareLinkContent.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ShareLinkContent mo278createFromParcel(Parcel in) {
            return new ShareLinkContent(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ShareLinkContent[] mo279newArray(int size) {
            return new ShareLinkContent[size];
        }
    };
    private final String contentDescription;
    private final String contentTitle;
    private final Uri imageUrl;

    private ShareLinkContent(Builder builder) {
        super(builder);
        this.contentDescription = builder.contentDescription;
        this.contentTitle = builder.contentTitle;
        this.imageUrl = builder.imageUrl;
    }

    ShareLinkContent(Parcel in) {
        super(in);
        this.contentDescription = in.readString();
        this.contentTitle = in.readString();
        this.imageUrl = (Uri) in.readParcelable(Uri.class.getClassLoader());
    }

    public String getContentDescription() {
        return this.contentDescription;
    }

    @Nullable
    public String getContentTitle() {
        return this.contentTitle;
    }

    @Nullable
    public Uri getImageUrl() {
        return this.imageUrl;
    }

    @Override // com.facebook.share.model.ShareContent, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.facebook.share.model.ShareContent, android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        super.writeToParcel(out, flags);
        out.writeString(this.contentDescription);
        out.writeString(this.contentTitle);
        out.writeParcelable(this.imageUrl, 0);
    }

    /* loaded from: classes.dex */
    public static final class Builder extends ShareContent.Builder<ShareLinkContent, Builder> {
        private String contentDescription;
        private String contentTitle;
        private Uri imageUrl;

        public Builder setContentDescription(@Nullable String contentDescription) {
            this.contentDescription = contentDescription;
            return this;
        }

        public Builder setContentTitle(@Nullable String contentTitle) {
            this.contentTitle = contentTitle;
            return this;
        }

        public Builder setImageUrl(@Nullable Uri imageUrl) {
            this.imageUrl = imageUrl;
            return this;
        }

        @Override // com.facebook.share.ShareBuilder
        /* renamed from: build */
        public ShareLinkContent mo308build() {
            return new ShareLinkContent(this);
        }

        @Override // com.facebook.share.model.ShareContent.Builder, com.facebook.share.model.ShareModelBuilder
        public Builder readFrom(ShareLinkContent model) {
            return model == null ? this : ((Builder) super.readFrom((Builder) model)).setContentDescription(model.getContentDescription()).setImageUrl(model.getImageUrl()).setContentTitle(model.getContentTitle());
        }

        @Override // com.facebook.share.model.ShareModelBuilder
        /* renamed from: readFrom */
        public Builder mo309readFrom(Parcel parcel) {
            return readFrom((ShareLinkContent) parcel.readParcelable(ShareLinkContent.class.getClassLoader()));
        }
    }
}
