package com.vkontakte.android.fragments;

import android.view.MenuItem;
import android.widget.PopupMenu;
import com.vkontakte.android.NewsEntry;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PostListFragment$$Lambda$5 implements PopupMenu.OnMenuItemClickListener {
    private final PostListFragment arg$1;
    private final ArrayList arg$2;
    private final NewsEntry arg$3;

    private PostListFragment$$Lambda$5(PostListFragment postListFragment, ArrayList arrayList, NewsEntry newsEntry) {
        this.arg$1 = postListFragment;
        this.arg$2 = arrayList;
        this.arg$3 = newsEntry;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(PostListFragment postListFragment, ArrayList arrayList, NewsEntry newsEntry) {
        return new PostListFragment$$Lambda$5(postListFragment, arrayList, newsEntry);
    }

    @Override // android.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$showItemOptions$3(this.arg$2, this.arg$3, menuItem);
    }
}
