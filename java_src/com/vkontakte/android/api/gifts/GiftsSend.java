package com.vkontakte.android.api.gifts;

import android.content.Context;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.share.internal.ShareConstants;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.models.CatalogedGift;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GiftsSend extends VKAPIRequest<Result> {
    public GiftsSend(Context context, int guid, List<UserProfile> users, CatalogedGift gift, CharSequence message, boolean privacy) {
        super("gifts.send");
        ArrayList<Integer> ids = new ArrayList<>();
        for (UserProfile profile : users) {
            ids.add(Integer.valueOf(profile.uid));
        }
        param(ServerKeys.USER_IDS, TextUtils.join(",", ids));
        param("gift_id", gift.gift.id);
        param(ShareConstants.WEB_DIALOG_PARAM_PRIVACY, privacy ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        if (!TextUtils.isEmpty(message)) {
            param("message", message.toString());
        }
        param("guid", guid);
        param("no_inapp", GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) != 0 ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param("force_payment", 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) {
        return new Result(r.optJSONObject(ServerKeys.RESPONSE));
    }

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean success;
        public int[] user_ids;
        public int withdrawn_votes;

        public Result(JSONObject source) {
            boolean z = true;
            if (source != null) {
                this.success = source.optInt("success", 0) != 1 ? false : z;
                this.withdrawn_votes = source.optInt("withdrawn_votes");
                JSONArray array = source.optJSONArray(ServerKeys.USER_IDS);
                if (array != null) {
                    this.user_ids = new int[array.length()];
                    for (int i = 0; i < array.length(); i++) {
                        this.user_ids[i] = array.optInt(i);
                    }
                    Arrays.sort(this.user_ids);
                }
            }
        }
    }
}
