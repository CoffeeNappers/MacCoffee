package com.my.target.core.utils;

import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.my.target.Tracer;
import com.my.target.nativeads.models.VideoData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
/* compiled from: VideoUtils.java */
/* loaded from: classes2.dex */
public final class n {
    public static VideoData a(List<VideoData> list, int i) {
        VideoData videoData;
        int i2;
        VideoData videoData2 = null;
        int i3 = 0;
        for (VideoData videoData3 : list) {
            int height = videoData3.getHeight();
            if (videoData2 == null || ((height <= i && i3 > i) || ((height <= i && height > i3) || (height > i && height < i3)))) {
                videoData = videoData3;
                i2 = height;
            } else {
                i2 = i3;
                videoData = videoData2;
            }
            videoData2 = videoData;
            i3 = i2;
        }
        Tracer.d("Accepted videoData quality = " + i3 + TtmlNode.TAG_P);
        return videoData2;
    }

    public static float[] a(com.my.target.core.models.sections.c cVar, float[] fArr, float f) {
        float f2;
        float f3;
        float f4;
        float round;
        HashSet hashSet = new HashSet();
        if (fArr != null && fArr.length > 0) {
            Arrays.sort(fArr);
        }
        ArrayList<com.my.target.core.models.banners.c> g = cVar.g();
        Iterator<com.my.target.core.models.banners.c> it = g.iterator();
        int i = 0;
        while (it.hasNext()) {
            com.my.target.core.models.banners.c next = it.next();
            if (fArr == null) {
                if (next.c() > 0.0f) {
                    f4 = (next.c() / 100.0f) * f;
                } else if (next.b() >= 0.0f && next.b() <= f) {
                    f4 = next.b();
                } else {
                    f4 = f / 2.0f;
                }
                round = Math.round(f4 * 10.0f) / 10.0f;
                next.b(round);
            } else if (i < fArr.length) {
                round = fArr[i];
                if (!next.getType().equals("statistics")) {
                    i++;
                }
                if (round > f) {
                    Tracer.d("Cannot set midroll position " + round + ": out of duration");
                    next.b(-1.0f);
                } else {
                    next.b(round);
                }
            } else {
                next.b(-1.0f);
            }
            hashSet.add(Float.valueOf(round));
            i = i;
        }
        if (fArr == null || fArr.length > g.size()) {
            Iterator<com.my.target.core.models.d> it2 = cVar.j().iterator();
            while (it2.hasNext()) {
                com.my.target.core.models.d next2 = it2.next();
                if (fArr != null) {
                    if (i < fArr.length) {
                        int i2 = i + 1;
                        float f5 = fArr[i];
                        if (f5 > f) {
                            Tracer.d("Cannot set midroll position " + f5 + ": out of duration");
                            next2.a(-1.0f);
                            i = i2;
                        } else {
                            next2.a(f5);
                            f3 = f5;
                            i = i2;
                        }
                    } else {
                        next2.a(-1.0f);
                    }
                } else {
                    if (next2.g() > 0.0f) {
                        f2 = (next2.g() / 100.0f) * f;
                    } else if (next2.f() >= 0.0f && next2.f() <= f) {
                        f2 = next2.f();
                    } else {
                        f2 = f / 2.0f;
                    }
                    float round2 = Math.round(f2 * 10.0f) / 10.0f;
                    next2.a(round2);
                    f3 = round2;
                }
                hashSet.add(Float.valueOf(f3));
            }
        }
        float[] fArr2 = new float[hashSet.size()];
        Iterator it3 = hashSet.iterator();
        int i3 = 0;
        while (it3.hasNext()) {
            fArr2[i3] = ((Float) it3.next()).floatValue();
            i3++;
        }
        Arrays.sort(fArr2);
        return fArr2;
    }

    public static float[] a(com.my.target.core.models.sections.k kVar, float[] fArr, float f) {
        float f2;
        float f3;
        float f4;
        float round;
        HashSet hashSet = new HashSet();
        if (fArr != null && fArr.length > 0) {
            Arrays.sort(fArr);
        }
        ArrayList<com.my.target.core.models.banners.m> g = kVar.g();
        Iterator<com.my.target.core.models.banners.m> it = g.iterator();
        int i = 0;
        while (it.hasNext()) {
            com.my.target.core.models.banners.m next = it.next();
            if (fArr == null) {
                if (next.b() > 0.0f) {
                    f4 = (next.b() / 100.0f) * f;
                } else if (next.a() >= 0.0f && next.a() <= f) {
                    f4 = next.a();
                } else {
                    f4 = f / 2.0f;
                }
                round = Math.round(f4 * 10.0f) / 10.0f;
                next.a(round);
            } else if (i < fArr.length) {
                round = fArr[i];
                if (!next.getType().equals("statistics")) {
                    i++;
                }
                if (round > f) {
                    Tracer.d("Cannot set midroll position " + round + ": out of duration");
                    next.a(-1.0f);
                } else {
                    next.a(round);
                }
            } else {
                next.a(-1.0f);
            }
            hashSet.add(Float.valueOf(round));
            i = i;
        }
        if (fArr == null || fArr.length > g.size()) {
            Iterator<com.my.target.core.models.d> it2 = kVar.j().iterator();
            while (it2.hasNext()) {
                com.my.target.core.models.d next2 = it2.next();
                if (fArr != null) {
                    if (i < fArr.length) {
                        int i2 = i + 1;
                        float f5 = fArr[i];
                        if (f5 > f) {
                            Tracer.d("Cannot set midroll position " + f5 + ": out of duration");
                            next2.a(-1.0f);
                            i = i2;
                        } else {
                            next2.a(f5);
                            f3 = f5;
                            i = i2;
                        }
                    } else {
                        next2.a(-1.0f);
                    }
                } else {
                    if (next2.g() > 0.0f) {
                        f2 = (next2.g() / 100.0f) * f;
                    } else if (next2.f() >= 0.0f && next2.f() <= f) {
                        f2 = next2.f();
                    } else {
                        f2 = f / 2.0f;
                    }
                    float round2 = Math.round(f2 * 10.0f) / 10.0f;
                    next2.a(round2);
                    f3 = round2;
                }
                hashSet.add(Float.valueOf(f3));
            }
        }
        float[] fArr2 = new float[hashSet.size()];
        Iterator it3 = hashSet.iterator();
        int i3 = 0;
        while (it3.hasNext()) {
            fArr2[i3] = ((Float) it3.next()).floatValue();
            i3++;
        }
        Arrays.sort(fArr2);
        return fArr2;
    }
}
