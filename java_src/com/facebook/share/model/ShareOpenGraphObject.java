package com.facebook.share.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.internal.NativeProtocol;
import com.facebook.share.model.ShareOpenGraphValueContainer;
/* loaded from: classes.dex */
public final class ShareOpenGraphObject extends ShareOpenGraphValueContainer<ShareOpenGraphObject, Builder> {
    public static final Parcelable.Creator<ShareOpenGraphObject> CREATOR = new Parcelable.Creator<ShareOpenGraphObject>() { // from class: com.facebook.share.model.ShareOpenGraphObject.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ShareOpenGraphObject mo290createFromParcel(Parcel in) {
            return new ShareOpenGraphObject(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ShareOpenGraphObject[] mo291newArray(int size) {
            return new ShareOpenGraphObject[size];
        }
    };

    private ShareOpenGraphObject(Builder builder) {
        super(builder);
    }

    ShareOpenGraphObject(Parcel in) {
        super(in);
    }

    /* loaded from: classes.dex */
    public static final class Builder extends ShareOpenGraphValueContainer.Builder<ShareOpenGraphObject, Builder> {
        public Builder() {
            putBoolean(NativeProtocol.OPEN_GRAPH_CREATE_OBJECT_KEY, true);
        }

        @Override // com.facebook.share.ShareBuilder
        /* renamed from: build */
        public ShareOpenGraphObject mo308build() {
            return new ShareOpenGraphObject(this);
        }

        @Override // com.facebook.share.model.ShareModelBuilder
        /* renamed from: readFrom  reason: collision with other method in class */
        public Builder mo309readFrom(Parcel parcel) {
            return readFrom((Builder) ((ShareOpenGraphObject) parcel.readParcelable(ShareOpenGraphObject.class.getClassLoader())));
        }
    }
}
