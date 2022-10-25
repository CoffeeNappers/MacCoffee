package com.vk.attachpicker.imageeditor.output;

import com.vk.attachpicker.imageeditor.GLRenderer;
import com.vk.attachpicker.imageeditor.SnapsterPipeline;
import com.vk.attachpicker.imageeditor.input.GLTextureOutputRenderer;
/* loaded from: classes2.dex */
public class ScreenEndpoint extends GLRenderer implements GLTextureInputRenderer {
    private RenderCallback renderCallback;
    private SnapsterPipeline rendererContext;

    /* loaded from: classes2.dex */
    public interface RenderCallback {
        void onRender();
    }

    public ScreenEndpoint(SnapsterPipeline rendererContext) {
        this.rendererContext = rendererContext;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.attachpicker.imageeditor.GLRenderer
    public void initWithGLContext() {
        setRenderSize(this.rendererContext.getWidth(), this.rendererContext.getHeight());
        super.initWithGLContext();
    }

    @Override // com.vk.attachpicker.imageeditor.output.GLTextureInputRenderer
    public void newTextureReady(int texture, GLTextureOutputRenderer source, boolean newData) {
        this.texture_in = texture;
        setWidth(source.getWidth());
        setHeight(source.getHeight());
        onDrawFrame();
        if (this.renderCallback != null) {
            this.renderCallback.onRender();
        }
    }

    public void setRenderCallback(RenderCallback renderCallback) {
        this.renderCallback = renderCallback;
    }
}
