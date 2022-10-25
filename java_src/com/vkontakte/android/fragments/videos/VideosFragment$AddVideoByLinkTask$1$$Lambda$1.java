package com.vkontakte.android.fragments.videos;

import com.vkontakte.android.fragments.videos.VideosFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideosFragment$AddVideoByLinkTask$1$$Lambda$1 implements Runnable {
    private final VideosFragment.AddVideoByLinkTask.AnonymousClass1 arg$1;
    private final int arg$2;
    private final String arg$3;

    private VideosFragment$AddVideoByLinkTask$1$$Lambda$1(VideosFragment.AddVideoByLinkTask.AnonymousClass1 anonymousClass1, int i, String str) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = i;
        this.arg$3 = str;
    }

    public static Runnable lambdaFactory$(VideosFragment.AddVideoByLinkTask.AnonymousClass1 anonymousClass1, int i, String str) {
        return new VideosFragment$AddVideoByLinkTask$1$$Lambda$1(anonymousClass1, i, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$success$0(this.arg$2, this.arg$3);
    }
}
