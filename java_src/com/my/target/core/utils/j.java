package com.my.target.core.utils;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.my.target.Tracer;
import com.my.target.ads.MyTargetActivity;
import com.my.target.core.async.commands.b;
import java.util.HashMap;
import java.util.Map;
/* compiled from: NavigationHelper.java */
/* loaded from: classes2.dex */
public final class j implements b.a<String> {
    private final Map<com.my.target.core.async.commands.b<String>, com.my.target.core.models.banners.d> a = new HashMap();
    private Context b;

    @Override // com.my.target.core.async.commands.b.a
    public final /* synthetic */ void onExecute(com.my.target.core.async.commands.b<String> bVar, String str) {
        String str2 = str;
        com.my.target.core.models.banners.d dVar = this.a.get(bVar);
        if (dVar != null && this.b != null) {
            a(dVar, str2);
        }
        if (!this.a.containsKey(bVar)) {
            return;
        }
        this.a.remove(bVar);
    }

    public final void a(com.my.target.core.models.banners.d dVar, Context context) {
        this.b = context;
        if (!this.a.containsValue(dVar)) {
            boolean z = true;
            if ("store".equals(dVar.getNavigationType())) {
                Intent launchIntentForPackage = this.b == null ? null : this.b.getPackageManager().getLaunchIntentForPackage(dVar.getBundleId());
                if (launchIntentForPackage != null) {
                    if (a(dVar.getBundleId(), dVar.getDeepLink())) {
                        com.my.target.core.async.a.a(dVar.getStats(), "deeplinkClick", context);
                        return;
                    } else if (a(launchIntentForPackage, dVar.getBundleId(), dVar.getUrlScheme())) {
                        z = false;
                    }
                }
            }
            if (this.b == null) {
                return;
            }
            String trackingLink = dVar.getTrackingLink();
            if (TextUtils.isEmpty(trackingLink)) {
                return;
            }
            if (z && m.a(trackingLink)) {
                a(dVar, trackingLink);
            } else {
                com.my.target.core.async.commands.b<String> a = com.my.target.core.factories.b.a(trackingLink, this.b);
                if (z) {
                    a.a(this);
                    this.a.put(a, dVar);
                }
                a.b();
            }
            com.my.target.core.async.a.a(dVar.getStats(), "click", this.b);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private boolean a(android.content.Intent r6, java.lang.String r7, java.lang.String r8) {
        /*
            r5 = this;
            r0 = 1
            r2 = 0
            android.content.Context r1 = r5.b
            if (r1 != 0) goto L8
            r0 = r2
        L7:
            return r0
        L8:
            boolean r1 = android.text.TextUtils.isEmpty(r7)
            if (r1 != 0) goto L39
            boolean r1 = android.text.TextUtils.isEmpty(r8)
            if (r1 != 0) goto L39
            android.content.Intent r1 = new android.content.Intent     // Catch: java.lang.Exception -> L38
            java.lang.String r3 = "android.intent.action.VIEW"
            android.net.Uri r4 = android.net.Uri.parse(r8)     // Catch: java.lang.Exception -> L38
            r1.<init>(r3, r4)     // Catch: java.lang.Exception -> L38
            android.content.Context r3 = r5.b     // Catch: java.lang.Exception -> L38
            boolean r3 = r3 instanceof android.app.Activity     // Catch: java.lang.Exception -> L38
            if (r3 != 0) goto L2b
            r3 = 268435456(0x10000000, float:2.524355E-29)
            r1.addFlags(r3)     // Catch: java.lang.Exception -> L38
        L2b:
            r1.setPackage(r7)     // Catch: java.lang.Exception -> L38
            android.content.Context r3 = r5.b     // Catch: java.lang.Exception -> L38
            r3.startActivity(r1)     // Catch: java.lang.Exception -> L38
            r1 = r0
        L34:
            if (r6 != 0) goto L3b
            r0 = r2
            goto L7
        L38:
            r1 = move-exception
        L39:
            r1 = r2
            goto L34
        L3b:
            if (r1 != 0) goto L4f
            android.content.Context r2 = r5.b     // Catch: java.lang.Exception -> L4e
            boolean r2 = r2 instanceof android.app.Activity     // Catch: java.lang.Exception -> L4e
            if (r2 != 0) goto L48
            r2 = 268435456(0x10000000, float:2.524355E-29)
            r6.addFlags(r2)     // Catch: java.lang.Exception -> L4e
        L48:
            android.content.Context r2 = r5.b     // Catch: java.lang.Exception -> L4e
            r2.startActivity(r6)     // Catch: java.lang.Exception -> L4e
            goto L7
        L4e:
            r0 = move-exception
        L4f:
            r0 = r1
            goto L7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.my.target.core.utils.j.a(android.content.Intent, java.lang.String, java.lang.String):boolean");
    }

    private boolean a(String str, String str2) {
        if (this.b != null && !TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str)) {
            try {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(str2));
                if (!(this.b instanceof Activity)) {
                    intent.addFlags(268435456);
                }
                intent.setPackage(str);
                this.b.startActivity(intent);
                return true;
            } catch (Exception e) {
                return false;
            }
        }
        return false;
    }

    private void a(com.my.target.core.models.banners.d dVar, String str) {
        if (this.b != null && !TextUtils.isEmpty(str)) {
            if (m.a(str)) {
                boolean z = false;
                if (m.b(str)) {
                    try {
                        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(str));
                        if (!(this.b instanceof Activity)) {
                            intent.addFlags(268435456);
                        }
                        this.b.startActivity(intent);
                        z = true;
                    } catch (Exception e) {
                    }
                } else {
                    z = a(dVar.getUsePlayStoreAction(), str);
                }
                if (z) {
                    return;
                }
            }
            if (this.b != null) {
                if (dVar.isOpenInBrowser()) {
                    Intent intent2 = new Intent("android.intent.action.VIEW", Uri.parse(str));
                    if (!(this.b instanceof Activity)) {
                        intent2.addFlags(268435456);
                    }
                    this.b.startActivity(intent2);
                } else if (!l.c(18)) {
                    a(str);
                } else if (this.b != null) {
                    try {
                        Intent intent3 = new Intent("android.intent.action.VIEW", Uri.parse(str));
                        Bundle bundle = new Bundle();
                        bundle.putBinder("android.support.customtabs.extra.SESSION", null);
                        if (!(this.b instanceof Activity)) {
                            Tracer.d("Starting chrome tab from outside activity Context, creating new task");
                            intent3.addFlags(268435456);
                        }
                        intent3.setPackage("com.android.chrome");
                        intent3.putExtras(bundle);
                        this.b.startActivity(intent3);
                    } catch (ActivityNotFoundException e2) {
                        a(str);
                    }
                }
            }
        }
    }

    private boolean a(boolean z, String str) {
        Intent intent;
        boolean z2 = false;
        if (this.b == null) {
            return false;
        }
        try {
            if (z) {
                intent = this.b.getPackageManager().getLaunchIntentForPackage("com.android.vending");
                intent.setComponent(new ComponentName("com.android.vending", "com.google.android.finsky.activities.LaunchUrlHandlerActivity"));
                if (!(this.b instanceof Activity)) {
                    intent.addFlags(268435456);
                }
                intent.setData(Uri.parse(str));
            } else {
                intent = new Intent("android.intent.action.VIEW", Uri.parse(str));
                if (!(this.b instanceof Activity)) {
                    intent.addFlags(268435456);
                }
            }
            this.b.startActivity(intent);
            z2 = true;
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return z2;
        }
    }

    private void a(String str) {
        if (this.b != null) {
            Intent intent = new Intent(this.b, MyTargetActivity.class);
            intent.setAction("com.my.target.actions.webview");
            intent.putExtra(MyTargetActivity.WEB_VIEW_URL, str);
            if (!(this.b instanceof Activity)) {
                intent.addFlags(268435456);
            }
            this.b.startActivity(intent);
        }
    }
}
