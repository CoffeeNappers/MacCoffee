package com.vkontakte.android.fragments.friends;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.users.UsersSearch;
import com.vkontakte.android.ui.util.SearchSegmenter;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class FriendsListFragment$$Lambda$3 implements SearchSegmenter.Generator {
    private static final FriendsListFragment$$Lambda$3 instance = new FriendsListFragment$$Lambda$3();

    private FriendsListFragment$$Lambda$3() {
    }

    public static SearchSegmenter.Generator lambdaFactory$() {
        return instance;
    }

    @Override // com.vkontakte.android.ui.util.SearchSegmenter.Generator
    @LambdaForm.Hidden
    public VKAPIRequest getSearchRequest(String str, int i, int i2) {
        return new UsersSearch.SimpleSearch(str, i, i2);
    }
}
