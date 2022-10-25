package com.google.android.gms.auth.api.credentials.internal;

import android.net.Uri;
import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.google.android.gms.common.internal.zzaa;
/* loaded from: classes2.dex */
public class zzb {
    public static String zzfx(String str) {
        boolean z = false;
        zzaa.zzb(!TextUtils.isEmpty(str), "account type cannot be empty");
        String scheme = Uri.parse(str).getScheme();
        if (UriUtil.HTTP_SCHEME.equalsIgnoreCase(scheme) || UriUtil.HTTPS_SCHEME.equalsIgnoreCase(scheme)) {
            z = true;
        }
        zzaa.zzb(z, "Account type must be an http or https URI");
        return str;
    }
}
