package com.vkontakte.android.fragments.groupadmin;

import com.vkontakte.android.RequestUserProfile;
import com.vkontakte.android.fragments.groupadmin.RequestsFragment;
import com.vkontakte.android.functions.VoidF2Int;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RequestsFragment$RequestsAdapter$$Lambda$2 implements VoidF2Int {
    private final RequestsFragment.RequestsAdapter arg$1;

    private RequestsFragment$RequestsAdapter$$Lambda$2(RequestsFragment.RequestsAdapter requestsAdapter) {
        this.arg$1 = requestsAdapter;
    }

    public static VoidF2Int lambdaFactory$(RequestsFragment.RequestsAdapter requestsAdapter) {
        return new RequestsFragment$RequestsAdapter$$Lambda$2(requestsAdapter);
    }

    @Override // com.vkontakte.android.functions.VoidF2Int
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2, int i) {
        this.arg$1.lambda$onCreateViewHolder$1((RequestUserProfile) obj, (Boolean) obj2, i);
    }
}
