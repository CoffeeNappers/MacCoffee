package ru.mail.libverify.utils;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes3.dex */
public final class j {
    final PackageInfo a;
    private final ResolveInfo b;
    private Integer c;

    private j(@NonNull Context context, @NonNull ResolveInfo resolveInfo) {
        this.b = resolveInfo;
        this.a = context.getPackageManager().getPackageInfo(resolveInfo.activityInfo.packageName, 0);
    }

    public static boolean a(@NonNull Context context, @Nullable String str) {
        int i;
        int i2;
        Object obj;
        if (TextUtils.isEmpty(str)) {
            return true;
        }
        try {
            Intent intent = new Intent();
            intent.setAction(PackageStateReceiver.class.getName());
            List<ResolveInfo> queryBroadcastReceivers = context.getPackageManager().queryBroadcastReceivers(intent, 0);
            if (queryBroadcastReceivers.size() == 0) {
                return true;
            }
            ArrayList arrayList = new ArrayList(queryBroadcastReceivers.size());
            boolean z = false;
            for (ResolveInfo resolveInfo : queryBroadcastReceivers) {
                try {
                    j jVar = new j(context, resolveInfo);
                    arrayList.add(jVar);
                    z = TextUtils.equals(jVar.a.packageName, str) ? true : z;
                } catch (PackageManager.NameNotFoundException e) {
                    d.a("PackageInfo", e, "failed to find info for package %s", obj);
                }
            }
            if (!z) {
                return true;
            }
            Collections.sort(arrayList, new Comparator<j>() { // from class: ru.mail.libverify.utils.j.1
                @Override // java.util.Comparator
                public final /* synthetic */ int compare(j jVar2, j jVar3) {
                    j jVar4 = jVar2;
                    j jVar5 = jVar3;
                    int a = jVar4.a();
                    int a2 = jVar5.a();
                    int i3 = a < a2 ? -1 : a == a2 ? 0 : 1;
                    if (i3 != 0) {
                        return i3;
                    }
                    long j = jVar4.a.lastUpdateTime;
                    long j2 = jVar5.a.lastUpdateTime;
                    if (j < j2) {
                        return -1;
                    }
                    return j == j2 ? 0 : 1;
                }
            });
            int i3 = -1;
            int size = arrayList.size();
            int i4 = 0;
            while (i4 < arrayList.size()) {
                String str2 = ((j) arrayList.get(i4)).a.packageName;
                if (TextUtils.equals(str2, str)) {
                    i = size;
                    i2 = i4;
                } else if (TextUtils.equals(str2, context.getPackageName())) {
                    i = i4;
                    i2 = i3;
                } else {
                    i = size;
                    i2 = i3;
                }
                i4++;
                i3 = i2;
                size = i;
            }
            return size > i3;
        } catch (Throwable th) {
            d.a("PackageInfo", "failed to query packages info", th);
            return true;
        }
    }

    final int a() {
        if (this.c == null) {
            if (this.b.activityInfo == null || TextUtils.isEmpty(this.b.activityInfo.nonLocalizedLabel)) {
                return 0;
            }
            String[] split = this.b.activityInfo.nonLocalizedLabel.toString().split(":");
            if (split.length != 2) {
                return 0;
            }
            this.c = Integer.valueOf(Integer.parseInt(split[1]));
        }
        return this.c.intValue();
    }

    public final String toString() {
        return "PackageInfo{name=" + this.a.packageName + ", lastUpdateTime=" + this.a.lastUpdateTime + ", instanceVersion=" + a() + '}';
    }
}
