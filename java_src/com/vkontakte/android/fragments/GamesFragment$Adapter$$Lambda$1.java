package com.vkontakte.android.fragments;

import android.app.Activity;
import android.view.View;
import com.vkontakte.android.fragments.GamesFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class GamesFragment$Adapter$$Lambda$1 implements View.OnClickListener {
    private final ArrayList arg$1;
    private final String arg$2;
    private final Activity arg$3;

    private GamesFragment$Adapter$$Lambda$1(ArrayList arrayList, String str, Activity activity) {
        this.arg$1 = arrayList;
        this.arg$2 = str;
        this.arg$3 = activity;
    }

    public static View.OnClickListener lambdaFactory$(ArrayList arrayList, String str, Activity activity) {
        return new GamesFragment$Adapter$$Lambda$1(arrayList, str, activity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        GamesFragment.Adapter.lambda$fillGameRequest$0(this.arg$1, this.arg$2, this.arg$3, view);
    }
}
