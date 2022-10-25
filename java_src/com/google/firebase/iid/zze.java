package com.google.firebase.iid;

import android.support.annotation.Nullable;
import android.text.TextUtils;
/* loaded from: classes2.dex */
public class zze {
    private static final Object zzaox = new Object();
    private final zzg bkO;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zze(zzg zzgVar) {
        this.bkO = zzgVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public String L() {
        String str = null;
        synchronized (zzaox) {
            String string = this.bkO.M().getString("topic_operaion_queue", null);
            if (string != null) {
                String[] split = string.split(",");
                if (split.length > 1 && !TextUtils.isEmpty(split[1])) {
                    str = split[1];
                }
            }
        }
        return str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zztq(String str) {
        synchronized (zzaox) {
            String string = this.bkO.M().getString("topic_operaion_queue", "");
            String valueOf = String.valueOf(",");
            this.bkO.M().edit().putString("topic_operaion_queue", new StringBuilder(String.valueOf(string).length() + 0 + String.valueOf(valueOf).length() + String.valueOf(str).length()).append(string).append(valueOf).append(str).toString()).apply();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zztu(String str) {
        boolean z;
        synchronized (zzaox) {
            String string = this.bkO.M().getString("topic_operaion_queue", "");
            String valueOf = String.valueOf(",");
            String valueOf2 = String.valueOf(str);
            if (string.startsWith(valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf))) {
                String valueOf3 = String.valueOf(",");
                String valueOf4 = String.valueOf(str);
                this.bkO.M().edit().putString("topic_operaion_queue", string.substring((valueOf4.length() != 0 ? valueOf3.concat(valueOf4) : new String(valueOf3)).length())).apply();
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }
}
