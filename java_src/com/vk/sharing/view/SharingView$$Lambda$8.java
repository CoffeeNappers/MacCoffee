package com.vk.sharing.view;

import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SharingView$$Lambda$8 implements Runnable {
    private final EditText arg$1;

    private SharingView$$Lambda$8(EditText editText) {
        this.arg$1 = editText;
    }

    public static Runnable lambdaFactory$(EditText editText) {
        return new SharingView$$Lambda$8(editText);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.requestFocus();
    }
}
