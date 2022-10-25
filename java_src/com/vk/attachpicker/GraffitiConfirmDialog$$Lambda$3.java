package com.vk.attachpicker;

import android.app.Activity;
import android.view.View;
import com.vkontakte.android.api.Document;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class GraffitiConfirmDialog$$Lambda$3 implements View.OnClickListener {
    private final Document arg$1;
    private final Activity arg$2;

    private GraffitiConfirmDialog$$Lambda$3(Document document, Activity activity) {
        this.arg$1 = document;
        this.arg$2 = activity;
    }

    public static View.OnClickListener lambdaFactory$(Document document, Activity activity) {
        return new GraffitiConfirmDialog$$Lambda$3(document, activity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        GraffitiConfirmDialog.lambda$new$2(this.arg$1, this.arg$2, view);
    }
}
