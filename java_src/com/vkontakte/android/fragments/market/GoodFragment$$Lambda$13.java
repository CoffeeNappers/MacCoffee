package com.vkontakte.android.fragments.market;

import android.content.Intent;
import android.net.Uri;
import android.view.View;
import com.vkontakte.android.LinkRedirActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class GoodFragment$$Lambda$13 implements View.OnClickListener {
    private final String arg$1;

    private GoodFragment$$Lambda$13(String str) {
        this.arg$1 = str;
    }

    public static View.OnClickListener lambdaFactory$(String str) {
        return new GoodFragment$$Lambda$13(str);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        view.getContext().startActivity(new Intent(view.getContext(), LinkRedirActivity.class).setData(Uri.parse(this.arg$1)));
    }
}
