package com.vkontakte.android.api.account;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AccountRegisterGoogleNow extends ResultlessAPIRequest {
    public AccountRegisterGoogleNow(String authCode) {
        super("account.registerGoogleNow");
        param("auth_code", authCode);
    }
}
