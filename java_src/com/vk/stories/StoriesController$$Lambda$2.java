package com.vk.stories;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesController$$Lambda$2 implements Consumer {
    private final String arg$1;

    private StoriesController$$Lambda$2(String str) {
        this.arg$1 = str;
    }

    public static Consumer lambdaFactory$(String str) {
        return new StoriesController$$Lambda$2(str);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        StoriesController.lambda$markAsSeen$1(this.arg$1, (Throwable) obj);
    }
}
