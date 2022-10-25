package com.vk.attachpicker.widget;

import com.vk.attachpicker.widget.VkSeekBar;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ViewerToolbar$$Lambda$10 implements VkSeekBar.OnSeekBarChangeListener {
    private final ViewerToolbar arg$1;

    private ViewerToolbar$$Lambda$10(ViewerToolbar viewerToolbar) {
        this.arg$1 = viewerToolbar;
    }

    public static VkSeekBar.OnSeekBarChangeListener lambdaFactory$(ViewerToolbar viewerToolbar) {
        return new ViewerToolbar$$Lambda$10(viewerToolbar);
    }

    @Override // com.vk.attachpicker.widget.VkSeekBar.OnSeekBarChangeListener
    @LambdaForm.Hidden
    public void onOnSeekBarValueChange(VkSeekBar vkSeekBar, float f) {
        this.arg$1.lambda$init$0(vkSeekBar, f);
    }
}
