package com.vkontakte.android.activities;

import com.vkontakte.android.activities.RestoreActivity;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RestoreActivity$4$$Lambda$1 implements Runnable {
    private final RestoreActivity.AnonymousClass4 arg$1;
    private final int arg$2;
    private final VKAPIRequest.VKErrorResponse arg$3;

    private RestoreActivity$4$$Lambda$1(RestoreActivity.AnonymousClass4 anonymousClass4, int i, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass4;
        this.arg$2 = i;
        this.arg$3 = vKErrorResponse;
    }

    public static Runnable lambdaFactory$(RestoreActivity.AnonymousClass4 anonymousClass4, int i, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new RestoreActivity$4$$Lambda$1(anonymousClass4, i, vKErrorResponse);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$fail$0(this.arg$2, this.arg$3);
    }
}
