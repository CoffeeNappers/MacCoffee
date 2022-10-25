package com.vkontakte.android.api.account;

import android.provider.Settings;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class C2DMUnregisterDevice extends VKAPIRequest<Boolean> {
    public C2DMUnregisterDevice() {
        super("account.unregisterDevice");
        String deviceID = Settings.Secure.getString(VKApplication.context.getContentResolver(), "android_id");
        param("device_id", deviceID);
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
