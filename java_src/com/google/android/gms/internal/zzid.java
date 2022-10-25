package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzid extends Handler {
    private final zzic zzceu;

    public zzid(Context context) {
        this(new zzie(context.getApplicationContext() != null ? context.getApplicationContext() : context));
    }

    public zzid(zzic zzicVar) {
        this.zzceu = zzicVar;
    }

    private void zzd(JSONObject jSONObject) {
        try {
            this.zzceu.zza(jSONObject.getString("request_id"), jSONObject.getString("base_url"), jSONObject.getString("html"));
        } catch (Exception e) {
        }
    }

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        try {
            Bundle data = message.getData();
            if (data == null) {
                return;
            }
            JSONObject jSONObject = new JSONObject(data.getString("data"));
            if (!"fetch_html".equals(jSONObject.getString("message_name"))) {
                return;
            }
            zzd(jSONObject);
        } catch (Exception e) {
        }
    }
}
