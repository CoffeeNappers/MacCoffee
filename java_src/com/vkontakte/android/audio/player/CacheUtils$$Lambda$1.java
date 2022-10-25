package com.vkontakte.android.audio.player;

import java.io.File;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
final /* synthetic */ class CacheUtils$$Lambda$1 implements Comparator {
    private static final CacheUtils$$Lambda$1 instance = new CacheUtils$$Lambda$1();

    private CacheUtils$$Lambda$1() {
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return CacheUtils.lambda$clearOldCache$0((File) obj, (File) obj2);
    }
}
