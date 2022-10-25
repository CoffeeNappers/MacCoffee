package com.vkontakte.android.data;

import com.vkontakte.android.Photo;
import com.vkontakte.android.api.models.PaymentType;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.utils.Serializer;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Subscription extends Serializer.SerializableAdapter implements PurchasesManager.Product {
    public static final Serializer.Creator<Subscription> CREATOR = new Serializer.CreatorAdapter<Subscription>() { // from class: com.vkontakte.android.data.Subscription.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Subscription mo1087createFromSerializer(Serializer in) {
            return new Subscription(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Subscription[] mo1088newArray(int size) {
            return new Subscription[size];
        }
    };
    public boolean can_purchase;
    public final String description;
    public final long expiredDate;
    private final int id;
    public final String management_url;
    private final String merchantProductId;
    public final String merchant_title;
    public final String no_inapp_url;
    public final Photo photo;
    private final int price;
    public String priceStr;
    public boolean purchased;
    public final String subtitle;
    public final String terms_url;
    public final String title;

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public PaymentType getPaymentType() {
        return PaymentType.Subs;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public boolean isFree() {
        return false;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public String getMerchantProductId() {
        return this.merchantProductId;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public int getPrice() {
        return this.price;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public int getId() {
        return this.id;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public String getType() {
        return "subscriptions";
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public String getDeveloperPayload() {
        return VKAccountManager.getCurrent().getUid() + ",3," + this.id + ",0";
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public String getRefer() {
        return null;
    }

    @Override // com.vkontakte.android.data.PurchasesManager.Product
    public void afterPurchased(PurchasesManager.Result result) {
    }

    public Subscription(JSONObject jo) throws JSONException {
        boolean z = true;
        JSONObject product = jo.getJSONObject("product");
        this.id = product.getInt("id");
        this.title = product.optString("title");
        this.subtitle = product.optString("subtitle");
        this.description = jo.optString("description");
        this.merchantProductId = jo.optString("merchant_product_id");
        this.price = jo.optInt("price");
        this.priceStr = jo.optString("price_str");
        this.expiredDate = product.optLong("expires_date");
        this.management_url = jo.optString("management_url");
        this.terms_url = jo.optString("terms_url");
        this.merchant_title = product.optString("merchant_title");
        this.purchased = product.optInt("purchased", 0) != 0;
        this.no_inapp_url = jo.optString("no_inapp_url");
        this.can_purchase = jo.optInt("can_purchase", 1) == 0 ? false : z;
        this.photo = new Photo();
        Iterator<String> iterator = jo.keys();
        while (iterator.hasNext()) {
            String key = iterator.next();
            if (key.matches("photo_[0-9]+")) {
                int size = Integer.parseInt(key.substring(6));
                Photo.Image image = new Photo.Image();
                image.width = size;
                image.height = size;
                image.url = jo.getString(key);
                this.photo.sizes.add(image);
            }
        }
    }

    private Subscription(Serializer in) {
        this.merchantProductId = in.readString();
        this.price = in.readInt();
        this.priceStr = in.readString();
        this.id = in.readInt();
        this.expiredDate = in.readLong();
        this.title = in.readString();
        this.subtitle = in.readString();
        this.description = in.readString();
        this.photo = (Photo) in.readSerializable(Photo.class.getClassLoader());
        this.management_url = in.readString();
        this.terms_url = in.readString();
        this.merchant_title = in.readString();
        this.purchased = in.readByte() != 0;
        this.no_inapp_url = in.readString();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.merchantProductId);
        s.writeInt(this.price);
        s.writeString(this.priceStr);
        s.writeInt(this.id);
        s.writeLong(this.expiredDate);
        s.writeString(this.title);
        s.writeString(this.subtitle);
        s.writeString(this.description);
        s.writeSerializable(this.photo);
        s.writeString(this.management_url);
        s.writeString(this.terms_url);
        s.writeString(this.merchant_title);
        s.writeByte(this.purchased ? (byte) 1 : (byte) 0);
        s.writeString(this.no_inapp_url);
    }
}
