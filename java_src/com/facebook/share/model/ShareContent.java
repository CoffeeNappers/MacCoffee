package com.facebook.share.model;

import android.net.Uri;
import android.os.Parcel;
import android.support.annotation.Nullable;
import com.facebook.share.model.ShareContent;
import com.facebook.share.model.ShareContent.Builder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public abstract class ShareContent<P extends ShareContent, E extends Builder> implements ShareModel {
    private final Uri contentUrl;
    private final List<String> peopleIds;
    private final String placeId;
    private final String ref;

    /* JADX INFO: Access modifiers changed from: protected */
    public ShareContent(Builder builder) {
        this.contentUrl = builder.contentUrl;
        this.peopleIds = builder.peopleIds;
        this.placeId = builder.placeId;
        this.ref = builder.ref;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ShareContent(Parcel in) {
        this.contentUrl = (Uri) in.readParcelable(Uri.class.getClassLoader());
        this.peopleIds = readUnmodifiableStringList(in);
        this.placeId = in.readString();
        this.ref = in.readString();
    }

    @Nullable
    public Uri getContentUrl() {
        return this.contentUrl;
    }

    @Nullable
    public List<String> getPeopleIds() {
        return this.peopleIds;
    }

    @Nullable
    public String getPlaceId() {
        return this.placeId;
    }

    @Nullable
    public String getRef() {
        return this.ref;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        out.writeParcelable(this.contentUrl, 0);
        out.writeStringList(this.peopleIds);
        out.writeString(this.placeId);
        out.writeString(this.ref);
    }

    private List<String> readUnmodifiableStringList(Parcel in) {
        List<String> list = new ArrayList<>();
        in.readStringList(list);
        if (list.size() == 0) {
            return null;
        }
        return Collections.unmodifiableList(list);
    }

    /* loaded from: classes.dex */
    public static abstract class Builder<P extends ShareContent, E extends Builder> implements ShareModelBuilder<P, E> {
        private Uri contentUrl;
        private List<String> peopleIds;
        private String placeId;
        private String ref;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.facebook.share.model.ShareModelBuilder
        public /* bridge */ /* synthetic */ ShareModelBuilder readFrom(ShareModel shareModel) {
            return readFrom((Builder<P, E>) ((ShareContent) shareModel));
        }

        public E setContentUrl(@Nullable Uri contentUrl) {
            this.contentUrl = contentUrl;
            return this;
        }

        public E setPeopleIds(@Nullable List<String> peopleIds) {
            this.peopleIds = peopleIds == null ? null : Collections.unmodifiableList(peopleIds);
            return this;
        }

        public E setPlaceId(@Nullable String placeId) {
            this.placeId = placeId;
            return this;
        }

        public E setRef(@Nullable String ref) {
            this.ref = ref;
            return this;
        }

        public E readFrom(P content) {
            return content == null ? this : setContentUrl(content.getContentUrl()).setPeopleIds(content.getPeopleIds()).setPlaceId(content.getPlaceId()).setRef(content.getRef());
        }
    }
}
