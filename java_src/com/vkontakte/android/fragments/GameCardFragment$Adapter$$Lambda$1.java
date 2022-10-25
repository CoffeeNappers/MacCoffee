package com.vkontakte.android.fragments;

import android.app.Activity;
import android.view.View;
import com.vkontakte.android.fragments.GameCardFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GameCardFragment$Adapter$$Lambda$1 implements View.OnClickListener {
    private final GameCardFragment.Adapter arg$1;
    private final String arg$2;
    private final Activity arg$3;

    private GameCardFragment$Adapter$$Lambda$1(GameCardFragment.Adapter adapter, String str, Activity activity) {
        this.arg$1 = adapter;
        this.arg$2 = str;
        this.arg$3 = activity;
    }

    public static View.OnClickListener lambdaFactory$(GameCardFragment.Adapter adapter, String str, Activity activity) {
        return new GameCardFragment$Adapter$$Lambda$1(adapter, str, activity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$fillGamePage$0(this.arg$2, this.arg$3, view);
    }
}
