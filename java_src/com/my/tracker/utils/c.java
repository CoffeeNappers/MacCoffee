package com.my.tracker.utils;

import com.my.tracker.providers.b;
import java.util.List;
/* compiled from: ListUtils.java */
/* loaded from: classes2.dex */
public final class c {
    public static String a(List<b.a> list) {
        StringBuilder sb = new StringBuilder();
        boolean z = false;
        for (b.a aVar : list) {
            if (z) {
                sb.append(",");
            } else {
                z = true;
            }
            sb.append(aVar.a);
        }
        return sb.toString();
    }
}
