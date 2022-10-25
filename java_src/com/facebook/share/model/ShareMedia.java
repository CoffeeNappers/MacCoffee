package com.facebook.share.model;

import android.os.Bundle;
import android.os.Parcel;
/* loaded from: classes.dex */
public abstract class ShareMedia implements ShareModel {
    private final Bundle params;

    /* JADX INFO: Access modifiers changed from: protected */
    public ShareMedia(Builder builder) {
        this.params = new Bundle(builder.params);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ShareMedia(Parcel in) {
        this.params = in.readBundle();
    }

    @Deprecated
    public Bundle getParameters() {
        return new Bundle(this.params);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeBundle(this.params);
    }

    /* loaded from: classes.dex */
    public static abstract class Builder<M extends ShareMedia, B extends Builder> implements ShareModelBuilder<M, B> {
        private Bundle params = new Bundle();

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.facebook.share.model.ShareModelBuilder
        public /* bridge */ /* synthetic */ ShareModelBuilder readFrom(ShareModel shareModel) {
            return readFrom((Builder<M, B>) ((ShareMedia) shareModel));
        }

        @Deprecated
        public B setParameter(String key, String value) {
            this.params.putString(key, value);
            return this;
        }

        @Deprecated
        public B setParameters(Bundle parameters) {
            this.params.putAll(parameters);
            return this;
        }

        public B readFrom(M model) {
            return model == null ? this : setParameters(model.getParameters());
        }
    }
}
