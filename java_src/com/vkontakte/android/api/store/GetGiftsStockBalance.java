package com.vkontakte.android.api.store;

import com.coremedia.iso.boxes.FreeBox;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.models.PaymentType;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.data.orm.Product;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.functions.F2;
import com.vkontakte.android.functions.Functions;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetGiftsStockBalance extends VKAPIRequest<Result> {
    public GetGiftsStockBalance() {
        super("execute.getGiftsStockBalance");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        try {
            return new Result(r.getJSONObject(ServerKeys.RESPONSE));
        } catch (JSONException e) {
            throw new APIException(-2, e.getMessage());
        }
    }

    /* loaded from: classes2.dex */
    public class Result {
        public int balance;
        public VKList<VotesProduct> products;

        public Result(JSONObject source) throws JSONException, PurchasesManager.PayNotAvailableException {
            JSONObject votes = source.optJSONObject("balance");
            this.balance = votes == null ? 0 : votes.optInt("votes");
            this.products = new VKList<>(source.getJSONObject("products"), VotesProduct.class);
            Map<String, VotesProduct> map = Functions.map(this.products, new F1<String, VotesProduct>() { // from class: com.vkontakte.android.api.store.GetGiftsStockBalance.Result.1
                @Override // com.vkontakte.android.functions.F1
                public String f(VotesProduct product) {
                    return product.merchant_product_id;
                }
            });
            if (PurchasesManager.canUseInApps()) {
                PurchasesManager.getGooglePlayPrices(map, new F2<Void, VotesProduct, String>() { // from class: com.vkontakte.android.api.store.GetGiftsStockBalance.Result.2
                    @Override // com.vkontakte.android.functions.F2
                    public Void f(VotesProduct product, String s) {
                        product.description = s;
                        return null;
                    }
                });
                return;
            }
            throw new PurchasesManager.PayNotAvailableException();
        }
    }

    /* loaded from: classes2.dex */
    public static class VotesProduct extends Product {
        public String author;
        public boolean can_purchase;
        public String description;
        public boolean free;
        public String merchant_product_id;
        public int votes;

        public VotesProduct(JSONObject source) throws JSONException {
            boolean z = true;
            JSONObject product = source.getJSONObject("product");
            if (product != null) {
                parseProduct(product);
                this.votes = product.optInt("votes");
            }
            this.description = source.optString("description");
            this.author = source.optString("author");
            this.can_purchase = source.optInt("can_purchase", 0) == 1;
            this.free = source.optInt(FreeBox.TYPE, 0) != 1 ? false : z;
            this.merchant_product_id = source.optString("merchant_product_id");
        }

        @Override // com.vkontakte.android.data.PurchasesManager.Product
        public String getDeveloperPayload() {
            return VKAccountManager.getCurrent().getUid() + ",2," + this.id + "," + VKAccountManager.getCurrent().getUid();
        }

        @Override // com.vkontakte.android.data.PurchasesManager.Product
        public void afterPurchased(PurchasesManager.Result result) {
        }

        @Override // com.vkontakte.android.data.PurchasesManager.Product
        public PaymentType getPaymentType() {
            return PaymentType.Inapp;
        }

        @Override // com.vkontakte.android.data.PurchasesManager.Product
        public boolean isFree() {
            return false;
        }

        @Override // com.vkontakte.android.data.PurchasesManager.Product
        public String getMerchantProductId() {
            return this.merchant_product_id;
        }

        @Override // com.vkontakte.android.data.PurchasesManager.Product
        public int getPrice() {
            return 0;
        }
    }
}
