package com.vkontakte.android.api.auth;

import android.util.Pair;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AuthSignup extends VKAPIRequest<Pair<String, Boolean>> {
    public AuthSignup(String firstName, String lastName, int gender, String bdate, String phone, String sid, boolean voice, boolean libverify) {
        super("auth.signup");
        param("first_name", firstName);
        param("last_name", lastName);
        param("sex", gender);
        param("birthday", bdate);
        param(SignupPhoneFragment.KEY_PHONE, phone);
        param("client_id", VKAuth.API_ID);
        param("client_secret", VKAuth.API_SECRET);
        if (voice) {
            param("voice", 1);
        }
        if (sid != null) {
            param("sid", sid);
        }
        if (libverify) {
            param("libverify_support", 1);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Pair<String, Boolean> mo1093parse(JSONObject o) {
        try {
            JSONObject response = o.getJSONObject(ServerKeys.RESPONSE);
            return new Pair<>(response.getString("sid"), Boolean.valueOf(response.optInt("libverify_support", 0) != 0));
        } catch (Exception x) {
            L.e(x, new Object[0]);
            return null;
        }
    }
}
