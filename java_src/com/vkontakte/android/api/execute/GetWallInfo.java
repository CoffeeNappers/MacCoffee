package com.vkontakte.android.api.execute;

import android.os.Build;
import android.text.TextUtils;
import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.store.StoreHasNewItems;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAuthUtils;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetWallInfo extends VKAPIRequest<Result> {
    private static final String[] INFO_FIELDS = {"audio_ads", "audio_background_limit", "country", "debug_available", "gif_autoplay", "https_required", "intro", "lang", "money_clubs_p2p", "money_p2p", "money_p2p_params", "music_intro", "audio_restrictions", "profiler_settings", "raise_to_record_enabled", "stories", "masks", "subscriptions", "support_url", "video_autoplay", "video_player", "vklive_app", "community_comments"};

    /* loaded from: classes2.dex */
    public static class Result {
        public String bdate;
        public StoreHasNewItems.Response hasNewItemsResponse;
        public boolean needUpdateGoogleNow;
        public int time;
        public VKAccount vkAccount;
    }

    public GetWallInfo() {
        super("execute.getUserInfo");
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,exports,country,sex,status,bdate,first_name_gen,last_name_gen,verified");
        param("info_fields", TextUtils.join(",", INFO_FIELDS));
        param("androidVersion", Build.VERSION.SDK_INT);
        param("androidManufacturer", Build.MANUFACTURER);
        param("androidModel", Build.MODEL);
        param("func_v", 9);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        boolean z = true;
        try {
            JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
            JSONObject jp = o2.getJSONObject("profile");
            JSONObject info = o2.getJSONObject(UserNotification.LAYOUT_NEWSFEED_INFO);
            Result res = new Result();
            res.vkAccount = VKAuthUtils.parse(o2);
            res.time = o2.getInt("time");
            res.hasNewItemsResponse = new StoreHasNewItems.Response(o2.optJSONObject("has_new_items"));
            res.bdate = jp.optString("bdate");
            if (info.optInt("google_now", 1) != 0) {
                z = false;
            }
            res.needUpdateGoogleNow = z;
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
