package com.vk.attachpicker.imageeditor;

import android.opengl.GLES20;
import android.opengl.GLSurfaceView;
import java.util.ArrayList;
import java.util.List;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
/* loaded from: classes2.dex */
public class SnapsterPipeline implements GLSurfaceView.Renderer {
    private int height;
    private int width;
    private boolean rendering = false;
    private List<GLRenderer> filtersToDestroy = new ArrayList();
    private List<GLRenderer> rootRenderers = new ArrayList();

    public void addFilterToDestroy(GLRenderer renderer) {
        synchronized (this.filtersToDestroy) {
            this.filtersToDestroy.add(renderer);
        }
    }

    public synchronized void addRootRenderer(GLRenderer rootRenderer) {
        this.rootRenderers.add(rootRenderer);
    }

    public int getHeight() {
        return this.height;
    }

    public int getWidth() {
        return this.width;
    }

    private synchronized boolean isRendering() {
        return this.rendering;
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public void onDrawFrame(GL10 unused) {
        GLRenderer rootRenderer;
        if (isRendering()) {
            for (int i = 0; i < this.rootRenderers.size(); i++) {
                synchronized (this) {
                    rootRenderer = this.rootRenderers.get(i);
                }
                rootRenderer.onDrawFrame();
            }
        }
        synchronized (this.filtersToDestroy) {
            for (GLRenderer renderer : this.filtersToDestroy) {
                renderer.destroy();
            }
            this.filtersToDestroy.clear();
        }
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public void onSurfaceChanged(GL10 unused, int width, int height) {
        this.width = width;
        this.height = height;
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public void onSurfaceCreated(GL10 unused, EGLConfig config) {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glDisable(2929);
    }

    public synchronized void pauseRendering() {
        this.rendering = false;
    }

    public synchronized void removeRootRenderer(GLRenderer rootRenderer) {
        this.rootRenderers.remove(rootRenderer);
    }

    public synchronized void startRendering() {
        if (this.rootRenderers.size() != 0) {
            this.rendering = true;
        }
    }
}
