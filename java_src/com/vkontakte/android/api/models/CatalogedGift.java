package com.vkontakte.android.api.models;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class CatalogedGift extends Model implements Parcelable {
    public static final Parcelable.Creator<CatalogedGift> CREATOR = new Parcelable.Creator<CatalogedGift>() { // from class: com.vkontakte.android.api.models.CatalogedGift.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public CatalogedGift mo728createFromParcel(Parcel source) {
            return new CatalogedGift(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public CatalogedGift[] mo729newArray(int size) {
            return new CatalogedGift[size];
        }
    };
    public String description;
    public boolean disabled;
    public Gift gift;
    @Nullable
    public Integer gifts_left;
    public int price;
    public String price_str;
    public int real_price;
    public String real_price_str;

    public CatalogedGift(JSONObject source) {
        boolean z = true;
        JSONObject gift = source.optJSONObject("gift");
        if (gift != null) {
            this.gift = new Gift(gift);
        }
        this.price = source.optInt("price");
        try {
            this.gifts_left = Integer.valueOf(source.getInt("gifts_left"));
        } catch (JSONException e) {
            this.gifts_left = null;
        }
        this.real_price = source.optInt("real_price");
        this.description = source.optString("description");
        this.real_price_str = source.optString("real_price_str");
        this.price_str = source.optString("price_str");
        this.disabled = source.optInt("disabled", 0) != 1 ? false : z;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        CatalogedGift that = (CatalogedGift) o;
        if (this.gift != null) {
            if (this.gift.equals(that.gift)) {
                return true;
            }
        } else if (that.gift == null) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        if (this.gift != null) {
            return this.gift.hashCode();
        }
        return 0;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        int i = 0;
        dest.writeParcelable(this.gift, 0);
        dest.writeInt(this.price);
        dest.writeSerializable(this.gifts_left);
        dest.writeInt(this.real_price);
        dest.writeString(this.description);
        if (this.disabled) {
            i = 1;
        }
        dest.writeByte((byte) i);
        dest.writeString(this.real_price_str);
        dest.writeString(this.price_str);
    }

    private CatalogedGift(Parcel in) {
        this.gift = (Gift) in.readParcelable(Gift.class.getClassLoader());
        this.price = in.readInt();
        this.gifts_left = (Integer) in.readSerializable();
        this.real_price = in.readInt();
        this.description = in.readString();
        this.disabled = in.readByte() == 1;
        this.real_price_str = in.readString();
        this.price_str = in.readString();
    }

    public boolean isFree() {
        return getPrice() <= 0;
    }

    public int getPrice() {
        return (this.price != 0 || this.gifts_left == null || this.gifts_left.intValue() > 0) ? this.price : this.real_price;
    }

    public String getPriceStr() {
        return (this.price != 0 || this.gifts_left == null || this.gifts_left.intValue() > 0) ? this.price_str : this.real_price_str;
    }

    public boolean isDisabled() {
        return this.disabled;
    }

    public boolean isLimitExpired() {
        return this.gifts_left != null && this.gifts_left.intValue() <= 0 && this.real_price <= 0;
    }

    public boolean canGift() {
        return !isDisabled() && !isLimitExpired();
    }

    public boolean isStickerPack() {
        return this.gift.stickers_product_id != null;
    }
}
