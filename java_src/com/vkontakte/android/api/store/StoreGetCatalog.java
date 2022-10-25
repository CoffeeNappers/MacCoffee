package com.vkontakte.android.api.store;

import android.support.annotation.Nullable;
import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.PurchasesManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.orm.StickerStockItem;
import com.vkontakte.android.functions.F1;
import com.vkontakte.android.stickers.Stickers;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoreGetCatalog extends VKAPIRequest<Result> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StoreGetCatalog() {
        super("execute.getStickersCatalog");
        int i = 0;
        param(ServerKeys.TYPE, "stickers");
        param("merchant", "google");
        param("force_inapp", 0);
        param("no_inapp", !PurchasesManager.canUseInApps() ? 1 : i);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        return new Result(r.getJSONObject(ServerKeys.RESPONSE));
    }

    /* loaded from: classes2.dex */
    public static class Banner {
        public String photo_1280;
        public String photo_480;
        public String photo_640;
        public String photo_960;
        public String section;
        @Nullable
        public StickerStockItem stock_item;
        public Type type;

        public Banner(JSONObject source) throws JSONException {
            this.type = Type.parse(source.optString(ServerKeys.TYPE));
            JSONObject stock_item = source.optJSONObject("stock_item");
            if (stock_item != null) {
                this.stock_item = new StickerStockItem(stock_item, 0);
            }
            this.section = source.optString(ServerKeys.SECTION);
            this.photo_480 = source.optString("photo_480");
            this.photo_640 = source.optString("photo_640");
            this.photo_960 = source.optString("photo_960");
            this.photo_1280 = source.optString("photo_1280");
        }

        public String getBannerImage() {
            return Screen.isTablet() ? Global.displayDensity > 1.5f ? this.photo_1280 : this.photo_640 : Global.displayDensity > 1.5f ? this.photo_960 : this.photo_480;
        }
    }

    /* loaded from: classes2.dex */
    public enum Type {
        StockItem,
        Section;

        public static Type parse(String type) {
            char c = 65535;
            switch (type.hashCode()) {
                case 665729692:
                    if (type.equals("stock_item")) {
                        c = 0;
                        break;
                    }
                    break;
                case 1970241253:
                    if (type.equals(ServerKeys.SECTION)) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    return StockItem;
                case 1:
                    return Section;
                default:
                    return null;
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class Section {
        public String name;
        public List<StickerStockItem> stickers;
        public String title;

        public Section(JSONObject source) throws JSONException {
            F1 f1;
            this.title = source.optString("title");
            this.name = source.optString("name");
            JSONArray stickers = source.getJSONObject("stickers").getJSONArray(ServerKeys.ITEMS);
            this.stickers = new ArrayList(stickers.length());
            for (int i = 0; i < stickers.length(); i++) {
                this.stickers.add(new StickerStockItem(stickers.getJSONObject(i), 0));
            }
            Stickers stickers2 = Stickers.get();
            List<StickerStockItem> list = this.stickers;
            f1 = StoreGetCatalog$Section$$Lambda$1.instance;
            stickers2.fillLocalInfo(list, f1);
        }

        public static /* synthetic */ StickerStockItem lambda$new$0(StickerStockItem item) {
            return item;
        }
    }

    /* loaded from: classes2.dex */
    public static class Result {
        public List<Banner> banners;
        public List<Section> sections;

        public Result(JSONObject source) throws JSONException {
            F1 f1;
            JSONArray banners = source.getJSONArray("banners");
            this.banners = new ArrayList(banners.length());
            for (int i = 0; i < banners.length(); i++) {
                this.banners.add(new Banner(banners.getJSONObject(i)));
            }
            Stickers stickers = Stickers.get();
            List<Banner> list = this.banners;
            f1 = StoreGetCatalog$Result$$Lambda$1.instance;
            stickers.fillLocalInfo(list, f1);
            JSONArray sections = source.getJSONArray("sections");
            this.sections = new ArrayList(sections.length());
            for (int i2 = 0; i2 < sections.length(); i2++) {
                this.sections.add(new Section(sections.getJSONObject(i2)));
            }
        }
    }
}
