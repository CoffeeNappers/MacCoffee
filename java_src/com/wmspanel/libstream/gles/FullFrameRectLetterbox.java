package com.wmspanel.libstream.gles;

import android.annotation.TargetApi;
import android.opengl.Matrix;
@TargetApi(18)
/* loaded from: classes3.dex */
public class FullFrameRectLetterbox extends FullFrameRect {
    public FullFrameRectLetterbox(Texture2dProgram program) {
        super(program);
    }

    private void drawFrame(int textureId, float[] texMatrix, float[] matrix) {
        this.mProgram.draw(matrix, this.mRectDrawable.getVertexArray(), 0, this.mRectDrawable.getVertexCount(), this.mRectDrawable.getCoordsPerVertex(), this.mRectDrawable.getVertexStride(), texMatrix, this.mRectDrawable.getTexCoordArray(), textureId, this.mRectDrawable.getTexCoordStride());
    }

    private float[] makeMatrix() {
        float[] fArr = new float[16];
        Matrix.setIdentityM(fArr, 0);
        return fArr;
    }

    public void drawFrameY(int textureId, float[] texMatrix, int rotate, float scale) {
        float[] makeMatrix = makeMatrix();
        if (rotate != 0) {
            Matrix.rotateM(makeMatrix, 0, rotate, 0.0f, 0.0f, 1.0f);
        }
        if (scale != 1.0f) {
            Matrix.scaleM(makeMatrix, 0, 1.0f, scale, 1.0f);
        }
        drawFrame(textureId, texMatrix, makeMatrix);
    }

    public void drawFrameMirrorY(int textureId, float[] texMatrix, int rotate, float scale) {
        float[] makeMatrix = makeMatrix();
        if (rotate != 0) {
            Matrix.rotateM(makeMatrix, 0, rotate, 0.0f, 0.0f, 1.0f);
        }
        if (rotate == 90 || rotate == 270) {
            scale = -scale;
        }
        if (scale != 1.0f) {
            Matrix.scaleM(makeMatrix, 0, 1.0f, scale, 1.0f);
        }
        if (rotate == 0 || rotate == 180) {
            Matrix.scaleM(makeMatrix, 0, -1.0f, 1.0f, 1.0f);
        }
        drawFrame(textureId, texMatrix, makeMatrix);
    }

    public void drawFrameX(int textureId, float[] texMatrix, int rotate, float scale) {
        float[] makeMatrix = makeMatrix();
        if (rotate != 0) {
            Matrix.rotateM(makeMatrix, 0, rotate, 0.0f, 0.0f, 1.0f);
        }
        if (scale != 1.0f) {
            Matrix.scaleM(makeMatrix, 0, scale, 1.0f, 1.0f);
        }
        drawFrame(textureId, texMatrix, makeMatrix);
    }

    public void drawFrameMirrorX(int textureId, float[] texMatrix, int rotate, float scale) {
        float[] makeMatrix = makeMatrix();
        if (rotate != 0) {
            Matrix.rotateM(makeMatrix, 0, rotate, 0.0f, 0.0f, 1.0f);
        }
        if (rotate == 0 || rotate == 180) {
            scale = -scale;
        }
        if (scale != 1.0f) {
            Matrix.scaleM(makeMatrix, 0, scale, 1.0f, 1.0f);
        }
        if (rotate == 90 || rotate == 270) {
            Matrix.scaleM(makeMatrix, 0, 1.0f, -1.0f, 1.0f);
        }
        drawFrame(textureId, texMatrix, makeMatrix);
    }
}
