package com.my.target.core.factories;

import android.content.Context;
import android.view.ViewGroup;
import com.facebook.internal.AnalyticsEvents;
import com.my.target.ads.MyTargetView;
import com.my.target.core.engines.i;
import com.my.target.core.facades.f;
import com.my.target.core.facades.g;
import com.my.target.core.facades.h;
import com.my.target.nativeads.NativeAppwallAd;
/* compiled from: EnginesFactory.java */
/* loaded from: classes2.dex */
public final class c {
    public static com.my.target.core.engines.b a(g gVar, ViewGroup viewGroup, Context context) {
        if (gVar instanceof NativeAppwallAd) {
            return new com.my.target.core.engines.c((NativeAppwallAd) gVar, viewGroup, context);
        }
        if ((gVar instanceof h) && (viewGroup instanceof MyTargetView)) {
            h hVar = (h) gVar;
            if (AnalyticsEvents.PARAMETER_SHARE_DIALOG_SHOW_NATIVE.equals(hVar.j().a())) {
                if (hVar.a().equals("standard_300x250")) {
                    return new com.my.target.core.engines.g((MyTargetView) viewGroup, context);
                }
                return new com.my.target.core.engines.h((MyTargetView) viewGroup, context);
            }
            return new i((MyTargetView) viewGroup, ((h) gVar).a(), context);
        } else if (gVar instanceof com.my.target.core.facades.d) {
            return new com.my.target.core.engines.d((com.my.target.core.facades.d) gVar, viewGroup, context);
        } else {
            if (gVar instanceof com.my.target.core.facades.e) {
                return new com.my.target.core.engines.e((com.my.target.core.facades.e) gVar, viewGroup, context);
            }
            if (gVar instanceof f) {
                return new com.my.target.core.engines.f((f) gVar, viewGroup, context);
            }
            return null;
        }
    }
}
