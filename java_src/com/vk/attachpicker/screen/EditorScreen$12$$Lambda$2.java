package com.vk.attachpicker.screen;

import android.graphics.Bitmap;
import android.os.Handler;
import com.vk.attachpicker.screen.EditorScreen;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.atomic.AtomicReference;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$12$$Lambda$2 implements Consumer {
    private final EditorScreen.AnonymousClass12 arg$1;
    private final Handler arg$2;
    private final Runnable arg$3;
    private final AtomicReference arg$4;
    private final boolean arg$5;
    private final String arg$6;

    private EditorScreen$12$$Lambda$2(EditorScreen.AnonymousClass12 anonymousClass12, Handler handler, Runnable runnable, AtomicReference atomicReference, boolean z, String str) {
        this.arg$1 = anonymousClass12;
        this.arg$2 = handler;
        this.arg$3 = runnable;
        this.arg$4 = atomicReference;
        this.arg$5 = z;
        this.arg$6 = str;
    }

    public static Consumer lambdaFactory$(EditorScreen.AnonymousClass12 anonymousClass12, Handler handler, Runnable runnable, AtomicReference atomicReference, boolean z, String str) {
        return new EditorScreen$12$$Lambda$2(anonymousClass12, handler, runnable, atomicReference, z, str);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$loadAndShow$1(this.arg$2, this.arg$3, this.arg$4, this.arg$5, this.arg$6, (Bitmap) obj);
    }
}
