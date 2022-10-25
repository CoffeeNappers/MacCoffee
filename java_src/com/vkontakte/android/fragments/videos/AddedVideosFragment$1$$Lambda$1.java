package com.vkontakte.android.fragments.videos;

import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.videos.AddedVideosFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class AddedVideosFragment$1$$Lambda$1 implements Friends.GetUsersCallback {
    private final AddedVideosFragment.AnonymousClass1 arg$1;
    private final VideoFile arg$2;

    private AddedVideosFragment$1$$Lambda$1(AddedVideosFragment.AnonymousClass1 anonymousClass1, VideoFile videoFile) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = videoFile;
    }

    public static Friends.GetUsersCallback lambdaFactory$(AddedVideosFragment.AnonymousClass1 anonymousClass1, VideoFile videoFile) {
        return new AddedVideosFragment$1$$Lambda$1(anonymousClass1, videoFile);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        this.arg$1.lambda$onReceive$1(this.arg$2, arrayList);
    }
}
