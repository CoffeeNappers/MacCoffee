package com.vk.music.attach.controller;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchController$$Lambda$1 implements Runnable {
    private final SearchController arg$1;

    private SearchController$$Lambda$1(SearchController searchController) {
        this.arg$1 = searchController;
    }

    public static Runnable lambdaFactory$(SearchController searchController) {
        return new SearchController$$Lambda$1(searchController);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onStartSearch();
    }
}
