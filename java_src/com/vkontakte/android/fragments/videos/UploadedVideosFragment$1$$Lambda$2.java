package com.vkontakte.android.fragments.videos;

import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.fragments.videos.UploadedVideosFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class UploadedVideosFragment$1$$Lambda$2 implements Runnable {
    private final UploadedVideosFragment.AnonymousClass1 arg$1;
    private final ArrayList arg$2;
    private final VideoFile arg$3;

    private UploadedVideosFragment$1$$Lambda$2(UploadedVideosFragment.AnonymousClass1 anonymousClass1, ArrayList arrayList, VideoFile videoFile) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = arrayList;
        this.arg$3 = videoFile;
    }

    public static Runnable lambdaFactory$(UploadedVideosFragment.AnonymousClass1 anonymousClass1, ArrayList arrayList, VideoFile videoFile) {
        return new UploadedVideosFragment$1$$Lambda$2(anonymousClass1, arrayList, videoFile);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2, this.arg$3);
    }
}
