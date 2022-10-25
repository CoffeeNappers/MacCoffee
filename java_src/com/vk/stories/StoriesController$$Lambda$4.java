package com.vk.stories;

import com.vk.stories.model.StoryEntry;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.Callable;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final /* synthetic */ class StoriesController$$Lambda$4 implements Callable {
    private final JSONObject arg$1;
    private final StoryEntry arg$2;

    private StoriesController$$Lambda$4(JSONObject jSONObject, StoryEntry storyEntry) {
        this.arg$1 = jSONObject;
        this.arg$2 = storyEntry;
    }

    public static Callable lambdaFactory$(JSONObject jSONObject, StoryEntry storyEntry) {
        return new StoriesController$$Lambda$4(jSONObject, storyEntry);
    }

    @Override // java.util.concurrent.Callable
    @LambdaForm.Hidden
    public Object call() {
        return StoriesController.lambda$markStoryInJsonAsSeen$3(this.arg$1, this.arg$2);
    }
}
