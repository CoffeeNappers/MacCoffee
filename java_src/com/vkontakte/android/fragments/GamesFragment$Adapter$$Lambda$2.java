package com.vkontakte.android.fragments;

import android.app.Activity;
import android.view.View;
import com.vkontakte.android.fragments.GamesFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GamesFragment$Adapter$$Lambda$2 implements View.OnClickListener {
    private final String arg$1;
    private final Activity arg$2;

    private GamesFragment$Adapter$$Lambda$2(String str, Activity activity) {
        this.arg$1 = str;
        this.arg$2 = activity;
    }

    public static View.OnClickListener lambdaFactory$(String str, Activity activity) {
        return new GamesFragment$Adapter$$Lambda$2(str, activity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        GamesFragment.Adapter.lambda$fillGamePage$1(this.arg$1, this.arg$2, view);
    }
}
