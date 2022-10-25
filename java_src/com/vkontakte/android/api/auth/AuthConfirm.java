package com.vkontakte.android.api.auth;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AuthConfirm extends VKAPIRequest<Integer> {
    public AuthConfirm(String phone, String pass, String sid, String session, String token) {
        this(phone, pass);
        param("sid", sid);
        param("validate_session", session);
        param("validate_token", token);
    }

    public AuthConfirm(String phone, String code, String pass) {
        this(phone, pass);
        param(AuthCheckFragment.KEY_CODE, code);
    }

    private AuthConfirm(String phone, String pass) {
        super("auth.confirm");
        param(SignupPhoneFragment.KEY_PHONE, phone);
        if (pass != null) {
            param("password", pass);
        }
        param("client_id", VKAuth.API_ID);
        param("client_secret", VKAuth.API_SECRET);
        param("intro", 3);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getJSONObject(ServerKeys.RESPONSE).optInt("user_id"));
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
