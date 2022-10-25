package com.vkontakte.android.fragments.userlist;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.ui.util.SearchSegmenter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GroupMembersListFragment$$Lambda$2 implements SearchSegmenter.Generator {
    private final String arg$1;
    private final int arg$2;

    private GroupMembersListFragment$$Lambda$2(String str, int i) {
        this.arg$1 = str;
        this.arg$2 = i;
    }

    public static SearchSegmenter.Generator lambdaFactory$(String str, int i) {
        return new GroupMembersListFragment$$Lambda$2(str, i);
    }

    @Override // com.vkontakte.android.ui.util.SearchSegmenter.Generator
    @LambdaForm.Hidden
    public VKAPIRequest getSearchRequest(String str, int i, int i2) {
        return GroupMembersListFragment.lambda$onCreate$0(this.arg$1, this.arg$2, str, i, i2);
    }
}
