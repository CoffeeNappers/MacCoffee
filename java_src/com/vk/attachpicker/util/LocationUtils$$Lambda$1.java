package com.vk.attachpicker.util;

import java.lang.invoke.LambdaForm;
import java.util.concurrent.Callable;
/* loaded from: classes.dex */
final /* synthetic */ class LocationUtils$$Lambda$1 implements Callable {
    private static final LocationUtils$$Lambda$1 instance = new LocationUtils$$Lambda$1();

    private LocationUtils$$Lambda$1() {
    }

    @Override // java.util.concurrent.Callable
    @LambdaForm.Hidden
    public Object call() {
        return LocationUtils.lambda$getLastKnownLocationRx$0();
    }
}
