package com.my.target.core.parsers.rb;

import android.os.Build;
import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.google.android.exoplayer2.util.MimeTypes;
import com.my.target.core.models.banners.g;
import com.my.target.core.models.banners.h;
import com.my.target.core.models.banners.j;
import com.my.target.core.models.banners.m;
import com.my.target.core.models.k;
import com.my.target.core.models.sections.i;
import com.my.target.core.parsers.a;
import com.my.target.core.utils.l;
import com.my.target.nativeads.banners.NavigationType;
import com.my.target.nativeads.models.ImageData;
import com.my.target.nativeads.models.VideoData;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.UserNotification;
import io.sentry.DefaultSentryClientFactory;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* compiled from: RBBannerParser.java */
/* loaded from: classes2.dex */
public class b {
    public static com.my.target.core.models.banners.d a(JSONObject jSONObject, i iVar, ArrayList<String> arrayList, a.C0235a c0235a, String str) {
        c0235a.d = "Parsing banner";
        c0235a.e = "Banner_id = \"" + jSONObject.optString("bannerID") + "\"";
        c0235a.c = b.class.getName();
        String a = a.a(jSONObject, "id", c0235a, "", false);
        if (TextUtils.isEmpty(a)) {
            a = a.a(jSONObject, "bannerID", c0235a, "", true);
        }
        String a2 = a.a(jSONObject, ServerKeys.TYPE, c0235a, "", true);
        if (!TextUtils.isEmpty(a2) && !TextUtils.isEmpty(a) && iVar.b(a) == null) {
            com.my.target.core.models.banners.d a3 = com.my.target.core.factories.a.a(a, a2, iVar.a());
            if (a3 == null) {
                com.my.target.core.parsers.a.a("Mismatch for banner type <" + a2 + ">, banner id <" + a + ">, section type <" + iVar.a() + ">", c0235a, "MismatchBannerType");
                return null;
            }
            String a4 = a.a(jSONObject, "bundle_id", c0235a, "", false);
            if (!TextUtils.isEmpty(a4)) {
                a3.setBundleId(a4);
                if (arrayList.contains(a4)) {
                    a3.setAppInstalled(true);
                }
            }
            e(a3, jSONObject, c0235a, iVar);
            if (!(a3 instanceof j)) {
                if (!(a3 instanceof com.my.target.core.models.banners.b)) {
                    if (a3 instanceof com.my.target.core.models.banners.f) {
                        d(a3, jSONObject, c0235a, iVar);
                        List<ImageData> c = ((com.my.target.core.models.banners.f) a3).c();
                        List<ImageData> b = ((com.my.target.core.models.banners.f) a3).b();
                        if ((c == null || c.isEmpty()) && (b == null || b.isEmpty())) {
                            com.my.target.core.parsers.a.a("No images in FSImageBanner", c0235a, "Required field absence");
                            return null;
                        }
                    } else if (!(a3 instanceof g) || !"fullscreen".equals(iVar.a())) {
                        if (a3 instanceof h) {
                            c(a3, jSONObject, c0235a, iVar);
                        } else if ("instreamads".equals(str)) {
                            if (("video".equals(a3.getType()) || "statistics".equals(a3.getType())) && !b(a3, jSONObject, c0235a, iVar)) {
                                return null;
                            }
                        } else if ("instreamaudioads".equals(str) && ((MimeTypes.BASE_TYPE_AUDIO.equals(a3.getType()) || "statistics".equals(a3.getType())) && !a(a3, jSONObject, c0235a, iVar))) {
                            return null;
                        }
                    } else {
                        c0235a.d = "Parsing fs promo banner";
                        g gVar = (g) a3;
                        gVar.f(a.a(jSONObject, "title", c0235a, "", false));
                        gVar.b(a.a(jSONObject, "description", c0235a, "", false));
                        gVar.c(a.a(jSONObject, "disclaimer", c0235a, "", false));
                        gVar.f(a.a(jSONObject, "votes", c0235a, 0, false));
                        gVar.a(a.a(jSONObject, ServerKeys.CATEGORY, c0235a, "", false));
                        gVar.b(a.b(jSONObject, "rating", c0235a));
                        gVar.d(a.a(jSONObject, "domain", c0235a, "", false));
                        gVar.e(a.a(jSONObject, "subcategory", c0235a, "", false));
                        gVar.d(a.a(jSONObject, "iconLink", "iconHeight", "iconWidth", c0235a));
                        gVar.e(a.a(jSONObject, "imageLink", "imageHeight", "imageWidth", c0235a));
                        gVar.setFinalLink(a.a(jSONObject, "finalLink", c0235a, "", false));
                        gVar.a(a.a(jSONObject, "footerColor", c0235a, -39322));
                        gVar.b(a.a(jSONObject, "ctaButtonColor", c0235a, -16733198));
                        gVar.c(a.a(jSONObject, "ctaButtonTouchColor", c0235a, -16746839));
                        gVar.d(a.a(jSONObject, "ctaButtonTextColor", c0235a, -1));
                        com.my.target.core.models.sections.d dVar = (com.my.target.core.models.sections.d) iVar;
                        gVar.e(a.a(jSONObject, "style", c0235a, dVar.o(), false));
                        gVar.a((float) a.a(jSONObject, "allowCloseDelay", c0235a, dVar.i(), false));
                        ImageData c2 = a.c(jSONObject, "close_icon_hd", c0235a);
                        if (c2 == null) {
                            c2 = dVar.k();
                        }
                        gVar.a(c2);
                        ImageData c3 = a.c(jSONObject, "play_icon_hd", c0235a);
                        if (c3 == null) {
                            c3 = dVar.l();
                        }
                        gVar.b(c3);
                        ImageData c4 = a.c(jSONObject, "store_icon_hd", c0235a);
                        if (c4 == null) {
                            c4 = dVar.n();
                        }
                        gVar.c(c4);
                        gVar.a(dVar.u());
                        gVar.b(dVar.t());
                        JSONObject a5 = a.a(jSONObject, "video", c0235a, false);
                        if (l.c(14) && a5 != null) {
                            com.my.target.core.models.banners.d a6 = com.my.target.core.factories.a.a(a3.getId(), "video", "video");
                            if (a6 instanceof m) {
                                e(a6, a5, c0235a, iVar);
                                if (b(a6, a5, c0235a, iVar)) {
                                    a(a6, a5, c0235a);
                                    gVar.a((m) a6);
                                }
                            }
                        }
                    }
                } else {
                    c0235a.d = "Parsing appwall banner";
                    com.my.target.core.models.banners.b bVar = (com.my.target.core.models.banners.b) a3;
                    bVar.a(a.b(jSONObject, "hasNotification", c0235a, false));
                    bVar.e(a.b(jSONObject, "Banner", c0235a, false));
                    bVar.c(a.a(jSONObject, "bubble_id", c0235a, "", false));
                    bVar.c(a.b(jSONObject, "RequireCategoryHighlight", c0235a, false));
                    bVar.b(a.c(jSONObject, "icon_hd", c0235a));
                    bVar.d(a.b(jSONObject, "ItemHighlight", c0235a, false));
                    bVar.b(a.b(jSONObject, "Main", c0235a, false));
                    bVar.a(a.a(jSONObject, "mrgs_id", c0235a, 0, false));
                    bVar.b(a.a(jSONObject, "votes", c0235a, 0, false));
                    bVar.a(a.b(jSONObject, "rating", c0235a));
                    bVar.f(a.b(jSONObject, "RequireWifi", c0235a, false));
                    bVar.a(a.a(jSONObject, "title", c0235a, "", false));
                    bVar.b(a.a(jSONObject, "description", c0235a, "", false));
                    bVar.d(a.a(jSONObject, "labelType", c0235a, "", false));
                    bVar.e(a.a(jSONObject, "status", c0235a, "", false));
                    bVar.f(a.a(jSONObject, "paidType", c0235a, "", false));
                    bVar.g(a.b(jSONObject, "subitem", c0235a, false));
                    bVar.c(a.a(jSONObject, "coins", c0235a, 0, false));
                    bVar.c(a.c(jSONObject, "coins_icon_hd", c0235a));
                    bVar.d(a.a(jSONObject, "coins_icon_bgcolor", c0235a, -552418));
                    bVar.e(a.a(jSONObject, "coins_icon_textcolor", c0235a, -1));
                    bVar.h(a.c(jSONObject, "cross_notif_icon_hd", c0235a));
                    if ("appwall".equals(iVar.a())) {
                        com.my.target.core.models.sections.b bVar2 = (com.my.target.core.models.sections.b) iVar;
                        bVar.f(new ImageData(bVar2.i()));
                        bVar.e(new ImageData(bVar2.k()));
                        bVar.d(new ImageData(bVar2.j()));
                        com.my.target.core.models.g o = bVar2.o(bVar.getStatus());
                        if (o != null) {
                            bVar.a(new ImageData(o.b()));
                        }
                        if (bVar.isItemHighlight() && bVar2.l() != null) {
                            bVar.g(new ImageData(bVar2.l()));
                        }
                    }
                }
            } else {
                c0235a.d = "Parsing standard banner";
                j jVar = (j) a3;
                jVar.e(a.a(jSONObject, "title", c0235a, "", false));
                jVar.b(a.a(jSONObject, "description", c0235a, "", false));
                jVar.c(a.a(jSONObject, "disclaimer", c0235a, "", false));
                jVar.a(a.a(jSONObject, "votes", c0235a, 0, false));
                jVar.a(a.a(jSONObject, ServerKeys.CATEGORY, c0235a, "", false));
                jVar.d(a.a(jSONObject, "domain", c0235a, "", false));
                jVar.b(a.a(jSONObject, "iconLink", "iconHeight", "iconWidth", c0235a));
                jVar.a(a.b(jSONObject, "rating", c0235a));
                jVar.c(a.a(jSONObject, "imageLink", "imageHeight", "imageWidth", c0235a));
                jVar.a(a.a(jSONObject, "mainImageLink", "mainImageHeight", "mainImageWidth", c0235a));
                if (a3.getTimeout() == 0 && "standard".equals(iVar.a())) {
                    a3.setTimeout(((com.my.target.core.models.sections.j) iVar).k());
                }
                if (UserNotification.LAYOUT_NEWSFEED_BANNER.equals(a3.getType()) && ((j) a3).f() == null) {
                    com.my.target.core.parsers.a.a("Banner with type 'banner' has no image", c0235a, "No image in banner");
                    return null;
                }
            }
            a(a3, jSONObject, c0235a);
            return a3;
        }
        return null;
    }

    private static boolean a(com.my.target.core.models.banners.d dVar, JSONObject jSONObject, a.C0235a c0235a, i iVar) {
        com.my.target.core.models.banners.e eVar;
        c0235a.d = "Parsing audio banner";
        com.my.target.core.models.banners.c cVar = (com.my.target.core.models.banners.c) dVar;
        if (!"statistics".equals(dVar.getType())) {
            float a = (float) a.a(jSONObject, "duration", c0235a, 0.0d, true);
            if (a > 0.0f) {
                cVar.a(a);
            } else {
                return false;
            }
        }
        float a2 = (float) a.a(jSONObject, "point", c0235a, -1.0d, false);
        if (a2 >= 0.0f) {
            cVar.b(a2);
        }
        float a3 = (float) a.a(jSONObject, "pointP", c0235a, -1.0d, false);
        if (a3 >= 0.0f) {
            cVar.c(a3);
        }
        if (a2 < 0.0f && a3 < 0.0f) {
            cVar.c(50.0f);
        }
        cVar.a(a.a(jSONObject, "adText", c0235a, "", false));
        cVar.a(a.b(jSONObject, "allowSeek", c0235a, true));
        cVar.b(a.b(jSONObject, "allowSkip", c0235a, false));
        cVar.c(a.b(jSONObject, "allowTrackChange", c0235a, true));
        JSONArray a4 = a.a(jSONObject, "companionAds", c0235a);
        if (a4 != null) {
            int length = a4.length();
            ArrayList<com.my.target.core.models.banners.e> arrayList = new ArrayList<>();
            for (int i = 0; i < length; i++) {
                JSONObject a5 = a.a(i, a4, "companionAds", c0235a);
                if (a5 != null) {
                    int a6 = a.a(a5, "width", c0235a, -1, true);
                    int a7 = a.a(a5, "height", c0235a, -1, true);
                    String a8 = a.a(a5, "id", c0235a, "", true);
                    if (a6 >= 0 && a7 >= 0 && !TextUtils.isEmpty(a8)) {
                        eVar = com.my.target.core.factories.a.c(a8);
                        e(eVar, a5, c0235a, iVar);
                        eVar.setStaticResource(a.a(a5, "staticResource", c0235a, "", false));
                        eVar.setIframeResource(a.a(a5, "iframeResource", c0235a, "", false));
                        eVar.setHtmlResource(a.a(a5, "htmlResource", c0235a, "", false));
                        eVar.setApiFramework(a.a(a5, "apiFramework", c0235a, "", false));
                        eVar.setAdSlotID(a.a(a5, "adSlotID", c0235a, "", false));
                        eVar.setRequired(a.a(a5, "required", c0235a, "", false));
                        eVar.setAssetWidth(a.a(a5, "assetWidth", c0235a, 0, false));
                        eVar.setAssetHeight(a.a(a5, "assetHeight", c0235a, 0, false));
                        eVar.setExpandedWidth(a.a(a5, "expandedWidth", c0235a, 0, false));
                        eVar.setExpandedHeight(a.a(a5, "expandedHeight", c0235a, 0, false));
                    } else {
                        eVar = null;
                    }
                    if (eVar != null) {
                        arrayList.add(eVar);
                    }
                }
            }
            if (!arrayList.isEmpty()) {
                cVar.a(arrayList);
            }
        }
        if (!"statistics".equals(dVar.getType())) {
            ArrayList<com.my.target.core.models.e> a9 = a(jSONObject, "mediafiles", c0235a);
            if (a9.isEmpty()) {
                return false;
            }
            cVar.a(a9.get(0));
        }
        return true;
    }

    private static ArrayList<com.my.target.core.models.e> a(JSONObject jSONObject, String str, a.C0235a c0235a) {
        c0235a.d = "Parsing banner mediafiles";
        ArrayList<com.my.target.core.models.e> arrayList = new ArrayList<>();
        JSONArray a = a.a(jSONObject, str, c0235a);
        if (a == null) {
            return arrayList;
        }
        int length = a.length();
        if (length == 0) {
            com.my.target.core.parsers.a.a("Empty mediafiles array", c0235a, "Empty mediafiles array");
            return arrayList;
        }
        for (int i = 0; i < length; i++) {
            JSONObject a2 = a.a(i, a, str, c0235a);
            String a3 = a.a(a2, "src", c0235a, (String) null, true);
            if (Build.VERSION.SDK_INT < 12 && a3 != null && a3.startsWith(UriUtil.HTTPS_SCHEME)) {
                a3 = new StringBuilder(a3).deleteCharAt(4).toString();
            }
            int a4 = a.a(a2, "bitrate", c0235a, 0, false);
            if (a3 != null) {
                com.my.target.core.models.e eVar = new com.my.target.core.models.e(a3);
                eVar.a(a4);
                arrayList.add(eVar);
            } else {
                com.my.target.core.parsers.a.a("Mediafile src is null", c0235a, "Wrong mediafile");
            }
        }
        return arrayList;
    }

    private static void a(com.my.target.core.models.banners.d dVar, JSONObject jSONObject, a.C0235a c0235a) {
        ArrayList<k> a = f.a(jSONObject, c0235a);
        if (!a.isEmpty()) {
            dVar.addStats(a);
        }
    }

    private static boolean b(com.my.target.core.models.banners.d dVar, JSONObject jSONObject, a.C0235a c0235a, i iVar) {
        c0235a.d = "Parsing video banner";
        m mVar = (m) dVar;
        com.my.target.core.models.l lVar = null;
        if (iVar instanceof com.my.target.core.models.sections.k) {
            lVar = ((com.my.target.core.models.sections.k) iVar).k();
        } else if (iVar instanceof com.my.target.core.models.sections.d) {
            lVar = ((com.my.target.core.models.sections.d) iVar).p();
            com.my.target.core.models.sections.d dVar2 = (com.my.target.core.models.sections.d) iVar;
            mVar.a(a.a(jSONObject, "closeActionText", c0235a, dVar2.j(), false));
            mVar.b(a.a(jSONObject, "replayActionText", c0235a, dVar2.m(), false));
            mVar.a(a.b(jSONObject, "allowBackButton", c0235a, dVar2.q()));
            mVar.b(a.b(jSONObject, "allowReplay", c0235a, dVar2.r()));
            mVar.c(a.b(jSONObject, "automute", c0235a, dVar2.s()));
            mVar.g(dVar2.v());
        } else if (iVar instanceof com.my.target.core.models.sections.h) {
            com.my.target.core.models.sections.h hVar = (com.my.target.core.models.sections.h) iVar;
            mVar.a(a.a(jSONObject, "closeActionText", c0235a, hVar.k(), false));
            mVar.b(a.a(jSONObject, "replayActionText", c0235a, hVar.l(), false));
            mVar.c(a.b(jSONObject, "automute", c0235a, hVar.i()));
            mVar.g(hVar.j());
        }
        if (lVar != null) {
            mVar.d(a.b(jSONObject, "allowClose", c0235a, lVar.a()));
            mVar.d((float) a.a(jSONObject, "allowCloseDelay", c0235a, lVar.b(), false));
        }
        if (!"statistics".equals(dVar.getType())) {
            float a = (float) a.a(jSONObject, "duration", c0235a, 0.0d, true);
            if (a > 0.0f) {
                mVar.c(a);
            } else {
                return false;
            }
        }
        mVar.e(a.b(jSONObject, "autoplay", c0235a, true));
        mVar.f(a.b(jSONObject, "hasCtaButton", c0235a, true));
        float a2 = (float) a.a(jSONObject, "point", c0235a, -1.0d, false);
        if (a2 >= 0.0f) {
            mVar.a(a2);
        }
        float a3 = (float) a.a(jSONObject, "pointP", c0235a, -1.0d, false);
        if (a3 >= 0.0f) {
            mVar.b(a3);
        }
        if (a2 < 0.0f && a3 < 0.0f) {
            mVar.b(50.0f);
        }
        ImageData a4 = a.a(jSONObject, "previewLink", "previewHeight", "previewWidth", c0235a);
        if (a4 != null) {
            mVar.a(a4);
        }
        if (!"statistics".equals(dVar.getType())) {
            c0235a.d = "Parsing banner mediafiles";
            ArrayList arrayList = new ArrayList();
            JSONArray a5 = a.a(jSONObject, "mediafiles", c0235a);
            if (a5 != null) {
                int length = a5.length();
                if (length == 0) {
                    com.my.target.core.parsers.a.a("Empty mediafiles array", c0235a, "Empty mediafiles array");
                } else {
                    for (int i = 0; i < length; i++) {
                        JSONObject a6 = a.a(i, a5, "mediafiles", c0235a);
                        String a7 = a.a(a6, "src", c0235a, (String) null, true);
                        if (Build.VERSION.SDK_INT < 12 && a7 != null && a7.startsWith(UriUtil.HTTPS_SCHEME)) {
                            a7 = new StringBuilder(a7).deleteCharAt(4).toString();
                        }
                        int a8 = a.a(a6, "width", c0235a, 0, false);
                        int a9 = a.a(a6, "height", c0235a, 0, false);
                        int a10 = a.a(a6, "bitrate", c0235a, 0, false);
                        if (a7 != null && a8 > 0 && a9 > 0 && a10 > 0) {
                            VideoData videoData = new VideoData(a7);
                            videoData.setBitrate(a10);
                            videoData.setWidth(a8);
                            videoData.setHeight(a9);
                            arrayList.add(videoData);
                        } else {
                            com.my.target.core.parsers.a.a("Some of mediafile's params are invalid: src = " + a7 + " width = " + a8 + " height = " + a9 + " bitrate = " + a10, c0235a, "Wrong mediafile");
                        }
                    }
                }
            }
            if (arrayList.isEmpty()) {
                return false;
            }
            mVar.a(arrayList);
        }
        return true;
    }

    private static void c(com.my.target.core.models.banners.d dVar, JSONObject jSONObject, a.C0235a c0235a, i iVar) {
        c0235a.d = "Parsing native banner";
        h hVar = (h) dVar;
        hVar.f(a.a(jSONObject, "title", c0235a, "", false));
        hVar.b(a.a(jSONObject, "description", c0235a, "", false));
        hVar.c(a.a(jSONObject, "disclaimer", c0235a, "", false));
        hVar.f(a.a(jSONObject, "votes", c0235a, 0, false));
        hVar.a(a.a(jSONObject, ServerKeys.CATEGORY, c0235a, "", false));
        hVar.b(a.b(jSONObject, "rating", c0235a));
        hVar.d(a.a(jSONObject, "domain", c0235a, "", false));
        hVar.e(a.a(jSONObject, "subcategory", c0235a, "", false));
        hVar.d(a.a(jSONObject, "iconLink", "iconHeight", "iconWidth", c0235a));
        hVar.e(a.a(jSONObject, "imageLink", "imageHeight", "imageWidth", c0235a));
        hVar.setFinalLink(a.a(jSONObject, "finalLink", c0235a, "", false));
        JSONArray a = a.a(jSONObject, "cards", c0235a);
        if (a != null) {
            int length = a.length();
            for (int i = 0; i < length; i++) {
                JSONObject a2 = a.a(i, a, "cards", c0235a);
                com.my.target.core.models.banners.i iVar2 = new com.my.target.core.models.banners.i(a.a(a2, "cardID", c0235a, "", false), "promo");
                e(iVar2, a2, c0235a, iVar);
                if (TextUtils.isEmpty(iVar2.getTrackingLink())) {
                    com.my.target.core.parsers.a.a("Native ad card parse error: no tracking link", c0235a, "Required field absence");
                    iVar2 = null;
                } else {
                    String a3 = a.a(a2, "ctaText", c0235a, "", false);
                    if (TextUtils.isEmpty(a3)) {
                        iVar2.setCtaText(hVar.getCtaText());
                    } else {
                        iVar2.setCtaText(a3);
                    }
                    ImageData a4 = a.a(a2, "imageLink", "imageHeight", "imageWidth", c0235a);
                    if (a4 != null) {
                        iVar2.a(a4);
                        iVar2.b(a.a(a2, "title", c0235a, "", false));
                        iVar2.a(a.a(a2, "description", c0235a, "", false));
                        a(iVar2, a2, c0235a);
                    } else {
                        com.my.target.core.parsers.a.a("Native ad card parse error: wrong image", c0235a, "No image in banner");
                        iVar2 = null;
                    }
                }
                if (iVar2 != null) {
                    hVar.m().add(iVar2);
                }
            }
        }
        if (hVar.m().isEmpty()) {
            JSONObject a5 = a.a(jSONObject, "video", c0235a, false);
            if (l.c(14) && a5 != null) {
                com.my.target.core.models.banners.d a6 = com.my.target.core.factories.a.a(dVar.getId(), "video", "video");
                if (a6 instanceof m) {
                    e(a6, a5, c0235a, iVar);
                    if (b(a6, a5, c0235a, iVar)) {
                        a(a6, a5, c0235a);
                        hVar.a((m) a6);
                    }
                }
            }
        }
    }

    private static void d(com.my.target.core.models.banners.d dVar, JSONObject jSONObject, a.C0235a c0235a, i iVar) {
        ImageData a;
        ImageData a2;
        c0235a.d = "Parsing fs image banner";
        com.my.target.core.models.banners.f fVar = (com.my.target.core.models.banners.f) dVar;
        fVar.a(a.b(jSONObject, "allowClose", c0235a, false));
        ImageData c = a.c(jSONObject, "close_icon_hd", c0235a);
        if (c == null) {
            c = a.c(jSONObject, "close_icon", c0235a);
        }
        if (c == null && (iVar instanceof com.my.target.core.models.sections.d)) {
            c = ((com.my.target.core.models.sections.d) iVar).k();
        }
        fVar.a(c);
        JSONArray a3 = a.a(jSONObject, "portrait", c0235a);
        if (a3 != null) {
            ArrayList arrayList = new ArrayList();
            int length = a3.length();
            for (int i = 0; i < length; i++) {
                JSONObject a4 = a.a(i, a3, "portrait", c0235a);
                if (a4 != null && (a2 = a.a(a4, "imageLink", "height", "width", c0235a)) != null) {
                    arrayList.add(a2);
                }
            }
            fVar.a(arrayList);
        }
        JSONArray a5 = a.a(jSONObject, "landscape", c0235a);
        if (a5 != null) {
            ArrayList arrayList2 = new ArrayList();
            int length2 = a5.length();
            for (int i2 = 0; i2 < length2; i2++) {
                JSONObject a6 = a.a(i2, a5, "landscape", c0235a);
                if (a6 != null && (a = a.a(a6, "imageLink", "height", "width", c0235a)) != null) {
                    arrayList2.add(a);
                }
            }
            fVar.b(arrayList2);
        }
    }

    private static void e(com.my.target.core.models.banners.d dVar, JSONObject jSONObject, a.C0235a c0235a, i iVar) {
        c0235a.d = "Parsing common banner";
        dVar.setTrackingLink(a.a(jSONObject, "trackingLink", c0235a, "", false));
        dVar.setFinalLink(a.a(jSONObject, "finalLink", c0235a, "", false));
        dVar.setTimeout(a.a(jSONObject, DefaultSentryClientFactory.TIMEOUT_OPTION, c0235a, 0, false));
        dVar.setUrlScheme(a.a(jSONObject, "urlscheme", c0235a, "", false));
        dVar.setWidth(a.a(jSONObject, "width", c0235a, 0, false));
        dVar.setHeight(a.a(jSONObject, "height", c0235a, 0, false));
        dVar.setAgeRestrictions(a.a(jSONObject, "ageRestrictions", c0235a, "", false));
        dVar.setBundleId(a.a(jSONObject, "bundle_id", c0235a, "", false));
        dVar.setDeepLink(a.a(jSONObject, NavigationType.DEEPLINK, c0235a, "", false));
        dVar.setOpenInBrowser(a.b(jSONObject, "openInBrowser", c0235a, false));
        dVar.setUsePlayStoreAction(a.b(jSONObject, "usePlayStoreAction", c0235a, false));
        String a = a.a(jSONObject, "navigationType", c0235a, "web", false);
        if (NavigationType.DEEPLINK.equals(a)) {
            a = "store";
        }
        dVar.setNavigationType(a);
        String a2 = a.a(jSONObject, "ctaText", c0235a, "", false);
        dVar.setCtaText(TextUtils.isEmpty(a2) ? com.my.target.core.models.banners.a.getDefaultCtaText(a) : a2);
        dVar.setAdvertisingLabel(iVar.f());
    }
}
