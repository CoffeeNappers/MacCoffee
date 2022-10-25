package com.vk.attachpicker.imageeditor;

import android.content.Context;
import android.graphics.Bitmap;
import com.vk.attachpicker.imageeditor.filter.AllInOneFilter;
import com.vk.attachpicker.imageeditor.input.ImageResourceInput;
import com.vk.attachpicker.imageeditor.output.ScreenEndpoint;
/* loaded from: classes2.dex */
public class SnapsterImageEditorView extends GLTextureView {
    private AllInOneFilter filter;
    private ImageResourceInput input;
    private SnapsterPipeline pipeline;
    private ScreenEndpoint screen;

    public SnapsterImageEditorView(Context context) {
        super(context);
        init();
    }

    private synchronized void init() {
        this.pipeline = new SnapsterPipeline();
        setPreserveEGLContextOnPause(true);
        setEGLContextClientVersion(2);
        setEGLConfigChooser(8, 8, 8, 8, 16, 0);
        setRenderer(this.pipeline);
        setRenderMode(0);
        this.screen = new ScreenEndpoint(this.pipeline);
    }

    @Override // android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        if (getMeasuredWidth() > 0 && getMeasuredHeight() > 0) {
            this.screen.setRenderSize(getMeasuredWidth(), getMeasuredHeight());
            requestRender();
        }
    }

    public synchronized void requestRender(final ScreenEndpoint.RenderCallback renderCallback) {
        this.screen.setRenderCallback(new ScreenEndpoint.RenderCallback() { // from class: com.vk.attachpicker.imageeditor.SnapsterImageEditorView.1
            @Override // com.vk.attachpicker.imageeditor.output.ScreenEndpoint.RenderCallback
            public void onRender() {
                renderCallback.onRender();
                SnapsterImageEditorView.this.screen.setRenderCallback(null);
            }
        });
        requestRender();
    }

    public synchronized void setImage(Bitmap image) {
        this.pipeline.pauseRendering();
        if (this.input != null) {
            this.input.clearTargets();
            this.pipeline.removeRootRenderer(this.input);
            this.pipeline.addFilterToDestroy(this.input);
        }
        this.input = new ImageResourceInput(image);
        if (this.filter == null) {
            this.input.addTarget(this.screen);
        } else {
            this.input.addTarget(this.filter);
            this.filter.clearTargets();
            this.filter.addTarget(this.screen);
        }
        this.pipeline.addRootRenderer(this.input);
        this.pipeline.startRendering();
        requestRender();
    }

    public synchronized void setFilter(FilterProducer newFilter) {
        AllInOneFilter simpleGroupFilter = newFilter.getFilter();
        setFilterInternal(simpleGroupFilter);
    }

    public synchronized AllInOneFilter getFilter() {
        return this.filter;
    }

    private synchronized void setFilterInternal(AllInOneFilter newFilter) {
        if (this.input == null) {
            throw new IllegalStateException("You should set bitmap first");
        }
        this.pipeline.pauseRendering();
        this.input.clearTargets();
        if (this.filter != null) {
            this.pipeline.addFilterToDestroy(this.filter);
        }
        this.filter = newFilter;
        if (this.filter == null) {
            this.input.addTarget(this.screen);
        } else {
            this.input.addTarget(this.filter);
            this.filter.addTarget(this.screen);
        }
        this.pipeline.startRendering();
        requestRender();
    }
}
