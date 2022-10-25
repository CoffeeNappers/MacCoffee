package com.vkontakte.android.gifs;

import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.gifs.GifViewer;
import com.vkontakte.android.ui.animation.MovieDrawable;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GifViewer$4$$Lambda$1 implements VoidF1 {
    private final GifViewer.AnonymousClass4 arg$1;

    private GifViewer$4$$Lambda$1(GifViewer.AnonymousClass4 anonymousClass4) {
        this.arg$1 = anonymousClass4;
    }

    public static VoidF1 lambdaFactory$(GifViewer.AnonymousClass4 anonymousClass4) {
        return new GifViewer$4$$Lambda$1(anonymousClass4);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onPostExecute$0((MovieDrawable) obj);
    }
}
