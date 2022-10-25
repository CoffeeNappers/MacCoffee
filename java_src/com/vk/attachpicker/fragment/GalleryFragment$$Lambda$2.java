package com.vk.attachpicker.fragment;

import com.vk.attachpicker.SelectionContext;
import com.vk.attachpicker.widget.OnItemClickListener;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GalleryFragment$$Lambda$2 implements OnItemClickListener {
    private final GalleryFragment arg$1;
    private final SelectionContext arg$2;

    private GalleryFragment$$Lambda$2(GalleryFragment galleryFragment, SelectionContext selectionContext) {
        this.arg$1 = galleryFragment;
        this.arg$2 = selectionContext;
    }

    public static OnItemClickListener lambdaFactory$(GalleryFragment galleryFragment, SelectionContext selectionContext) {
        return new GalleryFragment$$Lambda$2(galleryFragment, selectionContext);
    }

    @Override // com.vk.attachpicker.widget.OnItemClickListener
    @LambdaForm.Hidden
    public void onItemClickListener(int i) {
        this.arg$1.lambda$onViewCreated$0(this.arg$2, i);
    }
}
