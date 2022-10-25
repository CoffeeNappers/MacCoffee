package com.vk.attachpicker.screen;

import android.app.Activity;
import com.vk.attachpicker.screen.EditorScreen;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$12$$Lambda$1 implements Runnable {
    private final AtomicReference arg$1;
    private final Activity arg$2;

    private EditorScreen$12$$Lambda$1(AtomicReference atomicReference, Activity activity) {
        this.arg$1 = atomicReference;
        this.arg$2 = activity;
    }

    public static Runnable lambdaFactory$(AtomicReference atomicReference, Activity activity) {
        return new EditorScreen$12$$Lambda$1(atomicReference, activity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        EditorScreen.AnonymousClass12.lambda$loadAndShow$0(this.arg$1, this.arg$2);
    }
}
