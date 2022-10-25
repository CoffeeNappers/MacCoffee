package com.vkontakte.android.ui.holder.market;

import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.Photo;
import com.vkontakte.android.ui.holder.market.SquareGalleryHolder;
import java.lang.invoke.LambdaForm;
import java.util.List;
/* loaded from: classes.dex */
final /* synthetic */ class SquareGalleryHolder$Adapter$$Lambda$1 implements View.OnClickListener {
    private final SquareGalleryHolder.Adapter arg$1;
    private final ViewGroup arg$2;
    private final List arg$3;
    private final int arg$4;
    private final Photo.Image arg$5;

    private SquareGalleryHolder$Adapter$$Lambda$1(SquareGalleryHolder.Adapter adapter, ViewGroup viewGroup, List list, int i, Photo.Image image) {
        this.arg$1 = adapter;
        this.arg$2 = viewGroup;
        this.arg$3 = list;
        this.arg$4 = i;
        this.arg$5 = image;
    }

    public static View.OnClickListener lambdaFactory$(SquareGalleryHolder.Adapter adapter, ViewGroup viewGroup, List list, int i, Photo.Image image) {
        return new SquareGalleryHolder$Adapter$$Lambda$1(adapter, viewGroup, list, i, image);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$instantiateItem$0(this.arg$2, this.arg$3, this.arg$4, this.arg$5, view);
    }
}
