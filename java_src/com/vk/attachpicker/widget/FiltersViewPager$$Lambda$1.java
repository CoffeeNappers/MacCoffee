package com.vk.attachpicker.widget;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FiltersViewPager$$Lambda$1 implements Runnable {
    private final FiltersViewPager arg$1;

    private FiltersViewPager$$Lambda$1(FiltersViewPager filtersViewPager) {
        this.arg$1 = filtersViewPager;
    }

    public static Runnable lambdaFactory$(FiltersViewPager filtersViewPager) {
        return new FiltersViewPager$$Lambda$1(filtersViewPager);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$showFakeSwipe$0();
    }
}
