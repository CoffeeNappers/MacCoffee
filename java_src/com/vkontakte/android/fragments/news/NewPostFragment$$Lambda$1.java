package com.vkontakte.android.fragments.news;

import android.view.inputmethod.InputMethodManager;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewPostFragment$$Lambda$1 implements Runnable {
    private final NewPostFragment arg$1;
    private final InputMethodManager arg$2;

    private NewPostFragment$$Lambda$1(NewPostFragment newPostFragment, InputMethodManager inputMethodManager) {
        this.arg$1 = newPostFragment;
        this.arg$2 = inputMethodManager;
    }

    public static Runnable lambdaFactory$(NewPostFragment newPostFragment, InputMethodManager inputMethodManager) {
        return new NewPostFragment$$Lambda$1(newPostFragment, inputMethodManager);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$showKeyboard$0(this.arg$2);
    }
}
