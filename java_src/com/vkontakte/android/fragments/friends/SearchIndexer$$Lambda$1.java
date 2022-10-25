package com.vkontakte.android.fragments.friends;

import java.lang.invoke.LambdaForm;
import java.util.Comparator;
/* loaded from: classes.dex */
final /* synthetic */ class SearchIndexer$$Lambda$1 implements Comparator {
    private final SearchIndexer arg$1;
    private final String arg$2;

    private SearchIndexer$$Lambda$1(SearchIndexer searchIndexer, String str) {
        this.arg$1 = searchIndexer;
        this.arg$2 = str;
    }

    public static Comparator lambdaFactory$(SearchIndexer searchIndexer, String str) {
        return new SearchIndexer$$Lambda$1(searchIndexer, str);
    }

    @Override // java.util.Comparator
    @LambdaForm.Hidden
    public int compare(Object obj, Object obj2) {
        return this.arg$1.lambda$search$0(this.arg$2, obj, obj2);
    }
}
