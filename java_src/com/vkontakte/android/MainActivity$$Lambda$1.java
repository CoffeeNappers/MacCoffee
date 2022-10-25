package com.vkontakte.android;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.Html;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MainActivity$$Lambda$1 implements Html.ImageGetter {
    private final Context arg$1;

    private MainActivity$$Lambda$1(Context context) {
        this.arg$1 = context;
    }

    public static Html.ImageGetter lambdaFactory$(Context context) {
        return new MainActivity$$Lambda$1(context);
    }

    @Override // android.text.Html.ImageGetter
    @LambdaForm.Hidden
    public Drawable getDrawable(String str) {
        return MainActivity.lambda$showAbout$0(this.arg$1, str);
    }
}
