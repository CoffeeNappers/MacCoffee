package com.vkontakte.android.api.apps;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppGetWithUser extends VKAPIRequest<AppGetWithUserResponse> {

    /* loaded from: classes2.dex */
    public static class AppGetWithUserResponse {
        public ApiApplication apiApplication;
        public UserProfile user;
    }

    public AppGetWithUser(int appId, int userId) {
        super("execute");
        String executeStr = String.format("return {app:API.apps.get({app_id:%1$d}), user:API.users.get({user_ids:%2$d})[0]};", Integer.valueOf(appId), Integer.valueOf(userId));
        param(AuthCheckFragment.KEY_CODE, executeStr);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public AppGetWithUserResponse mo1093parse(JSONObject r) throws Exception {
        AppGetWithUserResponse respObj = new AppGetWithUserResponse();
        respObj.apiApplication = new ApiApplication(r.getJSONObject(ServerKeys.RESPONSE).getJSONObject("app").getJSONArray(ServerKeys.ITEMS).getJSONObject(0));
        respObj.user = new UserProfile(r.getJSONObject(ServerKeys.RESPONSE).getJSONObject(ProfileGiftsFragment.Extra.User));
        return respObj;
    }
}
