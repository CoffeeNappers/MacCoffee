package com.vk.attachpicker.imageeditor.filter;

import com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer;
import com.vk.attachpicker.imageeditor.output.GLTextureInputRenderer;
/* loaded from: classes2.dex */
public abstract class BasicFilter extends GLTextureOutputRenderer implements GLTextureInputRenderer {
    public void newTextureReady(int texture, GLTextureOutputRenderer source, boolean newData) {
        if (newData) {
            markAsDirty();
        }
        this.texture_in = texture;
        setWidth(source.getWidth());
        setHeight(source.getHeight());
        onDrawFrame();
    }

    public void setIntensity(float intensity) {
    }
}
