package com.vkontakte.android.cache;

import com.vkontakte.android.cache.Cache;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
final /* synthetic */ class Cache$$Lambda$1 implements Comparator {
    private final int arg$1;
    private final int arg$2;

    private Cache$$Lambda$1(int i, int i2) {
        this.arg$1 = i;
        this.arg$2 = i2;
    }

    public static Comparator lambdaFactory$(int i, int i2) {
        return new Cache$$Lambda$1(i, i2);
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return Cache.lambda$getUpcomingBirthdays$0(this.arg$1, this.arg$2, (Cache.BirthdayEntry) obj, (Cache.BirthdayEntry) obj2);
    }
}
