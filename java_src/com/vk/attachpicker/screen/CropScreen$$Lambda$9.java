package com.vk.attachpicker.screen;

import android.support.v7.widget.PopupMenu;
import android.view.MenuItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CropScreen$$Lambda$9 implements PopupMenu.OnMenuItemClickListener {
    private final CropScreen arg$1;

    private CropScreen$$Lambda$9(CropScreen cropScreen) {
        this.arg$1 = cropScreen;
    }

    public static PopupMenu.OnMenuItemClickListener lambdaFactory$(CropScreen cropScreen) {
        return new CropScreen$$Lambda$9(cropScreen);
    }

    @Override // android.support.v7.widget.PopupMenu.OnMenuItemClickListener
    @LambdaForm.Hidden
    public boolean onMenuItemClick(MenuItem menuItem) {
        return this.arg$1.lambda$showAspectRatioMenu$8(menuItem);
    }
}
