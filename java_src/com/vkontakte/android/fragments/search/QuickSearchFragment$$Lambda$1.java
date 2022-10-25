package com.vkontakte.android.fragments.search;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.ui.util.SearchSegmenter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class QuickSearchFragment$$Lambda$1 implements SearchSegmenter.Generator {
    private final QuickSearchFragment arg$1;

    private QuickSearchFragment$$Lambda$1(QuickSearchFragment quickSearchFragment) {
        this.arg$1 = quickSearchFragment;
    }

    public static SearchSegmenter.Generator lambdaFactory$(QuickSearchFragment quickSearchFragment) {
        return new QuickSearchFragment$$Lambda$1(quickSearchFragment);
    }

    @Override // com.vkontakte.android.ui.util.SearchSegmenter.Generator
    @LambdaForm.Hidden
    public VKAPIRequest getSearchRequest(String str, int i, int i2) {
        return this.arg$1.lambda$new$0(str, i, i2);
    }
}
