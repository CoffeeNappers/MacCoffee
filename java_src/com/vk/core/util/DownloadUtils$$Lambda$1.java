package com.vk.core.util;

import android.content.Context;
import com.vkontakte.android.functions.VoidF1;
import java.io.File;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class DownloadUtils$$Lambda$1 implements VoidF1 {
    private final Context arg$1;
    private final File arg$2;

    private DownloadUtils$$Lambda$1(Context context, File file) {
        this.arg$1 = context;
        this.arg$2 = file;
    }

    public static VoidF1 lambdaFactory$(Context context, File file) {
        return new DownloadUtils$$Lambda$1(context, file);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        DownloadUtils.lambda$downloadFile$1(this.arg$1, this.arg$2, (Boolean) obj);
    }
}
