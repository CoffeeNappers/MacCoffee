package com.vkontakte.android.upload;

import com.vkontakte.android.upload.UploadUtils;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class UploadUtils$$Lambda$3 implements Runnable {
    private final UploadUtils.CopiesListener arg$1;
    private final Exception arg$2;

    private UploadUtils$$Lambda$3(UploadUtils.CopiesListener copiesListener, Exception exc) {
        this.arg$1 = copiesListener;
        this.arg$2 = exc;
    }

    public static Runnable lambdaFactory$(UploadUtils.CopiesListener copiesListener, Exception exc) {
        return new UploadUtils$$Lambda$3(copiesListener, exc);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onError(this.arg$2);
    }
}
