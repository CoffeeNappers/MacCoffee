package com.my.target.core.parsers.rb;

import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.analytics.ecommerce.Promotion;
import com.my.target.core.models.g;
import com.my.target.core.models.l;
import com.my.target.core.models.sections.h;
import com.my.target.core.models.sections.i;
import com.my.target.core.models.sections.j;
import com.my.target.core.models.sections.k;
import com.my.target.core.parsers.a;
import com.my.target.nativeads.models.ImageData;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONArray;
import org.json.JSONObject;
/* compiled from: RBSettingsParser.java */
/* loaded from: classes2.dex */
public final class e {
    public static void a(i iVar, JSONObject jSONObject, String str, a.C0235a c0235a) {
        JSONObject a;
        c0235a.d = "Parsing section settings";
        c0235a.e = iVar.e();
        c0235a.c = b.class.getName();
        iVar.a(a.a(jSONObject, "advertisingLabel", c0235a, "", false));
        if ("standard".equals(iVar.a())) {
            c0235a.d = "Parsing standard section settings";
            j c = a.c(iVar, iVar.e(), c0235a);
            if (c != null) {
                c.a(a.a(jSONObject, "refreshTime", c0235a, 60, false));
                c.b(a.b(jSONObject, "hasAdditionalAds", c0235a, true));
                c.c(a.b(jSONObject, "loopRotation", c0235a, true));
                c.b(a.a(jSONObject, "animationType", c0235a, 1, false));
                c.a(a.b(jSONObject, "extendedClickArea", c0235a, true));
                JSONObject a2 = a.a(jSONObject, Promotion.ACTION_VIEW, c0235a, false);
                if (a2 == null) {
                    return;
                }
                c0235a.d = "Parsing section view settings";
                com.my.target.core.models.j i = c.i();
                i.a(a.a(a2, ServerKeys.TYPE, c0235a, "html", false));
                i.a(a.a(a2, TtmlNode.ATTR_TTS_BACKGROUND_COLOR, c0235a, -1));
                i.b(a.a(a2, "backgroundTouchColor", c0235a, -3806472));
                i.c(a.a(a2, "titleColor", c0235a, str.equals("standard_300x250") ? -16777216 : -16755546));
                i.d(a.a(a2, "ageRestrictionsBackgroundColor", c0235a, -1));
                i.e(a.a(a2, "ageRestrictionsTextColor", c0235a, -10066330));
                i.f(a.a(a2, "ageRestrictionsBorderColor", c0235a, -5000269));
                i.g(a.a(a2, "descriptionColor", c0235a, (int) ViewCompat.MEASURED_STATE_MASK));
                i.h(a.a(a2, "domainColor", c0235a, -10066330));
                i.i(a.a(a2, "votesColor", c0235a, -7829368));
                i.j(a.a(a2, "disclaimerColor", c0235a, -7829368));
                i.k(a.a(a2, "ctaButtonColor", c0235a, -16732432));
                i.l(a.a(a2, "ctaButtonTouchColor", c0235a, -16746839));
                i.m(a.a(a2, "ctaButtonTextColor", c0235a, -1));
                i.a(a.b(a2, "titleBold", c0235a, true));
                i.b(a.b(a2, "descriptionBold", c0235a, false));
                i.c(a.b(a2, "domainBold", c0235a, false));
                i.d(a.b(a2, "votesBold", c0235a, false));
                i.e(a.b(a2, "disclaimerBold", c0235a, false));
                i.f(a.b(a2, "ctaButtonTextBold", c0235a, false));
            }
        } else if ("instreamads".equals(iVar.a())) {
            c0235a.d = "Parsing video section settings";
            for (k kVar : a.b(iVar, iVar.e(), c0235a).i()) {
                if (jSONObject.has(kVar.e())) {
                    a(kVar.k(), a.a(jSONObject, kVar.e(), c0235a, false), c0235a);
                }
            }
        } else if ("video".equals(iVar.a())) {
            c0235a.d = "Parsing video section settings";
            k d = a.d(iVar, iVar.e(), c0235a);
            if (d != null) {
                a(d.k(), jSONObject, c0235a);
            }
        } else if ("fullscreen".equals(iVar.a())) {
            c0235a.d = "Parsing fullscreen section settings";
            com.my.target.core.models.sections.d e = a.e(iVar, iVar.e(), c0235a);
            if (e != null) {
                String a3 = a.a(jSONObject, "close_icon_hd", c0235a, "", false);
                if (!TextUtils.isEmpty(a3)) {
                    e.a(new ImageData(a3, 0, 0));
                }
                String a4 = a.a(jSONObject, "play_icon_hd", c0235a, "", false);
                if (!TextUtils.isEmpty(a4)) {
                    e.b(new ImageData(a4, 0, 0));
                }
                String a5 = a.a(jSONObject, "store_icon_hd", c0235a, "", false);
                if (!TextUtils.isEmpty(a5)) {
                    e.c(new ImageData(a5, 0, 0));
                }
                e.e(a.b(jSONObject, "extendedClickArea", c0235a, false));
                e.d(a.b(jSONObject, "closeOnClick", c0235a, true));
                e.a(a.a(jSONObject, "allowCloseDelay", c0235a, 0, false));
                e.a(a.a(jSONObject, "style", c0235a, 0, false));
                JSONObject a6 = a.a(jSONObject, "video", c0235a, false);
                if (a6 != null) {
                    e.p().a(a.b(a6, "allowClose", c0235a, true));
                    e.p().a(a.a(a6, "allowCloseDelay", c0235a, 0, false));
                    e.f(a.b(a6, "showPlayerControls", c0235a, true));
                    e.d(a.a(a6, "replayActionText", c0235a, "Replay", false));
                    e.c(a.a(a6, "closeActionText", c0235a, "Close", false));
                    e.b(a.b(a6, "allowBackButton", c0235a, true));
                    e.c(a.b(a6, "allowReplay", c0235a, true));
                    e.a(a.b(a6, "automute", c0235a, false));
                }
            }
        } else if ("appwall".equals(iVar.a())) {
            c0235a.d = "Parsing appwall section settings";
            com.my.target.core.models.sections.b g = a.g(iVar, iVar.e(), c0235a);
            if (g != null) {
                g.c(a.a(jSONObject, "title", c0235a, "", false));
                g.d(a.a(jSONObject, SettingsJsonConstants.APP_ICON_KEY, c0235a, "", false));
                g.e(a.a(jSONObject, "icon_hd", c0235a, "", false));
                g.f(a.a(jSONObject, "bubble_icon", c0235a, "", false));
                g.g(a.a(jSONObject, "bubble_icon_hd", c0235a, "", false));
                g.h(a.a(jSONObject, "label_icon", c0235a, "", false));
                g.i(a.a(jSONObject, "label_icon_hd", c0235a, "", false));
                g.j(a.a(jSONObject, "goto_app_icon", c0235a, "", false));
                g.k(a.a(jSONObject, "goto_app_icon_hd", c0235a, "", false));
                g.l(a.a(jSONObject, "item_highlight_icon", c0235a, "", false));
                JSONArray a7 = a.a(jSONObject, "icon_status", c0235a);
                c0235a.d = "Parsing icon statuses";
                int length = a7.length();
                for (int i2 = 0; i2 < length; i2++) {
                    JSONObject a8 = a.a(i2, a7, "icon_status", c0235a);
                    g gVar = new g(a.a(a8, "value", c0235a, "", false));
                    gVar.a(a.a(a8, SettingsJsonConstants.APP_ICON_KEY, c0235a, "", false));
                    gVar.b(a.a(a8, "icon_hd", c0235a, "", false));
                    g.a(gVar);
                }
            }
        } else if ("nativeads".equals(iVar.a())) {
            c0235a.d = "Parsing native section settings";
            h a9 = a.a(iVar, iVar.e(), c0235a);
            if (a9 != null && (a = a.a(jSONObject, "video", c0235a, false)) != null) {
                a9.b(a.b(a, "showPlayerControls", c0235a, true));
                a9.d(a.a(a, "replayActionText", c0235a, "Replay", false));
                a9.c(a.a(a, "closeActionText", c0235a, "Close", false));
                a9.a(a.b(a, "automute", c0235a, false));
            }
        } else if ("fullscreenslider".equals(iVar.a())) {
            c0235a.d = "Parsing fullscreen slider section settings";
            com.my.target.core.models.sections.e f = a.f(iVar, iVar.e(), c0235a);
            if (f != null) {
                f.a(a.c(jSONObject, "close_icon_hd", c0235a));
                f.b((-16777216) | a.a(jSONObject, TtmlNode.ATTR_TTS_BACKGROUND_COLOR, c0235a, -16368537));
                f.c(a.a(jSONObject, "markerColor", c0235a, -1));
                f.a(a.a(jSONObject, "activeMarkerColor", c0235a, -14696781));
            }
        }
    }

    private static void a(l lVar, JSONObject jSONObject, a.C0235a c0235a) {
        c0235a.d = "Parsing video params";
        lVar.a(a.b(jSONObject, "allowClose", c0235a, lVar.a()));
        lVar.a((float) a.a(jSONObject, "allowCloseDelay", c0235a, lVar.b(), false));
        lVar.a(a.a(jSONObject, "connectionTimeout", c0235a, 10, false));
        lVar.b(a.a(jSONObject, "maxBannersShow", c0235a, lVar.d(), false));
    }
}
