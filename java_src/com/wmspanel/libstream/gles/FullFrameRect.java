package com.wmspanel.libstream.gles;

import android.annotation.TargetApi;
import com.wmspanel.libstream.gles.Drawable2d;
@TargetApi(18)
/* loaded from: classes3.dex */
public class FullFrameRect {
    protected Texture2dProgram mProgram;
    protected final Drawable2d mRectDrawable = new Drawable2d(Drawable2d.Prefab.FULL_RECTANGLE);

    public FullFrameRect(Texture2dProgram program) {
        this.mProgram = program;
    }

    public void release(boolean doEglCleanup) {
        if (this.mProgram != null) {
            if (doEglCleanup) {
                this.mProgram.release();
            }
            this.mProgram = null;
        }
    }

    public Texture2dProgram getProgram() {
        return this.mProgram;
    }

    public void changeProgram(Texture2dProgram program) {
        this.mProgram.release();
        this.mProgram = program;
    }

    public int createTextureObject() {
        return this.mProgram.createTextureObject();
    }

    public void drawFrame(int textureId, float[] texMatrix) {
        this.mProgram.draw(GlUtil.IDENTITY_MATRIX, this.mRectDrawable.getVertexArray(), 0, this.mRectDrawable.getVertexCount(), this.mRectDrawable.getCoordsPerVertex(), this.mRectDrawable.getVertexStride(), texMatrix, this.mRectDrawable.getTexCoordArray(), textureId, this.mRectDrawable.getTexCoordStride());
    }
}
