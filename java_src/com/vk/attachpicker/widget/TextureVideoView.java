package com.vk.attachpicker.widget;

import android.content.Context;
import android.content.Intent;
import android.graphics.Matrix;
import android.graphics.SurfaceTexture;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.MediaController;
import android.widget.VideoView;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.utils.Utils;
import java.io.IOException;
/* loaded from: classes2.dex */
public class TextureVideoView extends TextureView implements MediaController.MediaPlayerControl {
    private static final String LOG_TAG = "CenterCropVideoView";
    private static final int STATE_ERROR = -1;
    private static final int STATE_IDLE = 0;
    private static final int STATE_PAUSED = 4;
    private static final int STATE_PLAYBACK_COMPLETED = 5;
    private static final int STATE_PLAYING = 3;
    private static final int STATE_PREPARED = 2;
    private static final int STATE_PREPARING = 1;
    private static final ScaleType[] sScaleTypeArray = {ScaleType.MATRIX, ScaleType.FIT_XY, ScaleType.FIT_START, ScaleType.FIT_CENTER, ScaleType.FIT_END, ScaleType.CENTER, ScaleType.CENTER_CROP, ScaleType.CENTER_INSIDE};
    private final FocusListener focusListener;
    private boolean isSound;
    private boolean loop;
    private MediaPlayer.OnBufferingUpdateListener mBufferingUpdateListener;
    private MediaPlayer.OnCompletionListener mCompletionListener;
    private Context mContext;
    private int mCurrentBufferPercentage;
    private int mCurrentState;
    private MediaPlayer.OnErrorListener mErrorListener;
    private MediaPlayer.OnInfoListener mInfoListener;
    private MediaPlayer mMediaPlayer;
    private MediaPlayer.OnCompletionListener mOCompletionListener;
    private MediaPlayer.OnErrorListener mOnErrorListener;
    private MediaPlayer.OnInfoListener mOnInfoListener;
    private MediaPlayer.OnPreparedListener mOnPreparedListener;
    private MediaPlayer.OnPreparedListener mPreparedListener;
    private ScaleType mScaleType;
    private MediaPlayer.OnVideoSizeChangedListener mSizeChangedListener;
    private Surface mSurface;
    private TextureView.SurfaceTextureListener mSurfaceTextureListener;
    private int mTargetState;
    private int mVideoHeight;
    private int mVideoWidth;
    private Uri uri;

    /* loaded from: classes2.dex */
    public enum ScaleType {
        MATRIX(0),
        FIT_XY(1),
        FIT_START(2),
        FIT_CENTER(3),
        FIT_END(4),
        CENTER(5),
        CENTER_CROP(6),
        CENTER_INSIDE(7);
        
        final int nativeInt;

        ScaleType(int ni) {
            this.nativeInt = ni;
        }
    }

    public TextureVideoView(Context context) {
        super(context);
        this.mCurrentState = 0;
        this.mTargetState = 0;
        this.focusListener = new FocusListener();
        this.loop = true;
        this.mSizeChangedListener = new MediaPlayer.OnVideoSizeChangedListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.1
            @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
            public void onVideoSizeChanged(MediaPlayer mp, int width, int height) {
                TextureVideoView.this.mVideoWidth = mp.getVideoWidth();
                TextureVideoView.this.mVideoHeight = mp.getVideoHeight();
                if (TextureVideoView.this.mVideoWidth != 0 && TextureVideoView.this.mVideoHeight != 0) {
                    TextureVideoView.this.requestLayout();
                    TextureVideoView.this.initVideo();
                }
            }
        };
        this.mPreparedListener = new MediaPlayer.OnPreparedListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.2
            @Override // android.media.MediaPlayer.OnPreparedListener
            public void onPrepared(MediaPlayer mp) {
                TextureVideoView.this.mCurrentState = 2;
                if (TextureVideoView.this.mOnPreparedListener != null) {
                    TextureVideoView.this.mOnPreparedListener.onPrepared(mp);
                }
                TextureVideoView.this.mVideoWidth = mp.getVideoWidth();
                TextureVideoView.this.mVideoHeight = mp.getVideoHeight();
                TextureVideoView.this.seekTo(1);
                if (TextureVideoView.this.mVideoWidth == 0 || TextureVideoView.this.mVideoHeight == 0) {
                    if (TextureVideoView.this.mTargetState == 3) {
                        TextureVideoView.this.start();
                        return;
                    }
                    return;
                }
                TextureVideoView.this.initVideo();
                if (TextureVideoView.this.mTargetState == 3) {
                    TextureVideoView.this.start();
                }
            }
        };
        this.mCompletionListener = new MediaPlayer.OnCompletionListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.3
            @Override // android.media.MediaPlayer.OnCompletionListener
            public void onCompletion(MediaPlayer mp) {
                TextureVideoView.this.mCurrentState = 5;
                TextureVideoView.this.mTargetState = 5;
                if (TextureVideoView.this.mOCompletionListener != null) {
                    TextureVideoView.this.mOCompletionListener.onCompletion(TextureVideoView.this.mMediaPlayer);
                }
            }
        };
        this.mInfoListener = new MediaPlayer.OnInfoListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.4
            @Override // android.media.MediaPlayer.OnInfoListener
            public boolean onInfo(MediaPlayer mp, int arg1, int arg2) {
                if (TextureVideoView.this.mOnInfoListener != null) {
                    TextureVideoView.this.mOnInfoListener.onInfo(mp, arg1, arg2);
                    return true;
                }
                return true;
            }
        };
        this.mErrorListener = new MediaPlayer.OnErrorListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.5
            @Override // android.media.MediaPlayer.OnErrorListener
            public boolean onError(MediaPlayer mp, int framework_err, int impl_err) {
                Log.d(TextureVideoView.LOG_TAG, "Error: " + framework_err + "," + impl_err);
                TextureVideoView.this.mCurrentState = -1;
                TextureVideoView.this.mTargetState = -1;
                if (TextureVideoView.this.mOnErrorListener == null || TextureVideoView.this.mOnErrorListener.onError(TextureVideoView.this.mMediaPlayer, framework_err, impl_err)) {
                }
                return true;
            }
        };
        this.mBufferingUpdateListener = new MediaPlayer.OnBufferingUpdateListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.6
            @Override // android.media.MediaPlayer.OnBufferingUpdateListener
            public void onBufferingUpdate(MediaPlayer mp, int percent) {
                TextureVideoView.this.mCurrentBufferPercentage = percent;
            }
        };
        this.mSurfaceTextureListener = new TextureView.SurfaceTextureListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.7
            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
                TextureVideoView.this.mSurface = new Surface(surface);
                TextureVideoView.this.openVideo();
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
                boolean isValidState = TextureVideoView.this.mTargetState == 3;
                boolean hasValidSize = TextureVideoView.this.mVideoWidth == width && TextureVideoView.this.mVideoHeight == height;
                if (TextureVideoView.this.mMediaPlayer != null && isValidState && hasValidSize) {
                    TextureVideoView.this.start();
                }
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
                if (TextureVideoView.this.mMediaPlayer != null) {
                    TextureVideoView.this.mMediaPlayer.reset();
                    TextureVideoView.this.mMediaPlayer.release();
                    TextureVideoView.this.mMediaPlayer = null;
                }
                if (TextureVideoView.this.mSurface != null) {
                    TextureVideoView.this.mSurface.release();
                    TextureVideoView.this.mSurface = null;
                    return true;
                }
                return true;
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureUpdated(SurfaceTexture surface) {
            }
        };
        this.isSound = true;
        this.mContext = context;
        initVideoView();
        setScaleType(ScaleType.FIT_CENTER);
    }

    public TextureVideoView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mCurrentState = 0;
        this.mTargetState = 0;
        this.focusListener = new FocusListener();
        this.loop = true;
        this.mSizeChangedListener = new MediaPlayer.OnVideoSizeChangedListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.1
            @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
            public void onVideoSizeChanged(MediaPlayer mp, int width, int height) {
                TextureVideoView.this.mVideoWidth = mp.getVideoWidth();
                TextureVideoView.this.mVideoHeight = mp.getVideoHeight();
                if (TextureVideoView.this.mVideoWidth != 0 && TextureVideoView.this.mVideoHeight != 0) {
                    TextureVideoView.this.requestLayout();
                    TextureVideoView.this.initVideo();
                }
            }
        };
        this.mPreparedListener = new MediaPlayer.OnPreparedListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.2
            @Override // android.media.MediaPlayer.OnPreparedListener
            public void onPrepared(MediaPlayer mp) {
                TextureVideoView.this.mCurrentState = 2;
                if (TextureVideoView.this.mOnPreparedListener != null) {
                    TextureVideoView.this.mOnPreparedListener.onPrepared(mp);
                }
                TextureVideoView.this.mVideoWidth = mp.getVideoWidth();
                TextureVideoView.this.mVideoHeight = mp.getVideoHeight();
                TextureVideoView.this.seekTo(1);
                if (TextureVideoView.this.mVideoWidth == 0 || TextureVideoView.this.mVideoHeight == 0) {
                    if (TextureVideoView.this.mTargetState == 3) {
                        TextureVideoView.this.start();
                        return;
                    }
                    return;
                }
                TextureVideoView.this.initVideo();
                if (TextureVideoView.this.mTargetState == 3) {
                    TextureVideoView.this.start();
                }
            }
        };
        this.mCompletionListener = new MediaPlayer.OnCompletionListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.3
            @Override // android.media.MediaPlayer.OnCompletionListener
            public void onCompletion(MediaPlayer mp) {
                TextureVideoView.this.mCurrentState = 5;
                TextureVideoView.this.mTargetState = 5;
                if (TextureVideoView.this.mOCompletionListener != null) {
                    TextureVideoView.this.mOCompletionListener.onCompletion(TextureVideoView.this.mMediaPlayer);
                }
            }
        };
        this.mInfoListener = new MediaPlayer.OnInfoListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.4
            @Override // android.media.MediaPlayer.OnInfoListener
            public boolean onInfo(MediaPlayer mp, int arg1, int arg2) {
                if (TextureVideoView.this.mOnInfoListener != null) {
                    TextureVideoView.this.mOnInfoListener.onInfo(mp, arg1, arg2);
                    return true;
                }
                return true;
            }
        };
        this.mErrorListener = new MediaPlayer.OnErrorListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.5
            @Override // android.media.MediaPlayer.OnErrorListener
            public boolean onError(MediaPlayer mp, int framework_err, int impl_err) {
                Log.d(TextureVideoView.LOG_TAG, "Error: " + framework_err + "," + impl_err);
                TextureVideoView.this.mCurrentState = -1;
                TextureVideoView.this.mTargetState = -1;
                if (TextureVideoView.this.mOnErrorListener == null || TextureVideoView.this.mOnErrorListener.onError(TextureVideoView.this.mMediaPlayer, framework_err, impl_err)) {
                }
                return true;
            }
        };
        this.mBufferingUpdateListener = new MediaPlayer.OnBufferingUpdateListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.6
            @Override // android.media.MediaPlayer.OnBufferingUpdateListener
            public void onBufferingUpdate(MediaPlayer mp, int percent) {
                TextureVideoView.this.mCurrentBufferPercentage = percent;
            }
        };
        this.mSurfaceTextureListener = new TextureView.SurfaceTextureListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.7
            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
                TextureVideoView.this.mSurface = new Surface(surface);
                TextureVideoView.this.openVideo();
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
                boolean isValidState = TextureVideoView.this.mTargetState == 3;
                boolean hasValidSize = TextureVideoView.this.mVideoWidth == width && TextureVideoView.this.mVideoHeight == height;
                if (TextureVideoView.this.mMediaPlayer != null && isValidState && hasValidSize) {
                    TextureVideoView.this.start();
                }
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
                if (TextureVideoView.this.mMediaPlayer != null) {
                    TextureVideoView.this.mMediaPlayer.reset();
                    TextureVideoView.this.mMediaPlayer.release();
                    TextureVideoView.this.mMediaPlayer = null;
                }
                if (TextureVideoView.this.mSurface != null) {
                    TextureVideoView.this.mSurface.release();
                    TextureVideoView.this.mSurface = null;
                    return true;
                }
                return true;
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureUpdated(SurfaceTexture surface) {
            }
        };
        this.isSound = true;
        this.mContext = context;
        initVideoView();
        initAttributes(context, attrs, 0);
    }

    public TextureVideoView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mCurrentState = 0;
        this.mTargetState = 0;
        this.focusListener = new FocusListener();
        this.loop = true;
        this.mSizeChangedListener = new MediaPlayer.OnVideoSizeChangedListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.1
            @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
            public void onVideoSizeChanged(MediaPlayer mp, int width, int height) {
                TextureVideoView.this.mVideoWidth = mp.getVideoWidth();
                TextureVideoView.this.mVideoHeight = mp.getVideoHeight();
                if (TextureVideoView.this.mVideoWidth != 0 && TextureVideoView.this.mVideoHeight != 0) {
                    TextureVideoView.this.requestLayout();
                    TextureVideoView.this.initVideo();
                }
            }
        };
        this.mPreparedListener = new MediaPlayer.OnPreparedListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.2
            @Override // android.media.MediaPlayer.OnPreparedListener
            public void onPrepared(MediaPlayer mp) {
                TextureVideoView.this.mCurrentState = 2;
                if (TextureVideoView.this.mOnPreparedListener != null) {
                    TextureVideoView.this.mOnPreparedListener.onPrepared(mp);
                }
                TextureVideoView.this.mVideoWidth = mp.getVideoWidth();
                TextureVideoView.this.mVideoHeight = mp.getVideoHeight();
                TextureVideoView.this.seekTo(1);
                if (TextureVideoView.this.mVideoWidth == 0 || TextureVideoView.this.mVideoHeight == 0) {
                    if (TextureVideoView.this.mTargetState == 3) {
                        TextureVideoView.this.start();
                        return;
                    }
                    return;
                }
                TextureVideoView.this.initVideo();
                if (TextureVideoView.this.mTargetState == 3) {
                    TextureVideoView.this.start();
                }
            }
        };
        this.mCompletionListener = new MediaPlayer.OnCompletionListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.3
            @Override // android.media.MediaPlayer.OnCompletionListener
            public void onCompletion(MediaPlayer mp) {
                TextureVideoView.this.mCurrentState = 5;
                TextureVideoView.this.mTargetState = 5;
                if (TextureVideoView.this.mOCompletionListener != null) {
                    TextureVideoView.this.mOCompletionListener.onCompletion(TextureVideoView.this.mMediaPlayer);
                }
            }
        };
        this.mInfoListener = new MediaPlayer.OnInfoListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.4
            @Override // android.media.MediaPlayer.OnInfoListener
            public boolean onInfo(MediaPlayer mp, int arg1, int arg2) {
                if (TextureVideoView.this.mOnInfoListener != null) {
                    TextureVideoView.this.mOnInfoListener.onInfo(mp, arg1, arg2);
                    return true;
                }
                return true;
            }
        };
        this.mErrorListener = new MediaPlayer.OnErrorListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.5
            @Override // android.media.MediaPlayer.OnErrorListener
            public boolean onError(MediaPlayer mp, int framework_err, int impl_err) {
                Log.d(TextureVideoView.LOG_TAG, "Error: " + framework_err + "," + impl_err);
                TextureVideoView.this.mCurrentState = -1;
                TextureVideoView.this.mTargetState = -1;
                if (TextureVideoView.this.mOnErrorListener == null || TextureVideoView.this.mOnErrorListener.onError(TextureVideoView.this.mMediaPlayer, framework_err, impl_err)) {
                }
                return true;
            }
        };
        this.mBufferingUpdateListener = new MediaPlayer.OnBufferingUpdateListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.6
            @Override // android.media.MediaPlayer.OnBufferingUpdateListener
            public void onBufferingUpdate(MediaPlayer mp, int percent) {
                TextureVideoView.this.mCurrentBufferPercentage = percent;
            }
        };
        this.mSurfaceTextureListener = new TextureView.SurfaceTextureListener() { // from class: com.vk.attachpicker.widget.TextureVideoView.7
            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
                TextureVideoView.this.mSurface = new Surface(surface);
                TextureVideoView.this.openVideo();
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
                boolean isValidState = TextureVideoView.this.mTargetState == 3;
                boolean hasValidSize = TextureVideoView.this.mVideoWidth == width && TextureVideoView.this.mVideoHeight == height;
                if (TextureVideoView.this.mMediaPlayer != null && isValidState && hasValidSize) {
                    TextureVideoView.this.start();
                }
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
                if (TextureVideoView.this.mMediaPlayer != null) {
                    TextureVideoView.this.mMediaPlayer.reset();
                    TextureVideoView.this.mMediaPlayer.release();
                    TextureVideoView.this.mMediaPlayer = null;
                }
                if (TextureVideoView.this.mSurface != null) {
                    TextureVideoView.this.mSurface.release();
                    TextureVideoView.this.mSurface = null;
                    return true;
                }
                return true;
            }

            @Override // android.view.TextureView.SurfaceTextureListener
            public void onSurfaceTextureUpdated(SurfaceTexture surface) {
            }
        };
        this.isSound = true;
        this.mContext = context;
        initVideoView();
        initAttributes(context, attrs, defStyle);
    }

    private void initAttributes(Context context, AttributeSet attrs, int defStyleAttr) {
        setScaleType(ScaleType.FIT_CENTER);
    }

    public void setScaleType(ScaleType scaleType) {
        if (scaleType == null) {
            throw new NullPointerException();
        }
        if (this.mScaleType != scaleType) {
            this.mScaleType = scaleType;
            setWillNotCacheDrawing(this.mScaleType == ScaleType.CENTER);
            requestLayout();
            invalidate();
            initVideo();
        }
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setClassName(VideoView.class.getName());
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName(VideoView.class.getName());
    }

    @Override // android.view.TextureView, android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        initVideo();
    }

    public int resolveAdjustedSize(int desiredSize, int measureSpec) {
        Log.d(LOG_TAG, "Resolve called.");
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        switch (specMode) {
            case Integer.MIN_VALUE:
                int result = Math.min(desiredSize, specSize);
                return result;
            case 0:
                return desiredSize;
            case 1073741824:
                return specSize;
            default:
                return desiredSize;
        }
    }

    public void initVideoView() {
        this.mVideoHeight = 0;
        this.mVideoWidth = 0;
        setFocusable(false);
        setSurfaceTextureListener(this.mSurfaceTextureListener);
        this.mCurrentState = 0;
        this.mTargetState = 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initVideo() {
        switch (this.mScaleType) {
            case FIT_CENTER:
                fitCenter();
                return;
            case CENTER_CROP:
                centerCrop();
                return;
            case MATRIX:
                matrix();
                return;
            case FIT_XY:
                fitXY();
                return;
            case FIT_START:
                fitStart();
                return;
            case FIT_END:
                fitEnd();
                return;
            case CENTER:
                center();
                return;
            case CENTER_INSIDE:
                centerInside();
                return;
            default:
                return;
        }
    }

    private void matrix() {
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX = this.mVideoWidth / viewWidth;
            float mScaleY = this.mVideoHeight / viewHeight;
            mMatrix.setScale(mScaleX, mScaleY);
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void fitXY() {
        try {
            Matrix mMatrix = new Matrix();
            mMatrix.setScale(1.0f, 1.0f);
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void center() {
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX = this.mVideoWidth / viewWidth;
            float mScaleY = this.mVideoHeight / viewHeight;
            float mBoundX = viewWidth - this.mVideoWidth;
            float mBoundY = viewHeight - this.mVideoHeight;
            mMatrix.setScale(mScaleX, mScaleY);
            mMatrix.postTranslate(mBoundX / 2.0f, mBoundY / 2.0f);
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void centerCrop() {
        float mScaleX;
        float mScaleY;
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX2 = this.mVideoWidth / viewWidth;
            float mScaleY2 = this.mVideoHeight / viewHeight;
            float mBoundX = viewWidth - (this.mVideoWidth / mScaleY2);
            float mBoundY = viewHeight - (this.mVideoHeight / mScaleX2);
            if (mScaleX2 < mScaleY2) {
                mScaleY = mScaleY2 * (1.0f / mScaleX2);
                mScaleX = 1.0f;
                mBoundX = 0.0f;
            } else {
                mScaleX = mScaleX2 * (1.0f / mScaleY2);
                mScaleY = 1.0f;
                mBoundY = 0.0f;
            }
            mMatrix.setScale(mScaleX, mScaleY);
            mMatrix.postTranslate(mBoundX / 2.0f, mBoundY / 2.0f);
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void centerInside() {
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX = this.mVideoWidth / viewWidth;
            float mScaleY = this.mVideoHeight / viewHeight;
            if (mScaleX > 1.0f || mScaleY > 1.0f) {
                fitCenter();
            } else {
                float mBoundX = viewWidth - this.mVideoWidth;
                float mBoundY = viewHeight - this.mVideoHeight;
                mMatrix.setScale(mScaleX, mScaleY);
                mMatrix.postTranslate(mBoundX / 2.0f, mBoundY / 2.0f);
                setTransform(mMatrix);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void fitStart() {
        float mScaleX;
        float mScaleY;
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX2 = this.mVideoWidth / viewWidth;
            float mScaleY2 = this.mVideoHeight / viewHeight;
            if (mScaleX2 > mScaleY2) {
                mScaleY = mScaleY2 * (1.0f / mScaleX2);
                mScaleX = 1.0f;
            } else {
                mScaleX = mScaleX2 * (1.0f / mScaleY2);
                mScaleY = 1.0f;
            }
            mMatrix.setScale(mScaleX, mScaleY);
            mMatrix.postTranslate(0.0f / 2.0f, 0.0f / 2.0f);
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void fitCenter() {
        float mScaleX;
        float mScaleY;
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX2 = this.mVideoWidth / viewWidth;
            float mScaleY2 = this.mVideoHeight / viewHeight;
            float mBoundX = viewWidth - (this.mVideoWidth / mScaleY2);
            float mBoundY = viewHeight - (this.mVideoHeight / mScaleX2);
            if (mScaleX2 > mScaleY2) {
                mScaleY = mScaleY2 * (1.0f / mScaleX2);
                mScaleX = 1.0f;
                mBoundX = 0.0f;
            } else {
                mScaleX = mScaleX2 * (1.0f / mScaleY2);
                mScaleY = 1.0f;
                mBoundY = 0.0f;
            }
            mMatrix.setScale(mScaleX, mScaleY);
            mMatrix.postTranslate(mBoundX / 2.0f, mBoundY / 2.0f);
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void fitEnd() {
        float mScaleX;
        float mScaleY;
        try {
            Matrix mMatrix = new Matrix();
            int viewWidth = getWidth();
            int viewHeight = getHeight();
            float mScaleX2 = this.mVideoWidth / viewWidth;
            float mScaleY2 = this.mVideoHeight / viewHeight;
            float mBoundX = viewWidth - (this.mVideoWidth / mScaleY2);
            float mBoundY = viewHeight - (this.mVideoHeight / mScaleX2);
            if (mScaleX2 > mScaleY2) {
                mScaleY = mScaleY2 * (1.0f / mScaleX2);
                mScaleX = 1.0f;
                mBoundX = 0.0f;
            } else {
                mScaleX = mScaleX2 * (1.0f / mScaleY2);
                mScaleY = 1.0f;
                mBoundY = 0.0f;
            }
            mMatrix.setScale(mScaleX, mScaleY);
            mMatrix.postTranslate(mBoundX, mBoundY);
            setTransform(mMatrix);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    public void setVideoPath(String path) {
        if (path != null) {
            setVideoURI(Uri.parse(path));
        }
    }

    public void setVideoURI(Uri pVideoURI) {
        this.uri = pVideoURI;
        openVideo();
        requestLayout();
        invalidate();
    }

    public void stopPlayback() {
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.stop();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
            this.mCurrentState = 0;
            this.mTargetState = 0;
        }
        abandonAudioFocus();
    }

    public void openVideo() {
        if (this.uri != null && this.mSurface != null) {
            Intent intent = new Intent("com.android.music.musicservicecommand");
            intent.putExtra("command", "pause");
            this.mContext.sendBroadcast(intent);
            requestAudioFocus();
            release(false);
            try {
                this.mMediaPlayer = new MediaPlayer();
                if (!this.isSound) {
                    this.mMediaPlayer.setVolume(0.0f, 0.0f);
                } else {
                    this.mMediaPlayer.setVolume(1.0f, 1.0f);
                }
                this.mMediaPlayer.setOnPreparedListener(this.mPreparedListener);
                this.mMediaPlayer.setOnVideoSizeChangedListener(this.mSizeChangedListener);
                this.mMediaPlayer.setOnCompletionListener(this.mCompletionListener);
                this.mMediaPlayer.setOnErrorListener(this.mErrorListener);
                this.mMediaPlayer.setOnInfoListener(this.mInfoListener);
                this.mMediaPlayer.setOnBufferingUpdateListener(this.mBufferingUpdateListener);
                this.mCurrentBufferPercentage = 0;
                this.mMediaPlayer.setDataSource(this.mContext, this.uri);
                this.mMediaPlayer.setSurface(this.mSurface);
                this.mMediaPlayer.setAudioStreamType(3);
                this.mMediaPlayer.setScreenOnWhilePlaying(true);
                this.mMediaPlayer.prepareAsync();
                this.mCurrentState = 1;
            } catch (IOException e) {
                this.mCurrentState = -1;
                this.mTargetState = -1;
                e.printStackTrace();
            } catch (IllegalStateException e2) {
                this.mCurrentState = -1;
                this.mTargetState = -1;
                e2.printStackTrace();
            }
        }
    }

    public boolean isInitialized() {
        return this.mMediaPlayer != null;
    }

    public void setOnPreparedListener(MediaPlayer.OnPreparedListener listener) {
        this.mOnPreparedListener = listener;
    }

    public void setOnCompletionListener(MediaPlayer.OnCompletionListener listener) {
        this.mOCompletionListener = listener;
    }

    public void setOnErrorListener(MediaPlayer.OnErrorListener listener) {
        this.mOnErrorListener = listener;
    }

    public void setOnInfoListener(MediaPlayer.OnInfoListener listener) {
        this.mOnInfoListener = listener;
    }

    private void release(boolean cleartargetstate) {
        if (this.mMediaPlayer != null) {
            this.mMediaPlayer.reset();
            this.mMediaPlayer.release();
            this.mMediaPlayer = null;
            this.mCurrentState = 0;
            if (cleartargetstate) {
                this.mTargetState = 0;
            }
        }
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void start() {
        if (isInPlaybackState()) {
            this.mMediaPlayer.setLooping(this.loop);
            this.mMediaPlayer.start();
            this.mCurrentState = 3;
        }
        this.mTargetState = 3;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void pause() {
        if (isInPlaybackState() && this.mMediaPlayer.isPlaying()) {
            this.mMediaPlayer.pause();
            this.mCurrentState = 4;
        }
        this.mTargetState = 4;
    }

    public void suspend() {
        release(false);
    }

    public void resume() {
        openVideo();
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getDuration() {
        if (isInPlaybackState()) {
            return this.mMediaPlayer.getDuration();
        }
        return -1;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getCurrentPosition() {
        if (isInPlaybackState()) {
            return this.mMediaPlayer.getCurrentPosition();
        }
        return 0;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public void seekTo(int msec) {
        if (isInPlaybackState()) {
            this.mMediaPlayer.seekTo(msec);
        }
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean isPlaying() {
        return isInPlaybackState() && this.mMediaPlayer.isPlaying();
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getBufferPercentage() {
        if (this.mMediaPlayer != null) {
            return this.mCurrentBufferPercentage;
        }
        return 0;
    }

    private boolean isInPlaybackState() {
        return (this.mMediaPlayer == null || this.mCurrentState == -1 || this.mCurrentState == 0 || this.mCurrentState == 1) ? false : true;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canPause() {
        return false;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canSeekBackward() {
        return false;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public boolean canSeekForward() {
        return false;
    }

    @Override // android.widget.MediaController.MediaPlayerControl
    public int getAudioSessionId() {
        return -1;
    }

    @Override // android.view.TextureView, android.view.View
    protected void onVisibilityChanged(View changedView, int visibility) {
        super.onVisibilityChanged(changedView, visibility);
        if ((visibility == 4 || visibility == 8) && isPlaying()) {
            stopPlayback();
        }
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        stopPlayback();
    }

    public void setSound(boolean isSound) {
        this.isSound = isSound;
        if (this.mMediaPlayer != null) {
            if (!isSound) {
                this.mMediaPlayer.setVolume(0.0f, 0.0f);
            } else {
                this.mMediaPlayer.setVolume(1.0f, 1.0f);
            }
        }
    }

    public boolean isLoop() {
        return this.loop;
    }

    public void setLoop(boolean loop) {
        this.loop = loop;
    }

    public int getVideoWidth() {
        return this.mVideoWidth;
    }

    public int getVideoHeight() {
        return this.mVideoHeight;
    }

    private void requestAudioFocus() {
        int result = Utils.getAudioManager(getContext()).requestAudioFocus(this.focusListener, 3, 1);
        if (result == 1) {
            this.focusListener.onAudioFocusChange(1);
        } else {
            this.focusListener.onAudioFocusChange(-1);
        }
    }

    private void abandonAudioFocus() {
        Utils.getAudioManager(getContext()).abandonAudioFocus(this.focusListener);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class FocusListener implements AudioManager.OnAudioFocusChangeListener {
        private FocusListener() {
        }

        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public void onAudioFocusChange(int focusChange) {
            switch (focusChange) {
                case -2:
                case -1:
                    MediaPlayer player = TextureVideoView.this.mMediaPlayer;
                    if (player != null) {
                        player.setVolume(0.0f, 0.0f);
                        return;
                    }
                    return;
                case 0:
                default:
                    return;
                case 1:
                    ViewUtils.postDelayed(TextureVideoView$FocusListener$$Lambda$1.lambdaFactory$(this), 1500L);
                    return;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onAudioFocusChange$0() {
            float f = 1.0f;
            MediaPlayer player = TextureVideoView.this.mMediaPlayer;
            if (player != null) {
                float f2 = TextureVideoView.this.isSound ? 1.0f : 0.0f;
                if (!TextureVideoView.this.isSound) {
                    f = 0.0f;
                }
                player.setVolume(f2, f);
            }
        }
    }
}
