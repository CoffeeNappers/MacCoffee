package com.vkontakte.android.upload;

import android.content.Context;
import com.vkontakte.android.upload.UploadUtils;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class UploadUtils$$Lambda$1 implements Runnable {
    private final ArrayList arg$1;
    private final Context arg$2;
    private final UploadUtils.CopiesListener arg$3;

    private UploadUtils$$Lambda$1(ArrayList arrayList, Context context, UploadUtils.CopiesListener copiesListener) {
        this.arg$1 = arrayList;
        this.arg$2 = context;
        this.arg$3 = copiesListener;
    }

    public static Runnable lambdaFactory$(ArrayList arrayList, Context context, UploadUtils.CopiesListener copiesListener) {
        return new UploadUtils$$Lambda$1(arrayList, context, copiesListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        UploadUtils.lambda$doCopyFromRestrictedProviderAsync$2(this.arg$1, this.arg$2, this.arg$3);
    }
}
