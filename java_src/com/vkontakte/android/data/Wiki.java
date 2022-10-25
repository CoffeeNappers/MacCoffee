package com.vkontakte.android.data;

import android.os.Parcel;
import android.os.Parcelable;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Wiki implements Parcelable, ServerKeys {
    public static final Parcelable.Creator<Wiki> CREATOR = new Parcelable.Creator<Wiki>() { // from class: com.vkontakte.android.data.Wiki.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Wiki mo984createFromParcel(Parcel in) {
            return new Wiki(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Wiki[] mo985newArray(int size) {
            return new Wiki[size];
        }
    };
    public final String title;
    public final String viewUrl;

    public Wiki(JSONObject o) {
        this.title = o.optString("title");
        this.viewUrl = o.optString(ServerKeys.VIEW_URL);
    }

    public Wiki(Parcel parcel) {
        this.title = parcel.readString();
        this.viewUrl = parcel.readString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeString(this.title);
        parcel.writeString(this.viewUrl);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
