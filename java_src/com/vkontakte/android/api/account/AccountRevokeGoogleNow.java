package com.vkontakte.android.api.account;

import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AccountRevokeGoogleNow extends ResultlessAPIRequest {
    public AccountRevokeGoogleNow(String token) {
        super("account.revokeGoogleNow");
        param("old_access_token", token);
    }
}
