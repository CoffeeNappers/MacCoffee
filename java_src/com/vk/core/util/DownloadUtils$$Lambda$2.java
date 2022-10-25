package com.vk.core.util;

import android.content.Context;
import java.io.File;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class DownloadUtils$$Lambda$2 implements Runnable {
    private final Context arg$1;
    private final File arg$2;

    private DownloadUtils$$Lambda$2(Context context, File file) {
        this.arg$1 = context;
        this.arg$2 = file;
    }

    public static Runnable lambdaFactory$(Context context, File file) {
        return new DownloadUtils$$Lambda$2(context, file);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        DownloadUtils.lambda$null$0(this.arg$1, this.arg$2);
    }
}
