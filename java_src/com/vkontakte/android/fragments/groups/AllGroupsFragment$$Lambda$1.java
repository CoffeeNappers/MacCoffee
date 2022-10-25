package com.vkontakte.android.fragments.groups;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsSearch;
import com.vkontakte.android.ui.util.SearchSegmenter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AllGroupsFragment$$Lambda$1 implements SearchSegmenter.Generator {
    private static final AllGroupsFragment$$Lambda$1 instance = new AllGroupsFragment$$Lambda$1();

    private AllGroupsFragment$$Lambda$1() {
    }

    @Override // com.vkontakte.android.ui.util.SearchSegmenter.Generator
    @LambdaForm.Hidden
    public VKAPIRequest getSearchRequest(String str, int i, int i2) {
        return new GroupsSearch(str, i, i2);
    }
}
