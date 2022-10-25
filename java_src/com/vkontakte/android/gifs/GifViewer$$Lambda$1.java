package com.vkontakte.android.gifs;

import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GifViewer$$Lambda$1 implements Toolbar.OnMenuItemClickListener {
    private final GifViewer arg$1;

    private GifViewer$$Lambda$1(GifViewer gifViewer) {
        this.arg$1 = gifViewer;
    }

    public static Toolbar.OnMenuItemClickListener lambdaFactory$(GifViewer gifViewer) {
        return new GifViewer$$Lambda$1(gifViewer);
    }

    @Override // android.support.v7.widget.Toolbar.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.onOptionsItemSelected(menuItem);
    }
}
