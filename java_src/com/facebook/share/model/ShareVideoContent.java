package com.facebook.share.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.facebook.share.model.ShareContent;
import com.facebook.share.model.SharePhoto;
import com.facebook.share.model.ShareVideo;
/* loaded from: classes.dex */
public final class ShareVideoContent extends ShareContent<ShareVideoContent, Builder> implements ShareModel {
    public static final Parcelable.Creator<ShareVideoContent> CREATOR = new Parcelable.Creator<ShareVideoContent>() { // from class: com.facebook.share.model.ShareVideoContent.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ShareVideoContent mo306createFromParcel(Parcel in) {
            return new ShareVideoContent(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ShareVideoContent[] mo307newArray(int size) {
            return new ShareVideoContent[size];
        }
    };
    private final String contentDescription;
    private final String contentTitle;
    private final SharePhoto previewPhoto;
    private final ShareVideo video;

    private ShareVideoContent(Builder builder) {
        super(builder);
        this.contentDescription = builder.contentDescription;
        this.contentTitle = builder.contentTitle;
        this.previewPhoto = builder.previewPhoto;
        this.video = builder.video;
    }

    ShareVideoContent(Parcel in) {
        super(in);
        this.contentDescription = in.readString();
        this.contentTitle = in.readString();
        SharePhoto.Builder previewPhotoBuilder = new SharePhoto.Builder().mo309readFrom(in);
        if (previewPhotoBuilder.getImageUrl() != null || previewPhotoBuilder.getBitmap() != null) {
            this.previewPhoto = previewPhotoBuilder.mo308build();
        } else {
            this.previewPhoto = null;
        }
        this.video = new ShareVideo.Builder().mo309readFrom(in).mo308build();
    }

    @Nullable
    public String getContentDescription() {
        return this.contentDescription;
    }

    @Nullable
    public String getContentTitle() {
        return this.contentTitle;
    }

    @Nullable
    public SharePhoto getPreviewPhoto() {
        return this.previewPhoto;
    }

    @Nullable
    public ShareVideo getVideo() {
        return this.video;
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
        out.writeParcelable(this.previewPhoto, 0);
        out.writeParcelable(this.video, 0);
    }

    /* loaded from: classes.dex */
    public static final class Builder extends ShareContent.Builder<ShareVideoContent, Builder> {
        private String contentDescription;
        private String contentTitle;
        private SharePhoto previewPhoto;
        private ShareVideo video;

        public Builder setContentDescription(@Nullable String contentDescription) {
            this.contentDescription = contentDescription;
            return this;
        }

        public Builder setContentTitle(@Nullable String contentTitle) {
            this.contentTitle = contentTitle;
            return this;
        }

        public Builder setPreviewPhoto(@Nullable SharePhoto previewPhoto) {
            this.previewPhoto = previewPhoto == null ? null : new SharePhoto.Builder().readFrom(previewPhoto).mo308build();
            return this;
        }

        public Builder setVideo(@Nullable ShareVideo video) {
            if (video != null) {
                this.video = new ShareVideo.Builder().readFrom(video).mo308build();
            }
            return this;
        }

        @Override // com.facebook.share.ShareBuilder
        /* renamed from: build */
        public ShareVideoContent mo308build() {
            return new ShareVideoContent(this);
        }

        @Override // com.facebook.share.model.ShareContent.Builder, com.facebook.share.model.ShareModelBuilder
        public Builder readFrom(ShareVideoContent model) {
            return model == null ? this : ((Builder) super.readFrom((Builder) model)).setContentDescription(model.getContentDescription()).setContentTitle(model.getContentTitle()).setPreviewPhoto(model.getPreviewPhoto()).setVideo(model.getVideo());
        }

        @Override // com.facebook.share.model.ShareModelBuilder
        /* renamed from: readFrom  reason: collision with other method in class */
        public Builder mo309readFrom(Parcel parcel) {
            return readFrom((ShareVideoContent) parcel.readParcelable(ShareVideoContent.class.getClassLoader()));
        }
    }
}
