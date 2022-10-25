package com.vkontakte.android.fragments.location;

import android.app.Activity;
import android.app.ProgressDialog;
import com.vkontakte.android.attachments.GeoAttachment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SelectGeoPointFragment$$Lambda$3 implements Runnable {
    private final ProgressDialog arg$1;
    private final GeoAttachment arg$2;
    private final String arg$3;
    private final Activity arg$4;

    private SelectGeoPointFragment$$Lambda$3(ProgressDialog progressDialog, GeoAttachment geoAttachment, String str, Activity activity) {
        this.arg$1 = progressDialog;
        this.arg$2 = geoAttachment;
        this.arg$3 = str;
        this.arg$4 = activity;
    }

    public static Runnable lambdaFactory$(ProgressDialog progressDialog, GeoAttachment geoAttachment, String str, Activity activity) {
        return new SelectGeoPointFragment$$Lambda$3(progressDialog, geoAttachment, str, activity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        SelectGeoPointFragment.lambda$null$4(this.arg$1, this.arg$2, this.arg$3, this.arg$4);
    }
}
