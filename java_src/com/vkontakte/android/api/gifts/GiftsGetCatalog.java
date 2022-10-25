package com.vkontakte.android.api.gifts;

import android.content.Context;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.models.GiftCategory;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GiftsGetCatalog extends VKAPIRequest<Result> {
    public GiftsGetCatalog(Context context, int user_id) {
        super("execute.getGiftsCatalogMaterial");
        param("user_id", user_id);
        param("no_inapp", GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) != 0 ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param("force_payment", 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws JSONException {
        JSONObject response = r.getJSONObject(ServerKeys.RESPONSE);
        JSONArray gifts = response.optJSONArray("gifts");
        if (gifts != null) {
            List<GiftCategory> result = new ArrayList<>(gifts.length());
            for (int i = 0; i < gifts.length(); i++) {
                JSONObject item = gifts.optJSONObject(i);
                if (item != null) {
                    result.add(new GiftCategory(item));
                }
            }
            return new Result(response.optInt("balance"), result);
        }
        throw new APIException(-2, "Parse error");
    }

    /* loaded from: classes2.dex */
    public static class Result {
        public final List<GiftCategory> catalog;
        public final int votes;

        public Result(int votes, List<GiftCategory> catalog) {
            this.votes = votes;
            this.catalog = catalog;
        }
    }
}
