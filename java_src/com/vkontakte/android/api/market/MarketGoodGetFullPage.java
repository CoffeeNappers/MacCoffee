package com.vkontakte.android.api.market;

import android.util.SparseArray;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.board.BoardComment;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.LikeInfo;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MarketGoodGetFullPage extends VKAPIRequest<GoodFullPage> implements ServerKeys {

    /* loaded from: classes2.dex */
    public static class GoodFullPage {
        public final VKList<BoardComment> comments;
        public final int contact_id;
        public final String contact_name;
        public final String contact_photo_100;
        public final String contact_photo_200;
        public final String contact_photo_50;
        public final Good good;
        public final List<LikeInfo> likes;
        public final int offset;
        public final int owner_id;
        public final String owner_name;
        public final String owner_photo_100;
        public final String owner_photo_200;
        public final String owner_photo_50;
        public final String wiki_title;
        public final String wiki_view_url;

        private GoodFullPage(JSONObject o) throws JSONException {
            JSONObject o2 = o.optJSONObject(ServerKeys.RESPONSE);
            this.good = (!o2.has("good") || o2.isNull("good")) ? null : new Good(o2.optJSONObject("good"));
            this.owner_name = o2.optString("owner_name");
            this.owner_id = o2.optInt("owner_id");
            this.offset = o2.optInt("offset");
            this.owner_photo_50 = o2.optString("owner_photo_50");
            this.owner_photo_100 = o2.optString("owner_photo_100");
            this.owner_photo_200 = o2.optString("owner_photo_200");
            this.wiki_title = Utils.optString(o2, "wiki_title");
            this.wiki_view_url = Utils.optString(o2, "wiki_view_url");
            this.contact_id = o2.optInt("contact_id");
            this.contact_name = o2.optString("contact_name");
            this.contact_photo_50 = o2.optString("contact_photo_50");
            this.contact_photo_100 = o2.optString("contact_photo_100");
            this.contact_photo_200 = o2.optString("contact_photo_200");
            this.likes = LikeInfo.parse(o2.optJSONArray(ServerKeys.LIKES));
            if (o2.has("comments") && !o2.isNull("comments") && (o2.get("comments") instanceof JSONObject)) {
                final SparseArray<String> names = new SparseArray<>();
                final SparseArray<String> photos = new SparseArray<>();
                final SparseArray<String> names_dat = new SparseArray<>();
                JSONArray jprofiles = o2.getJSONObject("comments").optJSONArray("profiles");
                if (jprofiles != null) {
                    for (int i = 0; i < jprofiles.length(); i++) {
                        JSONObject p = jprofiles.getJSONObject(i);
                        names.put(p.getInt("id"), p.getString("first_name") + ' ' + p.getString("last_name"));
                        names_dat.put(p.getInt("id"), p.optString("first_name_dat"));
                        photos.put(p.getInt("id"), p.getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec"));
                    }
                }
                JSONArray jprofiles2 = o2.getJSONObject("comments").optJSONArray("groups");
                if (jprofiles2 != null) {
                    for (int i2 = 0; i2 < jprofiles2.length(); i2++) {
                        JSONObject p2 = jprofiles2.getJSONObject(i2);
                        names.put(-p2.getInt("id"), p2.getString("name"));
                        photos.put(-p2.getInt("id"), p2.getString(Global.displayDensity > 1.0f ? "photo_200" : "photo_100"));
                    }
                }
                this.comments = new VKList<>(o2.optJSONObject("comments"), new Parser<BoardComment>() { // from class: com.vkontakte.android.api.market.MarketGoodGetFullPage.GoodFullPage.1
                    int i;

                    {
                        this.i = GoodFullPage.this.offset;
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // com.vkontakte.android.data.Parser
                    /* renamed from: parse */
                    public BoardComment mo821parse(JSONObject o3) throws JSONException {
                        SparseArray sparseArray = names;
                        SparseArray sparseArray2 = photos;
                        int i3 = this.i;
                        this.i = i3 + 1;
                        return new BoardComment(o3, sparseArray, sparseArray2, i3, GoodFullPage.this.owner_id, names_dat);
                    }
                });
                return;
            }
            this.comments = null;
        }
    }

    public MarketGoodGetFullPage(int ownerId, int item_id, boolean forceLoadGood, int offset, int count) {
        super("execute.getMarketItemFullPage");
        param("owner_id", ownerId).param("id", item_id).param("offset", offset).param(ServerKeys.COUNT, count).param("need_likes", 1);
        if (forceLoadGood) {
            param("forceLoadGood", 1);
        }
        param("func_v", 2);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public GoodFullPage mo1093parse(JSONObject r) throws Exception {
        try {
            return new GoodFullPage(r);
        } catch (Exception e) {
            L.e(e, new Object[0]);
            return null;
        }
    }
}
