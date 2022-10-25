package com.vk.stories;

import com.vk.stories.model.StoryEntry;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesController$$Lambda$1 implements Consumer {
    private final String arg$1;
    private final StoryEntry arg$2;

    private StoriesController$$Lambda$1(String str, StoryEntry storyEntry) {
        this.arg$1 = str;
        this.arg$2 = storyEntry;
    }

    public static Consumer lambdaFactory$(String str, StoryEntry storyEntry) {
        return new StoriesController$$Lambda$1(str, storyEntry);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        StoriesController.lambda$markAsSeen$0(this.arg$1, this.arg$2, obj);
    }
}
