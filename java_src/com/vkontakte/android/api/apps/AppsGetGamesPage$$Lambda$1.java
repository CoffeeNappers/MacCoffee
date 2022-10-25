package com.vkontakte.android.api.apps;

import com.vkontakte.android.data.GameRequest;
import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
final /* synthetic */ class AppsGetGamesPage$$Lambda$1 implements Comparator {
    private static final AppsGetGamesPage$$Lambda$1 instance = new AppsGetGamesPage$$Lambda$1();

    private AppsGetGamesPage$$Lambda$1() {
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return AppsGetGamesPage.lambda$getAllRequestsAndInvites$0((GameRequest) obj, (GameRequest) obj2);
    }
}
