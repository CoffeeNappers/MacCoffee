package com.vkontakte.android.fragments.messages;

import android.graphics.Bitmap;
import android.support.v7.widget.Toolbar;
import com.vkontakte.android.fragments.messages.ChatFragment;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$6 implements Consumer {
    private final Toolbar arg$1;

    private ChatFragment$$Lambda$6(Toolbar toolbar) {
        this.arg$1 = toolbar;
    }

    public static Consumer lambdaFactory$(Toolbar toolbar) {
        return new ChatFragment$$Lambda$6(toolbar);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.setLogo(new ChatFragment.RoundDrawable((Bitmap) obj));
    }
}
