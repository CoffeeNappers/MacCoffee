package com.vkontakte.android.api.account;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
/* loaded from: classes2.dex */
public class AccountValidateAction extends ResultlessAPIRequest {
    public AccountValidateAction(String hash, boolean confirm) {
        super("account.validateAction");
        param("confirm", confirm ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param(SettingsJsonConstants.ICON_HASH_KEY, hash);
    }
}
