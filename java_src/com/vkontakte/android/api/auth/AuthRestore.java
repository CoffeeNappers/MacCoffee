package com.vkontakte.android.api.auth;

import android.util.Pair;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AuthRestore extends VKAPIRequest<Pair<String, Boolean>> {

    /* loaded from: classes2.dex */
    public static class AuthRestoreAnswer {
        public final boolean libverifySupport;
        public final String sid;

        public AuthRestoreAnswer(String sid, boolean libverifySupport) {
            this.sid = sid;
            this.libverifySupport = libverifySupport;
        }
    }

    public AuthRestore(String number, String sid, boolean voice, boolean libverify) {
        super("auth.restore");
        param(SignupPhoneFragment.KEY_PHONE, number);
        param("sid", sid);
        if (voice) {
            param("voice", 1);
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
