package com.vkontakte.android.api.market;

import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.text.TextUtils;
import com.google.android.gms.actions.SearchIntents;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.R;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.GoodAlbum;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MarketGetMarketPage extends VKAPIRequest<Response> implements ServerKeys {

    /* loaded from: classes2.dex */
    public enum SortType {
        byDefault(R.string.market_sort_default, 0),
        byAddDate(R.string.market_sort_date, 2),
        byPriceAsk(R.string.market_sort_price_desc, 3),
        byPriceDesc(R.string.market_sort_price_ask, 4);
        
        private final int intType;
        @StringRes
        public final int titleRes;

        SortType(int titleRes, int intType) {
            this.titleRes = titleRes;
            this.intType = intType;
        }
    }

    /* loaded from: classes2.dex */
    public static class Response extends VKList<Good> {
        public String albumTitle;
        @Nullable
        public VKList<GoodAlbum> albums;
        public String currency;
        public boolean hasMarket;
        public long maxPrice;
        public long minPrice;

        public Response(JSONObject obj, Class<Good> cls) throws JSONException {
            super(obj, cls);
            this.albums = null;
        }
    }

    public MarketGetMarketPage(int ownerId, int count, int offset) {
        super("execute.getMarketPage");
        param("owner_id", ownerId).param(ServerKeys.COUNT, count).param("offset", offset).param("extended", 1);
    }

    public static MarketGetMarketPage fave(int count, int offset) {
        MarketGetMarketPage marketPage = new MarketGetMarketPage(VKAccountManager.getCurrent().getUid(), count, offset);
        marketPage.param("method", "fave.getMarketItems").param(ServerKeys.PHOTO_SIZES, 1);
        return marketPage;
    }

    public void setAlbumsParams(int albumsCount, int albumsOffset) {
        param("albums_count", albumsCount).param("albums_offset", albumsOffset);
    }

    public void setQuery(String searchQuery) {
        param(SearchIntents.EXTRA_QUERY, searchQuery);
    }

    public void setAlbumId(int albumID) {
        param("album_id", albumID);
    }

    public void setSortType(SortType sortType) {
        param("sort_type", sortType.intType);
    }

    public void forceLoadMarket() {
        param("load_market", 1);
    }

    public void setPrice(long priceFrom, long priceTo) {
        param("price_from", priceFrom * 100);
        param("price_to", priceTo * 100);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Response mo1093parse(JSONObject o) throws Exception {
        int i = 1;
        try {
            JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
            Response response = new Response(o2, Good.class);
            if (o2.has("albums") && !o2.isNull("albums")) {
                response.albums = new VKList<>(o2.getJSONObject("albums"), GoodAlbum.class);
            }
            response.albumTitle = o2.optString("album_title");
            JSONObject market = o2.optJSONObject(ReportAppInputData.REPORT_TYPE_MARKET);
            response.hasMarket = market != null;
            if (market != null) {
                try {
                    String tmp = market.optString("price_min");
                    if (!TextUtils.isEmpty(tmp)) {
                        response.minPrice = Long.parseLong(tmp) / 100;
                    }
                    String tmp2 = market.optString("price_max");
                    if (!TextUtils.isEmpty(tmp2)) {
                        response.maxPrice = Long.parseLong(tmp2);
                        long j = response.maxPrice / 100;
                        if (response.maxPrice % 100 <= 0) {
                            i = 0;
                        }
                        response.maxPrice = j + i;
                    }
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                }
                response.currency = market.optString("currency_text");
                return response;
            }
            return response;
        } catch (Exception e2) {
            L.e(e2, new Object[0]);
            return null;
        }
    }
}
