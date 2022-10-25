package com.google.android.gms.common.internal;

import android.content.Context;
import android.content.res.Resources;
import com.google.android.gms.R;
/* loaded from: classes2.dex */
public class zzah {
    private final Resources EP;
    private final String EQ;

    public zzah(Context context) {
        zzaa.zzy(context);
        this.EP = context.getResources();
        this.EQ = this.EP.getResourcePackageName(R.string.common_google_play_services_unknown_issue);
    }

    public String getString(String str) {
        int identifier = this.EP.getIdentifier(str, "string", this.EQ);
        if (identifier == 0) {
            return null;
        }
        return this.EP.getString(identifier);
    }
}
