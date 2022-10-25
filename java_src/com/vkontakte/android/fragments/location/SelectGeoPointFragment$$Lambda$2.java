package com.vkontakte.android.fragments.location;

import android.app.Activity;
import android.app.ProgressDialog;
import com.vkontakte.android.attachments.GeoAttachment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SelectGeoPointFragment$$Lambda$2 implements Runnable {
    private final SelectGeoPointFragment arg$1;
    private final GeoAttachment arg$2;
    private final ProgressDialog arg$3;
    private final Activity arg$4;

    private SelectGeoPointFragment$$Lambda$2(SelectGeoPointFragment selectGeoPointFragment, GeoAttachment geoAttachment, ProgressDialog progressDialog, Activity activity) {
        this.arg$1 = selectGeoPointFragment;
        this.arg$2 = geoAttachment;
        this.arg$3 = progressDialog;
        this.arg$4 = activity;
    }

    public static Runnable lambdaFactory$(SelectGeoPointFragment selectGeoPointFragment, GeoAttachment geoAttachment, ProgressDialog progressDialog, Activity activity) {
        return new SelectGeoPointFragment$$Lambda$2(selectGeoPointFragment, geoAttachment, progressDialog, activity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onDone$5(this.arg$2, this.arg$3, this.arg$4);
    }
}
