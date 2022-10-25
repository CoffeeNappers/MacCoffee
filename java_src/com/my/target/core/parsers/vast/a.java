package com.my.target.core.parsers.vast;

import android.text.TextUtils;
import android.util.Pair;
import com.coremedia.iso.boxes.FreeSpaceBox;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.my.target.Tracer;
import com.my.target.core.models.banners.m;
import com.my.target.core.models.d;
import com.my.target.core.models.e;
import com.my.target.core.models.i;
import com.my.target.core.models.k;
import com.my.target.core.models.sections.f;
import com.my.target.core.models.sections.g;
import com.my.target.core.parsers.a;
import com.my.target.core.parsers.vast.b;
import com.my.target.nativeads.models.VideoData;
import com.vkontakte.android.statistics.Statistic;
import java.util.ArrayList;
import java.util.Iterator;
/* compiled from: VASTConverter.java */
/* loaded from: classes2.dex */
public final class a {
    public static String a(String str) {
        return str.replaceAll("&amp;", "&").replaceAll("&lt;", "<").replaceAll("&gt;", ">").trim();
    }

    public static k a(String str, String str2, float f) {
        if (TtmlNode.START.equalsIgnoreCase(str)) {
            return new k("playbackStarted", str2);
        }
        if ("firstQuartile".equalsIgnoreCase(str)) {
            i iVar = new i("playheadReachedValue", str2);
            if (f <= 0.0f) {
                iVar.b(25.0f);
                return iVar;
            }
            iVar.a(0.25f * f);
            return iVar;
        } else if ("midpoint".equalsIgnoreCase(str)) {
            i iVar2 = new i("playheadReachedValue", str2);
            if (f <= 0.0f) {
                iVar2.b(50.0f);
                return iVar2;
            }
            iVar2.a(0.5f * f);
            return iVar2;
        } else if ("thirdQuartile".equalsIgnoreCase(str)) {
            i iVar3 = new i("playheadReachedValue", str2);
            if (f <= 0.0f) {
                iVar3.b(75.0f);
                return iVar3;
            }
            iVar3.a(0.75f * f);
            return iVar3;
        } else if ("complete".equalsIgnoreCase(str)) {
            i iVar4 = new i("playheadReachedValue", str2);
            if (f <= 0.0f) {
                iVar4.b(100.0f);
                return iVar4;
            }
            iVar4.a(f);
            return iVar4;
        } else if ("creativeView".equalsIgnoreCase(str)) {
            return new k("playbackStarted", str2);
        } else {
            if ("mute".equalsIgnoreCase(str)) {
                return new k("volumeOff", str2);
            }
            if ("unmute".equalsIgnoreCase(str)) {
                return new k("volumeOn", str2);
            }
            if ("pause".equalsIgnoreCase(str)) {
                return new k("playbackPaused", str2);
            }
            if ("resume".equalsIgnoreCase(str)) {
                return new k("playbackResumed", str2);
            }
            if ("fullscreen".equalsIgnoreCase(str)) {
                return new k("fullscreenOn", str2);
            }
            if ("exitFullscreen".equalsIgnoreCase(str)) {
                return new k("fullscreenOff", str2);
            }
            if (FreeSpaceBox.TYPE.equalsIgnoreCase(str)) {
                return new k("closedByUser", str2);
            }
            if ("error".equalsIgnoreCase(str)) {
                return new k("error", str2);
            }
            if ("ClickTracking".equalsIgnoreCase(str)) {
                return new k("click", str2);
            }
            return null;
        }
    }

    public static com.my.target.core.models.sections.i a(com.my.target.core.models.c cVar, c cVar2, com.my.target.core.a aVar, d dVar, String str, a.C0235a c0235a) {
        com.my.target.core.models.sections.i a;
        com.my.target.core.models.sections.k c;
        com.my.target.core.models.sections.i iVar;
        com.my.target.core.models.sections.i a2;
        com.my.target.core.models.sections.c c2;
        com.my.target.core.models.sections.i iVar2;
        b.a aVar2;
        e eVar;
        b.a aVar3;
        if (aVar.c().equals("instreamaudioads")) {
            if (cVar.c("instreamaudioads") != null) {
                a2 = cVar.c("instreamaudioads");
                if (a2 instanceof g) {
                    c2 = ((g) a2).c(str);
                    iVar2 = a2;
                }
                c2 = null;
                iVar2 = a2;
            } else {
                a2 = com.my.target.core.factories.e.a("instreamaudioads", 0);
                if (a2 != null) {
                    cVar.a(a2);
                    c2 = ((g) a2).c(str);
                    iVar2 = a2;
                }
                c2 = null;
                iVar2 = a2;
            }
            if (c2 != null) {
                ArrayList<b> arrayList = cVar2.b;
                ArrayList<com.my.target.core.models.banners.e> arrayList2 = cVar2.c;
                String str2 = cVar2.d;
                Iterator<b> it = arrayList.iterator();
                while (it.hasNext()) {
                    b next = it.next();
                    ArrayList<b.a> arrayList3 = next.d;
                    if (arrayList3 != null && !arrayList3.isEmpty()) {
                        aVar2 = arrayList3.get(0);
                        if (arrayList3.size() > 1 && !aVar2.b.contains("mp3")) {
                            Iterator<b.a> it2 = arrayList3.iterator();
                            while (true) {
                                aVar3 = aVar2;
                                if (!it2.hasNext()) {
                                    break;
                                }
                                aVar2 = it2.next();
                                if (!aVar2.b.contains("mp3")) {
                                    aVar2 = aVar3;
                                }
                            }
                            aVar2 = aVar3;
                        }
                    } else {
                        aVar2 = null;
                    }
                    if (!TextUtils.isEmpty(next.a)) {
                        float a3 = a(next.c, c0235a);
                        if (a3 > 0.0f) {
                            if (aVar2 == null) {
                                eVar = null;
                            } else {
                                e eVar2 = new e(aVar2.a);
                                eVar2.a(aVar2.e);
                                eVar = eVar2;
                            }
                            if (eVar != null) {
                                com.my.target.core.models.banners.c b = com.my.target.core.factories.a.b(next.a);
                                b.a(eVar);
                                b.a(a3);
                                b.setCtaText(str2);
                                if (!TextUtils.isEmpty(next.g)) {
                                    b.setTrackingLink(a(next.g));
                                }
                                Iterator<Pair<String, String>> it3 = next.f.iterator();
                                while (it3.hasNext()) {
                                    Pair<String, String> next2 = it3.next();
                                    k a4 = a((String) next2.first, (String) next2.second, a3);
                                    if (a4 != null) {
                                        b.addStat(a4);
                                    }
                                }
                                Iterator<Pair<String, String>> it4 = next.e.iterator();
                                while (it4.hasNext()) {
                                    Pair<String, String> next3 = it4.next();
                                    i a5 = a((String) next3.first, (String) next3.second, c0235a);
                                    if (a5 != null) {
                                        b.addStat(a5);
                                    }
                                }
                                b.addStats(a(dVar.a(), a3));
                                if (dVar.b() != null) {
                                    b.b(dVar.b());
                                }
                                if (arrayList2 != null) {
                                    b.b(arrayList2);
                                }
                                c2.a(b);
                            }
                        }
                    }
                }
                c2.a(dVar.j());
                Iterator<String> it5 = cVar2.a.iterator();
                while (it5.hasNext()) {
                    c2.a(new k(Statistic.TYPE_IMPRESSION, it5.next()));
                }
            }
            return iVar2;
        }
        if (cVar.c("instreamads") != null) {
            a = cVar.c("instreamads");
            if (a instanceof f) {
                c = ((f) a).c(str);
                iVar = a;
            }
            c = null;
            iVar = a;
        } else {
            a = com.my.target.core.factories.e.a("instreamads", 0);
            if (a != null) {
                cVar.a(a);
                c = ((f) a).c(str);
                iVar = a;
            }
            c = null;
            iVar = a;
        }
        if (c != null) {
            ArrayList<b> arrayList4 = cVar2.b;
            String str3 = cVar2.d;
            Iterator<b> it6 = arrayList4.iterator();
            while (it6.hasNext()) {
                b next4 = it6.next();
                if (!TextUtils.isEmpty(next4.a)) {
                    m a6 = com.my.target.core.factories.a.a(next4.a);
                    float a7 = a(next4.c, c0235a);
                    if (a7 > 0.0f) {
                        a6.c(a7);
                        a6.setCtaText(str3);
                        if (!TextUtils.isEmpty(next4.g)) {
                            a6.setTrackingLink(a(next4.g));
                        }
                        if (!TextUtils.isEmpty(next4.b)) {
                            a6.d(true);
                            float f = -1.0f;
                            if (next4.b.contains("%")) {
                                int parseInt = Integer.parseInt(next4.b.substring(0, next4.b.length() - 1));
                                Tracer.d("Linear skipoffset is " + next4.b + " [%]");
                                f = (float) ((a7 / 100.0d) * parseInt);
                            } else if (next4.b != null && next4.b.contains(":")) {
                                f = a(next4.b, c0235a);
                            }
                            if (f > 0.0f) {
                                a6.d(f);
                            }
                        }
                        Iterator<Pair<String, String>> it7 = next4.f.iterator();
                        while (it7.hasNext()) {
                            Pair<String, String> next5 = it7.next();
                            k a8 = a((String) next5.first, (String) next5.second, a7);
                            if (a8 != null) {
                                a6.addStat(a8);
                            }
                        }
                        Iterator<Pair<String, String>> it8 = next4.e.iterator();
                        while (it8.hasNext()) {
                            Pair<String, String> next6 = it8.next();
                            i a9 = a((String) next6.first, (String) next6.second, c0235a);
                            if (a9 != null) {
                                a6.addStat(a9);
                            }
                        }
                        a6.addStats(a(dVar.a(), a7));
                        ArrayList arrayList5 = new ArrayList();
                        Iterator<b.a> it9 = next4.d.iterator();
                        while (it9.hasNext()) {
                            b.a next7 = it9.next();
                            VideoData videoData = new VideoData(next7.a);
                            videoData.setWidth(next7.c);
                            videoData.setHeight(next7.d);
                            videoData.setBitrate(next7.e);
                            arrayList5.add(videoData);
                        }
                        if (!arrayList5.isEmpty()) {
                            a6.a(arrayList5);
                            c.a(a6);
                        }
                    }
                }
            }
            c.a(dVar.j());
            Iterator<String> it10 = cVar2.a.iterator();
            while (it10.hasNext()) {
                c.a(new k(Statistic.TYPE_IMPRESSION, it10.next()));
            }
        }
        return iVar;
    }

    private static ArrayList<k> a(ArrayList<k> arrayList, float f) {
        Iterator<k> it = arrayList.iterator();
        while (it.hasNext()) {
            k next = it.next();
            if ("playheadReachedValue".equals(next.c())) {
                float b = ((i) next).b();
                if (b > 0.0f) {
                    ((i) next).a((float) ((f / 100.0d) * b));
                }
            }
        }
        return arrayList;
    }

    private static float a(String str, a.C0235a c0235a) throws NumberFormatException {
        long j = 0;
        try {
            int length = str.length();
            if (str.contains(".")) {
                length = str.indexOf(".");
                j = Long.parseLong(str.substring(str.indexOf(".") + 1));
            }
            return ((float) Long.valueOf(((j + (Long.parseLong(str.substring(str.lastIndexOf(":") + 1, length)) * 1000)) + ((Long.parseLong(str.substring(str.indexOf(":") + 1, str.lastIndexOf(":"))) * 60) * 1000)) + (((Long.parseLong(str.substring(0, str.indexOf(":"))) * 60) * 60) * 1000)).longValue()) / 1000.0f;
        } catch (Exception e) {
            Tracer.d("Failed to convert ISO time string " + str);
            com.my.target.core.parsers.a.b("Failed to convert ISO time string: " + str, c0235a, "Time format convert exception");
            return -1.0f;
        }
    }

    private static i a(String str, String str2, a.C0235a c0235a) {
        i iVar = new i("playheadReachedValue", str2);
        float a = a(str, c0235a);
        if (a >= 0.0f) {
            iVar.a(a);
            return iVar;
        }
        return null;
    }
}
