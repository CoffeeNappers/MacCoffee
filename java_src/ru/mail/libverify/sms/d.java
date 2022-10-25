package ru.mail.libverify.sms;

import android.content.Context;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import ru.mail.libverify.sms.c;
/* loaded from: classes3.dex */
public final class d implements c {
    private final Context a;

    public d(@NonNull Context context) {
        this.a = context;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0110  */
    /* JADX WARN: Type inference failed for: r5v0, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v4, types: [android.database.Cursor] */
    @Override // ru.mail.libverify.sms.c
    @android.support.annotation.NonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List<ru.mail.libverify.sms.SmsItem> a(@android.support.annotation.NonNull ru.mail.libverify.sms.c.a r23) {
        /*
            Method dump skipped, instructions count: 303
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.sms.d.a(ru.mail.libverify.sms.c$a):java.util.List");
    }

    @Override // ru.mail.libverify.sms.c
    @NonNull
    public final List<SmsItem> a(@NonNull c.a aVar, @NonNull Collection<SmsItem> collection) {
        try {
            HashSet hashSet = new HashSet();
            ArrayList arrayList = new ArrayList();
            for (SmsItem smsItem : collection) {
                String str = smsItem.from;
                String str2 = smsItem.extracted;
                if (str2 != null && str != null && aVar.b(str)) {
                    String a = aVar.a(str2);
                    if (!TextUtils.isEmpty(a) && !hashSet.contains(a)) {
                        hashSet.add(a);
                        arrayList.add(new SmsItem(smsItem.timestamp, str, a));
                    }
                }
            }
            return arrayList;
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("KnownSmsFinder", "failed to query sms list", th);
            return Collections.EMPTY_LIST;
        }
    }
}
