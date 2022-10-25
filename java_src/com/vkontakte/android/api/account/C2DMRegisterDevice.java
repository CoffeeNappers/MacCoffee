package com.vkontakte.android.api.account;

import android.os.Build;
import android.provider.Settings;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.gcm.GoogleCloudMessaging;
import com.vkontakte.android.NotificationUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class C2DMRegisterDevice extends VKAPIRequest<Boolean> {
    public C2DMRegisterDevice(String token) {
        super("account.registerDevice");
        param(AuthCheckFragment.KEY_TOKEN, token);
        param("system_version", Build.VERSION.RELEASE);
        String vendor = Build.MANUFACTURER;
        boolean allLower = true;
        for (int i = 0; i < vendor.length(); i++) {
            if (Character.isUpperCase(vendor.charAt(i))) {
                allLower = false;
            }
        }
        if (allLower && vendor.length() > 0) {
            vendor = vendor.substring(0, 1).toUpperCase() + vendor.substring(1);
        }
        String deviceID = Settings.Secure.getString(VKApplication.context.getContentResolver(), "android_id");
        param("device_model", vendor + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + Build.MODEL);
        param(ServerKeys.TYPE, 4);
        param(GoogleCloudMessaging.MESSAGE_TYPE_MESSAGE, 1);
        param("settings", NotificationUtils.getNotificationSettings(VKApplication.context));
        param("device_id", deviceID);
        try {
            param("app_version", VKApplication.context.getPackageManager().getPackageInfo(VKApplication.context.getPackageName(), 0).versionCode);
        } catch (Exception e) {
        }
        if (VKApplication.context.getSharedPreferences(null, 0).contains("device_token" + VKAccountManager.getCurrent().getUid())) {
            String deviceToken = VKApplication.context.getSharedPreferences(null, 0).getString("device_token" + VKAccountManager.getCurrent().getUid(), "");
            String sig = token + deviceToken + deviceID + VKAccountManager.getCurrent().getUid();
            param("token_sig", VKAPIRequest.md5(sig));
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) throws Exception {
        boolean z = false;
        if (r.optInt(ServerKeys.RESPONSE, 0) != 0) {
            z = true;
        }
        return Boolean.valueOf(z);
    }
}
