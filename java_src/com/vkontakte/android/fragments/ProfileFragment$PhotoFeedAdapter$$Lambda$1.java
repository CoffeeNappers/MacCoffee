package com.vkontakte.android.fragments;

import com.vkontakte.android.fragments.ProfileFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$PhotoFeedAdapter$$Lambda$1 implements Runnable {
    private final ProfileFragment.PhotoFeedAdapter arg$1;

    private ProfileFragment$PhotoFeedAdapter$$Lambda$1(ProfileFragment.PhotoFeedAdapter photoFeedAdapter) {
        this.arg$1 = photoFeedAdapter;
    }

    public static Runnable lambdaFactory$(ProfileFragment.PhotoFeedAdapter photoFeedAdapter) {
        return new ProfileFragment$PhotoFeedAdapter$$Lambda$1(photoFeedAdapter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.loadMore();
    }
}
