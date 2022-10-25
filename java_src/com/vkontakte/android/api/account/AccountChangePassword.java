package com.vkontakte.android.api.account;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AccountChangePassword extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public String secret;
        public String token;
    }

    public AccountChangePassword(String sid, String hash, String pass) {
        super("account.changePassword");
        param("restore_sid", sid);
        param("change_password_hash", hash);
        param("password", pass);
    }

    public AccountChangePassword(String oldPass, String pass) {
        super("account.changePassword");
        param("old_password", oldPass);
        param("new_password", pass);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            JSONObject o2 = o.getJSONObject(ServerKeys.RESPONSE);
            Result res = new Result();
            res.token = o2.getString(AuthCheckFragment.KEY_TOKEN);
            res.secret = o2.optString("secret");
            return res;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
