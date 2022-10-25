package com.vkontakte.android.api.auth;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.fragments.SignupPhoneFragment;
/* loaded from: classes2.dex */
public class AuthCheckPhone extends ResultlessAPIRequest {
    public AuthCheckPhone(String phone) {
        super("auth.checkPhone");
        param(SignupPhoneFragment.KEY_PHONE, phone);
        param("client_id", VKAuth.API_ID);
        param("client_secret", VKAuth.API_SECRET);
    }
}
