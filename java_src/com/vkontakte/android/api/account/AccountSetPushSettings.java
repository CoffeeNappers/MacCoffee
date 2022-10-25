package com.vkontakte.android.api.account;

import android.provider.Settings;
import com.vkontakte.android.NotificationUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ResultlessAPIRequest;
/* loaded from: classes2.dex */
public class AccountSetPushSettings extends ResultlessAPIRequest {
    public AccountSetPushSettings() {
        super("account.setPushSettings");
        String deviceID = Settings.Secure.getString(VKApplication.context.getContentResolver(), "android_id");
        param("settings", NotificationUtils.getNotificationSettings(VKApplication.context));
        param("device_id", deviceID);
    }
}
