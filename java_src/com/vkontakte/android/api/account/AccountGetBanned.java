package com.vkontakte.android.api.account;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class AccountGetBanned extends ListAPIRequest<UserProfile> {
    public AccountGetBanned(int offset, int count) {
        super("account.getBanned", UserProfile.class);
        param("offset", offset).param(ServerKeys.COUNT, count);
        param(GraphRequest.FIELDS_PARAM, "online,photo_100,photo_200,photo_50");
    }
}
