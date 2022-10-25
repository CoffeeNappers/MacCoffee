package com.vkontakte.android.data.orm;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.vkontakte.android.api.models.Model;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.orm.Column;
import java.util.Arrays;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public abstract class Product extends Model implements Parcelable, PurchasesManager.Product {
    public static final String REFERRER_KEYBOARD = "keyboard";
    public static final String REFERRER_LINK = "link";
    public static final String REFERRER_MESSAGE = "message";
    public static final String REFERRER_STORE = "store";
    @Column("active")
    public boolean active;
    public int[] allStickerIds;
    @Column("base_url")
    @Nullable
    public String base_url;
    @Column("disallowed_sticker_ids")
    public int[] disallowed_sticker_ids;
    @Column(Id = true, value = "id")
    public int id;
    @Column("promoted")
    public boolean promoted;
    @Column("purchase_date")
    public long purchase_date;
    @Column("purchased")
    public boolean purchased;
    public String referrer;
    @Column("stickers_ids")
    public int[] sticker_ids;
    @Column("stickers_base_url")
    @Nullable
    public String stickers_base_url;
    @Column("title")
    @Nullable
    public String title;
    @Column(ServerKeys.TYPE)
    @Nullable
    public String type;

    public static String getReferrerSuggestion(String keyword) {
        return "suggestion_" + keyword;
    }

    public Product() {
    }

    public Product(JSONObject product) throws JSONException {
        parseProduct(product);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void parseProduct(JSONObject product) {
        boolean z = true;
        this.id = product.optInt("id", this.id);
        this.type = product.optString(ServerKeys.TYPE, this.type);
        this.title = product.optString("title", this.title);
        this.purchased = product.optInt("purchased") == 1;
        this.active = product.optInt("active") == 1;
        if (product.optInt("promoted") != 1) {
            z = false;
        }
        this.promoted = z;
        this.purchase_date = product.optLong("purchase_date", this.purchase_date);
        this.base_url = product.optString("base_url", this.base_url);
        JSONObject stickers = product.optJSONObject("stickers");
        if (stickers != null) {
            this.stickers_base_url = stickers.optString("base_url");
            JSONArray sticker_ids = stickers.optJSONArray("sticker_ids");
            if (sticker_ids != null) {
                this.sticker_ids = new int[sticker_ids.length()];
                for (int i = 0; i < sticker_ids.length(); i++) {
                    this.sticker_ids[i] = sticker_ids.optInt(i);
                }
            }
            JSONArray disallowed_stickers_ids = stickers.optJSONArray("disallowed_stickers_ids");
            if (disallowed_stickers_ids != null) {
                this.disallowed_sticker_ids = new int[disallowed_stickers_ids.length()];
                for (int i2 = 0; i2 < disallowed_stickers_ids.length(); i2++) {
                    this.disallowed_sticker_ids[i2] = disallowed_stickers_ids.optInt(i2);
                }
            }
        }
    }

    public int[] getAllStickerIds() {
        if (this.sticker_ids != null && this.disallowed_sticker_ids != null) {
            if (this.allStickerIds == null) {
                this.allStickerIds = new int[this.sticker_ids.length + this.disallowed_sticker_ids.length];
                System.arraycopy(this.sticker_ids, 0, this.allStickerIds, 0, this.sticker_ids.length);
                System.arraycopy(this.disallowed_sticker_ids, 0, this.allStickerIds, this.sticker_ids.length, this.disallowed_sticker_ids.length);
            }
            return this.allStickerIds;
        } else if (this.sticker_ids != null) {
            return this.sticker_ids;
        } else {
            if (this.disallowed_sticker_ids != null) {
                return this.disallowed_sticker_ids;
            }
            return null;
        }
    }

    public boolean isAllowedSticker(int stickerId) {
        return this.disallowed_sticker_ids == null || Arrays.binarySearch(this.disallowed_sticker_ids, stickerId) < 0;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public int getId() {
        return this.id;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    @Nullable
    public String getType() {
        return this.type;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public String getRefer() {
        return this.referrer;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        StickerStockItem that = (StickerStockItem) o;
        return this.id == that.id;
    }

    public int hashCode() {
        return this.id;
    }

    public String toString() {
        return this.title;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        dest.writeInt(this.id);
        dest.writeString(this.type);
        dest.writeByte(this.purchased ? (byte) 1 : (byte) 0);
        dest.writeByte(this.active ? (byte) 1 : (byte) 0);
        if (!this.promoted) {
            b = 0;
        }
        dest.writeByte(b);
        dest.writeLong(this.purchase_date);
        dest.writeString(this.title);
        dest.writeString(this.base_url);
        dest.writeString(this.stickers_base_url);
        dest.writeIntArray(this.sticker_ids);
        dest.writeIntArray(this.disallowed_sticker_ids);
        dest.writeString(this.referrer == null ? "" : this.referrer);
    }

    public Product(Parcel in) {
        boolean z = true;
        this.id = in.readInt();
        this.type = in.readString();
        this.purchased = in.readByte() != 0;
        this.active = in.readByte() != 0;
        this.promoted = in.readByte() == 0 ? false : z;
        this.purchase_date = in.readLong();
        this.title = in.readString();
        this.base_url = in.readString();
        this.stickers_base_url = in.readString();
        this.sticker_ids = in.createIntArray();
        this.disallowed_sticker_ids = in.createIntArray();
        this.referrer = in.readString();
    }
}
