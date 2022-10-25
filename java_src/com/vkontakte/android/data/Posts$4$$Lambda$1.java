package com.vkontakte.android.data;

import android.app.Activity;
import com.vkontakte.android.data.Posts;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Posts$4$$Lambda$1 implements Runnable {
    private final Activity arg$1;

    private Posts$4$$Lambda$1(Activity activity) {
        this.arg$1 = activity;
    }

    public static Runnable lambdaFactory$(Activity activity) {
        return new Posts$4$$Lambda$1(activity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Posts.AnonymousClass4.lambda$fail$0(this.arg$1);
    }
}
