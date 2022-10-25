package com.vkontakte.android.api.account;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AccountSetPrivacy extends ResultlessAPIRequest {
    public AccountSetPrivacy(String key, String value) {
        super("account.setPrivacy");
        param("key", key);
        param("value", value);
    }
}
