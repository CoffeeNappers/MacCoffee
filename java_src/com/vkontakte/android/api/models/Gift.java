package com.vkontakte.android.api.models;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Gift extends Model implements Parcelable {
    public static final Parcelable.Creator<Gift> CREATOR = new Parcelable.Creator<Gift>() { // from class: com.vkontakte.android.api.models.Gift.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Gift mo730createFromParcel(Parcel source) {
            return new Gift(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Gift[] mo731newArray(int size) {
            return new Gift[size];
        }
    };
    public int id;
    @Nullable
    public Integer stickers_product_id;
    @Nullable
    public String thumb_256;
    @Nullable
    public String thumb_48;
    @Nullable
    public String thumb_96;

    public Gift(@NonNull JSONObject source) {
        this.id = source.optInt("id");
        this.thumb_48 = source.optString("thumb_48");
        this.thumb_96 = source.optString("thumb_96");
        this.thumb_256 = source.optString("thumb_256");
        try {
            this.stickers_product_id = Integer.valueOf(source.getInt("stickers_product_id"));
        } catch (JSONException e) {
            this.stickers_product_id = null;
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.id);
        dest.writeString(this.thumb_48);
        dest.writeString(this.thumb_96);
        dest.writeString(this.thumb_256);
        dest.writeSerializable(this.stickers_product_id);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Gift gift = (Gift) o;
        if (this.id != gift.id) {
            return false;
        }
        if (this.stickers_product_id != null) {
            if (this.stickers_product_id.equals(gift.stickers_product_id)) {
                return true;
            }
        } else if (gift.stickers_product_id == null) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        int result = this.id;
        return (result * 31) + (this.stickers_product_id != null ? this.stickers_product_id.hashCode() : 0);
    }

    public String getImage(int width) {
        return width < 48 ? this.thumb_48 : width < 96 ? this.thumb_96 : this.thumb_256;
    }

    private Gift(Parcel in) {
        this.id = in.readInt();
        this.thumb_48 = in.readString();
        this.thumb_96 = in.readString();
        this.thumb_256 = in.readString();
        this.stickers_product_id = (Integer) in.readSerializable();
    }
}
