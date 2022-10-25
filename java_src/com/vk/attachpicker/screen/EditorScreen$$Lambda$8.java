package com.vk.attachpicker.screen;

import com.vk.attachpicker.widget.VkSeekBar;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditorScreen$$Lambda$8 implements VkSeekBar.OnSeekBarChangeListener {
    private final EditorScreen arg$1;

    private EditorScreen$$Lambda$8(EditorScreen editorScreen) {
        this.arg$1 = editorScreen;
    }

    public static VkSeekBar.OnSeekBarChangeListener lambdaFactory$(EditorScreen editorScreen) {
        return new EditorScreen$$Lambda$8(editorScreen);
    }

    @Override // com.vk.attachpicker.widget.VkSeekBar.OnSeekBarChangeListener
    @LambdaForm.Hidden
    public void onOnSeekBarValueChange(VkSeekBar vkSeekBar, float f) {
        this.arg$1.lambda$createView$2(vkSeekBar, f);
    }
}
