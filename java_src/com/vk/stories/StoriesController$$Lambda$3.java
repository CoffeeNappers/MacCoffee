package com.vk.stories;

import java.lang.invoke.LambdaForm;
import java.util.concurrent.Callable;
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesController$$Lambda$3 implements Callable {
    private static final StoriesController$$Lambda$3 instance = new StoriesController$$Lambda$3();

    private StoriesController$$Lambda$3() {
    }

    public static Callable lambdaFactory$() {
        return instance;
    }

    @Override // java.util.concurrent.Callable
    @LambdaForm.Hidden
    public Object call() {
        return StoriesController.storiesInstance.getString(StoriesController.KEY_CACHED_STORIES);
    }
}
