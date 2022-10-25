package com.vkontakte.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import org.json.JSONException;
import org.json.JSONObject;
@Deprecated
/* loaded from: classes.dex */
public class Image implements Parcelable {
    public static final Parcelable.Creator<Image> CREATOR = new Parcelable.Creator<Image>() { // from class: com.vkontakte.android.Image.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Image mo546createFromParcel(Parcel in) {
            return new Image(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Image[] mo547newArray(int size) {
            return new Image[size];
        }
    };
    public final int h;
    public final String url;
    public final int w;

    public Image(JSONObject o) {
        int i = 0;
        this.url = o == null ? null : o.optString("url");
        this.w = o == null ? 0 : o.optInt("width");
        this.h = o != null ? o.optInt("height") : i;
    }

    @NonNull
    public JSONObject toJSONObject(@Nullable JSONObject o) throws JSONException {
        if (o == null) {
            o = new JSONObject();
        }
        return o.put("url", this.url).put("width", this.w).put("height", this.h);
    }

    public Image(Parcel parcel) {
        this.url = parcel.readString();
        this.w = parcel.readInt();
        this.h = parcel.readInt();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeString(this.url);
        parcel.writeInt(this.w);
        parcel.writeInt(this.h);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
