package com.vkontakte.android;

import com.google.android.now.NowAuthService;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.account.AccountRegisterGoogleNow;
import com.vkontakte.android.api.account.AccountRevokeGoogleNow;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GoogleNow {
    public static void updateTokenAsync() {
        Runnable runnable;
        runnable = GoogleNow$$Lambda$1.instance;
        new Thread(runnable).start();
    }

    public static /* synthetic */ void lambda$updateTokenAsync$0() {
        Log.d("vk", "Updating google now token");
        String token = null;
        try {
            token = NowAuthService.getAuthCode(VKApplication.context, "841415684880-77p77ds9nvkh5mdd4f6polb9t23bobc0.apps.googleusercontent.com");
        } catch (Exception x) {
            Log.w("vk", x);
            if (x instanceof NowAuthService.HaveTokenAlreadyException) {
                String serverToken = ((NowAuthService.HaveTokenAlreadyException) x).getAccessToken();
                try {
                    new AccountRevokeGoogleNow(serverToken).setCallback(new ResultlessCallback() { // from class: com.vkontakte.android.GoogleNow.1
                        @Override // com.vkontakte.android.api.ResultlessCallback
                        public void success() {
                            GoogleNow.updateTokenAsync();
                        }
                    }).persist(GoogleNow.class.getMethod("revokeRetryCallback", JSONObject.class, JSONObject.class), null).exec();
                } catch (NoSuchMethodException e) {
                    Log.e("vk", "WTF?!", x);
                }
            }
        }
        if (token != null) {
            new AccountRegisterGoogleNow(token).persist(null, null).exec();
        }
    }

    public static void revokeRetryCallback(JSONObject res, JSONObject data) {
        updateTokenAsync();
    }
}
