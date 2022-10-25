package com.vkontakte.android.api.auth;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.fragments.SignupPhoneFragment;
/* loaded from: classes2.dex */
public class AuthValidatePhone extends ResultlessAPIRequest {
    public AuthValidatePhone(String sid, String phone, boolean voice) {
        super("auth.validatePhone");
        param("sid", sid);
        param(SignupPhoneFragment.KEY_PHONE, phone);
        if (voice) {
            param("voice", 1);
        }
    }
}
