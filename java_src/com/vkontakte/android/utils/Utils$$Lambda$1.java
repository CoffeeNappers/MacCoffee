package com.vkontakte.android.utils;

import com.vkontakte.android.functions.VoidF1;
import java.io.File;
import java.io.InputStream;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class Utils$$Lambda$1 implements Runnable {
    private final File arg$1;
    private final InputStream arg$2;
    private final VoidF1 arg$3;

    private Utils$$Lambda$1(File file, InputStream inputStream, VoidF1 voidF1) {
        this.arg$1 = file;
        this.arg$2 = inputStream;
        this.arg$3 = voidF1;
    }

    public static Runnable lambdaFactory$(File file, InputStream inputStream, VoidF1 voidF1) {
        return new Utils$$Lambda$1(file, inputStream, voidF1);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Utils.lambda$copyInputStreamToFile$0(this.arg$1, this.arg$2, this.arg$3);
    }
}
