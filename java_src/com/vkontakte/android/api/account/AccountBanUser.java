package com.vkontakte.android.api.account;

import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes2.dex */
public class AccountBanUser extends ResultlessAPIRequest {
    public AccountBanUser(int uid, boolean ban) {
        super(ban ? "account.banUser" : "account.unbanUser");
        param("user_id", uid);
        param(ArgKeys.UID, uid);
    }
}
