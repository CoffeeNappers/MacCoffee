package com.facebook.share.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.facebook.share.model.ShareOpenGraphValueContainer;
/* loaded from: classes.dex */
public final class ShareOpenGraphAction extends ShareOpenGraphValueContainer<ShareOpenGraphAction, Builder> {
    public static final Parcelable.Creator<ShareOpenGraphAction> CREATOR = new Parcelable.Creator<ShareOpenGraphAction>() { // from class: com.facebook.share.model.ShareOpenGraphAction.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ShareOpenGraphAction mo282createFromParcel(Parcel in) {
            return new ShareOpenGraphAction(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ShareOpenGraphAction[] mo283newArray(int size) {
            return new ShareOpenGraphAction[size];
        }
    };

    private ShareOpenGraphAction(Builder builder) {
        super(builder);
    }

    ShareOpenGraphAction(Parcel in) {
        super(in);
    }

    @Nullable
    public String getActionType() {
        return getString("og:type");
    }

    /* loaded from: classes.dex */
    public static final class Builder extends ShareOpenGraphValueContainer.Builder<ShareOpenGraphAction, Builder> {
        private static final String ACTION_TYPE_KEY = "og:type";

        public Builder setActionType(String actionType) {
            putString(ACTION_TYPE_KEY, actionType);
            return this;
        }

        @Override // com.facebook.share.ShareBuilder
        /* renamed from: build */
        public ShareOpenGraphAction mo308build() {
            return new ShareOpenGraphAction(this);
        }

        @Override // com.facebook.share.model.ShareOpenGraphValueContainer.Builder
        public Builder readFrom(ShareOpenGraphAction model) {
            return model == null ? this : ((Builder) super.readFrom((Builder) model)).setActionType(model.getActionType());
        }

        @Override // com.facebook.share.model.ShareModelBuilder
        /* renamed from: readFrom  reason: collision with other method in class */
        public Builder mo309readFrom(Parcel parcel) {
            return readFrom((ShareOpenGraphAction) parcel.readParcelable(ShareOpenGraphAction.class.getClassLoader()));
        }
    }
}
