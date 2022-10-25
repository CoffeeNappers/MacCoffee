package com.vkontakte.android.fragments.groupadmin;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.fragments.groupadmin.RequestsFragment;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RequestsFragment$RequestsAdapter$$Lambda$1 implements VoidF1 {
    private final RequestsFragment.RequestsAdapter arg$1;

    private RequestsFragment$RequestsAdapter$$Lambda$1(RequestsFragment.RequestsAdapter requestsAdapter) {
        this.arg$1 = requestsAdapter;
    }

    public static VoidF1 lambdaFactory$(RequestsFragment.RequestsAdapter requestsAdapter) {
        return new RequestsFragment$RequestsAdapter$$Lambda$1(requestsAdapter);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onCreateViewHolder$0((UserProfile) obj);
    }
}
