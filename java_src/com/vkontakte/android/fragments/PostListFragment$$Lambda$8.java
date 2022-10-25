package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import com.vkontakte.android.NewsEntry;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PostListFragment$$Lambda$8 implements DialogInterface.OnClickListener {
    private final PostListFragment arg$1;
    private final NewsEntry arg$2;

    private PostListFragment$$Lambda$8(PostListFragment postListFragment, NewsEntry newsEntry) {
        this.arg$1 = postListFragment;
        this.arg$2 = newsEntry;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(PostListFragment postListFragment, NewsEntry newsEntry) {
        return new PostListFragment$$Lambda$8(postListFragment, newsEntry);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showReportAdDialog$6(this.arg$2, dialogInterface, i);
    }
}
