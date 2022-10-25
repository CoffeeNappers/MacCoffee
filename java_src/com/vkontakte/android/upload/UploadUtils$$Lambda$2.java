package com.vkontakte.android.upload;

import com.vkontakte.android.upload.UploadUtils;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class UploadUtils$$Lambda$2 implements Runnable {
    private final UploadUtils.CopiesListener arg$1;
    private final ArrayList arg$2;

    private UploadUtils$$Lambda$2(UploadUtils.CopiesListener copiesListener, ArrayList arrayList) {
        this.arg$1 = copiesListener;
        this.arg$2 = arrayList;
    }

    public static Runnable lambdaFactory$(UploadUtils.CopiesListener copiesListener, ArrayList arrayList) {
        return new UploadUtils$$Lambda$2(copiesListener, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onComplete(this.arg$2);
    }
}
