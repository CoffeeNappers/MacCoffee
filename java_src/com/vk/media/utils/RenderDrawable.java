package com.vk.media.utils;

import com.vk.media.camera.CameraUtils;
import com.vk.media.utils.grafika.GlUtil;
import com.vk.media.utils.grafika.Texture2dProgram;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;
/* loaded from: classes2.dex */
public class RenderDrawable {
    private Texture2dProgram mProgram;
    private Drawable2d mRectDrawable;

    /* loaded from: classes2.dex */
    public enum Flip {
        NO_FLIP,
        VERTICAL,
        HORIZONTAL,
        VERTICAL_HORIZONTAL
    }

    /* loaded from: classes2.dex */
    public enum Rotation {
        ROTATION_0,
        ROTATION_90,
        ROTATION_180,
        ROTATION_270
    }

    public RenderDrawable(Texture2dProgram program) {
        this.mRectDrawable = new Drawable2d(program.getProgramType());
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

    public Drawable2d getDrawable() {
        return this.mRectDrawable;
    }

    public void changeProgram(Texture2dProgram program) {
        this.mProgram.release();
        this.mProgram = program;
    }

    public int createTextureObject() {
        return this.mProgram.createTextureObject();
    }

    public void drawFrame(int textureId, float[] texMatrix, Flip flip) {
        this.mProgram.draw(GlUtil.IDENTITY_MATRIX, this.mRectDrawable.getVertexArray(), 0, this.mRectDrawable.getVertexCount(), this.mRectDrawable.getCoordsPerVertex(), this.mRectDrawable.getVertexStride(), texMatrix, this.mRectDrawable.getTexCoordArray(flip), textureId, this.mRectDrawable.getTexCoordStride());
    }

    public void drawFrame2D(int textureId, float[] texMatrix, Flip flip, IntBuffer pixels, int width, int height) {
        this.mProgram.drawPixels(GlUtil.IDENTITY_MATRIX, this.mRectDrawable.getVertexArray(), 0, this.mRectDrawable.getVertexCount(), this.mRectDrawable.getCoordsPerVertex(), this.mRectDrawable.getVertexStride(), texMatrix, this.mRectDrawable.getTexCoordArray(flip), textureId, this.mRectDrawable.getTexCoordStride(), width, height, pixels);
    }

    /* loaded from: classes2.dex */
    public static class Drawable2d {
        private static final int SIZEOF_FLOAT = 4;
        private int mCoordsPerVertex;
        private FloatBuffer mTexCoordArray;
        private FloatBuffer mTexCoordArrayFlip;
        private int mTexCoordStride;
        private Texture2dProgram.ProgramType mType;
        private FloatBuffer mVertexArray = GlUtil.createFloatBuffer(FULL_RECTANGLE_COORDS);
        private int mVertexCount;
        private int mVertexStride;
        private static final float[] FULL_RECTANGLE_COORDS = {-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f, 1.0f, 1.0f};
        private static final float[] FULL_RECTANGLE_TEX_COORDS_0 = {0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f};
        private static final float[] FULL_RECTANGLE_TEX_COORDS_90 = {0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f};
        private static final float[] FULL_RECTANGLE_TEX_COORDS_180 = {1.0f, 1.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f};
        private static final float[] FULL_RECTANGLE_TEX_COORDS_270 = {1.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f};

        public Drawable2d(Texture2dProgram.ProgramType type) {
            this.mType = Texture2dProgram.ProgramType.TEXTURE_2D;
            this.mType = type;
            makeTexCoordArrays(true);
            this.mCoordsPerVertex = 2;
            this.mVertexStride = this.mCoordsPerVertex * 4;
            this.mVertexCount = FULL_RECTANGLE_COORDS.length / this.mCoordsPerVertex;
            this.mTexCoordStride = 8;
        }

        public final FloatBuffer getVertexArray() {
            return this.mVertexArray;
        }

        public final FloatBuffer getTexCoordArray(Flip flip) {
            return flip == Flip.NO_FLIP ? this.mTexCoordArray : this.mTexCoordArrayFlip;
        }

        public final int getVertexCount() {
            return this.mVertexCount;
        }

        public final int getVertexStride() {
            return this.mVertexStride;
        }

        public final int getTexCoordStride() {
            return this.mTexCoordStride;
        }

        public final int getCoordsPerVertex() {
            return this.mCoordsPerVertex;
        }

        public void makeTexCoordArrays(boolean backCamera) {
            if (this.mType == Texture2dProgram.ProgramType.TEXTURE_2D) {
                Rotation rotation = getRotationByModel(backCamera);
                this.mTexCoordArray = GlUtil.createFloatBuffer(getRotation(rotation, Flip.VERTICAL_HORIZONTAL));
                this.mTexCoordArrayFlip = GlUtil.createFloatBuffer(getRotation(rotation, Flip.VERTICAL));
                return;
            }
            this.mTexCoordArray = GlUtil.createFloatBuffer(getRotation(Rotation.ROTATION_0, Flip.NO_FLIP));
            this.mTexCoordArrayFlip = GlUtil.createFloatBuffer(getRotation(Rotation.ROTATION_0, Flip.VERTICAL));
        }

        private static float[] getRotation(Rotation angle, Flip flip) {
            float[] rotatedTex;
            switch (angle) {
                case ROTATION_0:
                    rotatedTex = FULL_RECTANGLE_TEX_COORDS_0;
                    break;
                case ROTATION_90:
                    rotatedTex = FULL_RECTANGLE_TEX_COORDS_90;
                    break;
                case ROTATION_180:
                    rotatedTex = FULL_RECTANGLE_TEX_COORDS_180;
                    break;
                case ROTATION_270:
                    rotatedTex = FULL_RECTANGLE_TEX_COORDS_270;
                    break;
                default:
                    rotatedTex = FULL_RECTANGLE_TEX_COORDS_0;
                    break;
            }
            switch (flip) {
                case VERTICAL:
                    return flipVertical(rotatedTex);
                case HORIZONTAL:
                    return flipHorizontal(rotatedTex);
                case VERTICAL_HORIZONTAL:
                    return flipHorizontal(flipVertical(rotatedTex));
                default:
                    return rotatedTex;
            }
        }

        private static float[] flipVertical(float[] rotatedTex) {
            return new float[]{flip(rotatedTex[0]), rotatedTex[1], flip(rotatedTex[2]), rotatedTex[3], flip(rotatedTex[4]), rotatedTex[5], flip(rotatedTex[6]), rotatedTex[7]};
        }

        private static float[] flipHorizontal(float[] rotatedTex) {
            return new float[]{rotatedTex[0], flip(rotatedTex[1]), rotatedTex[2], flip(rotatedTex[3]), rotatedTex[4], flip(rotatedTex[5]), rotatedTex[6], flip(rotatedTex[7])};
        }

        private static float flip(float i) {
            return i == 0.0f ? 1.0f : 0.0f;
        }

        private static Rotation getRotationByModel(boolean backCamera) {
            return CameraUtils.hasVerticalFlipByModel(backCamera) ? Rotation.ROTATION_90 : Rotation.ROTATION_270;
        }
    }
}
