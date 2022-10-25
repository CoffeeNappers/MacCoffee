package com.vkontakte.android.data.orm;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.coremedia.iso.boxes.FreeBox;
import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.models.PaymentType;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.orm.Column;
import com.vkontakte.android.orm.Entity;
import com.vkontakte.android.orm.Index;
import com.vkontakte.android.stickers.Stickers;
import com.vkontakte.android.stickers.StickersConfig;
import me.grishka.appkit.utils.V;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@Entity(inheritance = true, value = "sticker_stock_items_v2")
/* loaded from: classes.dex */
public class StickerStockItem extends Product implements Parcelable, Comparable<StickerStockItem> {
    public static final Parcelable.Creator<StickerStockItem> CREATOR = new Parcelable.Creator<StickerStockItem>() { // from class: com.vkontakte.android.data.orm.StickerStockItem.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public StickerStockItem mo986createFromParcel(Parcel source) {
            return new StickerStockItem(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public StickerStockItem[] mo987newArray(int size) {
            return new StickerStockItem[size];
        }
    };
    @Column("author")
    @Nullable
    public String author;
    @Column("background")
    @Nullable
    public String background;
    @Column("can_purchase")
    public boolean can_purchase;
    @Column("compat")
    @Deprecated
    public boolean compatMode;
    @Column("demo_photos_560")
    @Nullable
    public String[] demo_photos_560;
    @Column("description")
    @Nullable
    public String description;
    @Column("downloaded")
    @Index("IND_STICKER_STOCK_ITEM_DOWNLOADED")
    @Deprecated
    public boolean downloaded;
    @Column(FreeBox.TYPE)
    public boolean free;
    @Column("isNew")
    public boolean isNew;
    @Column("merchant_product_id")
    @Nullable
    public String merchant_product_id;
    public String no_purchase_reason;
    @Column("user_order")
    @Index("IND_STICKER_STOCK_ITEM_ORDER")
    public int order;
    @Column("payment_type")
    @Nullable
    public PaymentType payment_type;
    @Column("photo_140")
    @Nullable
    public String photo_140;
    @Column("photo_296")
    @Nullable
    public String photo_296;
    @Column("photo_35")
    @Nullable
    public String photo_35;
    @Column("photo_592")
    @Nullable
    public String photo_592;
    @Column("photo_70")
    @Nullable
    public String photo_70;
    @Column("price")
    public int price;
    @Column("price_str")
    @Nullable
    public String price_str;

    public StickerStockItem() {
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StickerStockItem(JSONObject source, int position) throws JSONException {
        super(source.has("product") ? source.getJSONObject("product") : source);
        boolean z = true;
        this.order = position;
        this.description = source.optString("description");
        this.author = source.optString("author");
        this.can_purchase = source.optInt("can_purchase", 0) == 1;
        this.free = source.optInt(FreeBox.TYPE, 0) == 1;
        this.isNew = source.optInt("new") != 1 ? false : z;
        this.merchant_product_id = source.optString("merchant_product_id");
        this.payment_type = PaymentType.parse(source.optString("payment_type"));
        this.price = source.optInt("price");
        this.price_str = source.optString("price_str");
        this.photo_35 = source.optString("photo_35");
        this.photo_70 = source.optString("photo_70");
        this.photo_140 = source.optString("photo_140");
        this.photo_296 = source.optString("photo_296");
        this.photo_592 = source.optString("photo_592");
        this.background = source.optString("background");
        JSONArray demo_photos_560 = source.optJSONArray("demo_photos_560");
        if (demo_photos_560 != null) {
            this.demo_photos_560 = new String[demo_photos_560.length()];
            for (int i = 0; i < demo_photos_560.length(); i++) {
                this.demo_photos_560[i] = demo_photos_560.optString(i);
            }
        }
        this.no_purchase_reason = source.optString("no_purchase_reason", "");
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public PaymentType getPaymentType() {
        return this.payment_type;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public boolean isFree() {
        return this.free;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public String getMerchantProductId() {
        return this.merchant_product_id;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public int getPrice() {
        return this.price;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public String getDeveloperPayload() {
        return VKAccountManager.getCurrent().getUid() + ",1," + this.id + "," + VKAccountManager.getCurrent().getUid();
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public void afterPurchased(PurchasesManager.Result result) {
        if (result != null && result.product != null) {
            parseProduct(result.product);
        } else {
            this.purchased = true;
        }
        Stickers.get().purchase(this);
    }

    @Override // com.vkontakte.android.data.orm.Product, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.data.orm.Product, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        super.writeToParcel(dest, flags);
        dest.writeString(this.description);
        dest.writeString(this.author);
        dest.writeByte(this.can_purchase ? (byte) 1 : (byte) 0);
        dest.writeByte(this.free ? (byte) 1 : (byte) 0);
        dest.writeInt(this.payment_type == null ? -1 : this.payment_type.ordinal());
        dest.writeInt(this.price);
        dest.writeString(this.price_str);
        dest.writeString(this.merchant_product_id);
        dest.writeString(this.photo_35);
        dest.writeString(this.photo_70);
        dest.writeString(this.photo_140);
        dest.writeString(this.photo_296);
        dest.writeString(this.photo_592);
        dest.writeString(this.background);
        dest.writeStringArray(this.demo_photos_560);
        dest.writeByte(this.isNew ? (byte) 1 : (byte) 0);
        dest.writeByte(this.downloaded ? (byte) 1 : (byte) 0);
        if (!this.compatMode) {
            b = 0;
        }
        dest.writeByte(b);
        dest.writeInt(this.order);
        dest.writeString(this.no_purchase_reason);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    private StickerStockItem(Parcel in) {
        super(in);
        boolean z = true;
        this.description = in.readString();
        this.author = in.readString();
        this.can_purchase = in.readByte() != 0;
        this.free = in.readByte() != 0;
        int tmpPayment_type = in.readInt();
        this.payment_type = tmpPayment_type == -1 ? null : PaymentType.values()[tmpPayment_type];
        this.price = in.readInt();
        this.price_str = in.readString();
        this.merchant_product_id = in.readString();
        this.photo_35 = in.readString();
        this.photo_70 = in.readString();
        this.photo_140 = in.readString();
        this.photo_296 = in.readString();
        this.photo_592 = in.readString();
        this.background = in.readString();
        this.demo_photos_560 = in.createStringArray();
        this.isNew = in.readByte() != 0;
        this.downloaded = in.readByte() != 0;
        this.compatMode = in.readByte() == 0 ? false : z;
        this.order = in.readInt();
        this.no_purchase_reason = in.readString();
    }

    public String getServerIconURL() {
        return this.base_url + "thumb_" + adjustSize(StickersConfig.KEYBOARD_THUMB_SIZE, 34, 51, 68, 102) + ".png";
    }

    public String getServerThumbURL() {
        if (Screen.isTablet()) {
            return Global.displayDensity > 1.0f ? this.photo_592 : this.photo_296;
        }
        return getPhoto(V.dp(68.0f));
    }

    public String getServerBackgroundURL() {
        return this.background;
    }

    public String getServerStickerKeyboardURL(int id) {
        return this.stickers_base_url + id + '/' + adjustSize(StickersConfig.STICKER_KEYBOARD_SIZE, 64, 128, 256, 352, 512) + "b.png";
    }

    public String getServerStickerViewURL(int id) {
        return getServerStickerViewURL(this.stickers_base_url, id);
    }

    public static String getServerStickerViewURL(String baseUrl, int id) {
        return baseUrl + id + '/' + adjustSize(StickersConfig.STICKER_SIZE, 64, 128, 256, 352, 512) + "b.png";
    }

    public String getStickerPreviewUrl(int id) {
        return this.stickers_base_url + id + '/' + adjustSize(StickersConfig.PREVIEW_SIZE, 64, 128, 256, 352, 512) + "b.png";
    }

    public String getPhoto(int size) {
        return size > 70 ? this.photo_140 : size > 35 ? this.photo_70 : this.photo_35;
    }

    public String getThumbUrl() {
        return getServerThumbURL();
    }

    @Override // java.lang.Comparable
    public int compareTo(@NonNull StickerStockItem another) {
        if (this.order < another.order) {
            return -1;
        }
        return this.order == another.order ? 0 : 1;
    }

    public static int adjustSize(int size, @NonNull int... values) {
        int nextValue = values[0];
        for (int i = 0; i < values.length - 1; i++) {
            int value = values[i];
            if (size > value) {
                nextValue = values[i + 1];
                if (size <= nextValue) {
                    return values[i + 1];
                }
            } else {
                return value;
            }
        }
        return nextValue;
    }
}
