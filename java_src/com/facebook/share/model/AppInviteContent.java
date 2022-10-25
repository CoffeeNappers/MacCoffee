package com.facebook.share.model;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes.dex */
public final class AppInviteContent implements ShareModel {
    public static final Parcelable.Creator<AppInviteContent> CREATOR = new Parcelable.Creator<AppInviteContent>() { // from class: com.facebook.share.model.AppInviteContent.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public AppInviteContent mo270createFromParcel(Parcel in) {
            return new AppInviteContent(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public AppInviteContent[] mo271newArray(int size) {
            return new AppInviteContent[size];
        }
    };
    private final String applinkUrl;
    private final String previewImageUrl;

    private AppInviteContent(Builder builder) {
        this.applinkUrl = builder.applinkUrl;
        this.previewImageUrl = builder.previewImageUrl;
    }

    AppInviteContent(Parcel in) {
        this.applinkUrl = in.readString();
        this.previewImageUrl = in.readString();
    }

    public String getApplinkUrl() {
        return this.applinkUrl;
    }

    public String getPreviewImageUrl() {
        return this.previewImageUrl;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        out.writeString(this.applinkUrl);
        out.writeString(this.previewImageUrl);
    }

    /* loaded from: classes.dex */
    public static class Builder implements ShareModelBuilder<AppInviteContent, Builder> {
        private String applinkUrl;
        private String previewImageUrl;

        public Builder setApplinkUrl(String applinkUrl) {
            this.applinkUrl = applinkUrl;
            return this;
        }

        public Builder setPreviewImageUrl(String previewImageUrl) {
            this.previewImageUrl = previewImageUrl;
            return this;
        }

        @Override // com.facebook.share.ShareBuilder
        /* renamed from: build */
        public AppInviteContent mo308build() {
            return new AppInviteContent(this);
        }

        @Override // com.facebook.share.model.ShareModelBuilder
        public Builder readFrom(AppInviteContent content) {
            return content == null ? this : setApplinkUrl(content.getApplinkUrl()).setPreviewImageUrl(content.getPreviewImageUrl());
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.facebook.share.model.ShareModelBuilder
        /* renamed from: readFrom */
        public Builder mo309readFrom(Parcel parcel) {
            return readFrom((AppInviteContent) parcel.readParcelable(AppInviteContent.class.getClassLoader()));
        }
    }
}
