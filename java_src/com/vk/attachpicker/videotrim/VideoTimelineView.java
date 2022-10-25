package com.vk.attachpicker.videotrim;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.MediaMetadataRetriever;
import android.os.AsyncTask;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.Iterator;
@TargetApi(10)
/* loaded from: classes2.dex */
public class VideoTimelineView extends View {
    private static final String TAG = "timeline";
    private AsyncTask<Integer, Integer, Bitmap> currentTask;
    private VideoTimelineViewDelegate delegate;
    private int frameHeight;
    private long frameTimeOffset;
    private int frameWidth;
    private ArrayList<Bitmap> frames;
    private int framesToLoad;
    private MediaMetadataRetriever mediaMetadataRetriever;
    private float minDelta;
    private Paint paint;
    private Paint paint2;
    private Drawable pickDrawable;
    private float pressDx;
    private boolean pressedCenter;
    private boolean pressedLeft;
    private boolean pressedRight;
    private float progress;
    private float progressLeft;
    private float progressRight;
    private Drawable selectedZoneDrawable;
    private long videoLength;
    private static final int TIMELINE_HEIGHT = Screen.dp(48);
    private static final int FRAME_HEIGHT = Screen.dp(44);
    private static final int HOR_OFFSET = Screen.dp(16);
    private static final int SELECTOR_HEIGHT = Screen.dp(66);
    private static final int SELECTOR_WIDTH = Screen.dp(12);
    private static final Object sync = new Object();

    /* loaded from: classes2.dex */
    public interface VideoTimelineViewDelegate {
        void onLeftProgressChanged(float f);

        void onRightProgressChanged(float f);

        void onSeekBarDrag(float f);
    }

    private void init(Context context) {
        this.paint = new Paint();
        this.paint.setColor(-10038802);
        this.paint2 = new Paint();
        this.paint2.setColor(-855638017);
        this.pickDrawable = ContextCompat.getDrawable(context, R.drawable.picker_ic_trimming_thumb);
        this.selectedZoneDrawable = ContextCompat.getDrawable(context, R.drawable.picker_bg_trimming_zone);
    }

    public VideoTimelineView(Context context) {
        super(context);
        this.videoLength = 0L;
        this.progressLeft = 0.0f;
        this.progressRight = 1.0f;
        this.pressedLeft = false;
        this.pressedRight = false;
        this.pressedCenter = false;
        this.pressDx = 0.0f;
        this.mediaMetadataRetriever = null;
        this.delegate = null;
        this.frames = new ArrayList<>();
        this.currentTask = null;
        this.frameTimeOffset = 0L;
        this.frameWidth = 0;
        this.frameHeight = 0;
        this.framesToLoad = 0;
        this.progress = 0.0f;
        this.minDelta = 0.0f;
        init(context);
    }

    public VideoTimelineView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.videoLength = 0L;
        this.progressLeft = 0.0f;
        this.progressRight = 1.0f;
        this.pressedLeft = false;
        this.pressedRight = false;
        this.pressedCenter = false;
        this.pressDx = 0.0f;
        this.mediaMetadataRetriever = null;
        this.delegate = null;
        this.frames = new ArrayList<>();
        this.currentTask = null;
        this.frameTimeOffset = 0L;
        this.frameWidth = 0;
        this.frameHeight = 0;
        this.framesToLoad = 0;
        this.progress = 0.0f;
        this.minDelta = 0.0f;
        init(context);
    }

    public VideoTimelineView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.videoLength = 0L;
        this.progressLeft = 0.0f;
        this.progressRight = 1.0f;
        this.pressedLeft = false;
        this.pressedRight = false;
        this.pressedCenter = false;
        this.pressDx = 0.0f;
        this.mediaMetadataRetriever = null;
        this.delegate = null;
        this.frames = new ArrayList<>();
        this.currentTask = null;
        this.frameTimeOffset = 0L;
        this.frameWidth = 0;
        this.frameHeight = 0;
        this.framesToLoad = 0;
        this.progress = 0.0f;
        this.minDelta = 0.0f;
        init(context);
    }

    public float getLeftProgress() {
        return this.progressLeft;
    }

    public float getRightProgress() {
        return this.progressRight;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        clearFrames();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (event == null) {
            return false;
        }
        float x = event.getX();
        float y = event.getY();
        int width = getMeasuredWidth() - Screen.dp(32);
        int startX = ((int) (width * this.progressLeft)) + Screen.dp(16);
        int endX = ((int) (width * this.progressRight)) + Screen.dp(16);
        int centerX = ((int) (width * this.progress)) + Screen.dp(16);
        int intMinDelta = Math.max((int) (width * this.minDelta), SELECTOR_WIDTH * 2);
        if (event.getAction() == 0) {
            int additionWidth = Screen.dp(18);
            if (centerX - additionWidth <= x && x <= centerX + additionWidth && y >= 0.0f && y <= (getMeasuredHeight() / 2) - (TIMELINE_HEIGHT / 2)) {
                this.pressedCenter = true;
                this.pressDx = (int) (x - centerX);
                getParent().requestDisallowInterceptTouchEvent(true);
                invalidate();
                return true;
            } else if (startX - additionWidth <= x && x <= startX + additionWidth && y >= 0.0f && y <= getMeasuredHeight()) {
                this.pressedLeft = true;
                this.pressDx = (int) (x - startX);
                getParent().requestDisallowInterceptTouchEvent(true);
                invalidate();
                return true;
            } else if (endX - additionWidth > x || x > endX + additionWidth || y < 0.0f || y > getMeasuredHeight()) {
                return false;
            } else {
                this.pressedRight = true;
                this.pressDx = (int) (x - endX);
                getParent().requestDisallowInterceptTouchEvent(true);
                invalidate();
                return true;
            }
        } else if (event.getAction() == 1 || event.getAction() == 3) {
            this.pressedLeft = false;
            this.pressedRight = false;
            this.pressedCenter = false;
            return true;
        } else if (event.getAction() != 2) {
            return false;
        } else {
            if (this.pressedLeft) {
                int startX2 = (int) (x - this.pressDx);
                if (startX2 < HOR_OFFSET) {
                    startX2 = HOR_OFFSET;
                } else if (startX2 > endX - intMinDelta) {
                    startX2 = Math.max(endX - intMinDelta, HOR_OFFSET);
                }
                this.progressLeft = (startX2 - HOR_OFFSET) / width;
                if (this.delegate != null) {
                    this.delegate.onLeftProgressChanged(this.progressLeft);
                }
                invalidate();
                return true;
            } else if (this.pressedRight) {
                int endX2 = (int) (x - this.pressDx);
                if (endX2 < startX + intMinDelta) {
                    endX2 = Math.min(startX + intMinDelta, HOR_OFFSET + width);
                } else if (endX2 > HOR_OFFSET + width) {
                    endX2 = width + HOR_OFFSET;
                }
                this.progressRight = (endX2 - HOR_OFFSET) / width;
                if (this.delegate != null) {
                    this.delegate.onRightProgressChanged(this.progressRight);
                }
                invalidate();
                return true;
            } else if (!this.pressedCenter) {
                return false;
            } else {
                int centerX2 = (int) (x - this.pressDx);
                if (centerX2 < startX) {
                    centerX2 = startX;
                } else if (centerX2 > endX) {
                    centerX2 = endX;
                } else if (centerX2 < HOR_OFFSET) {
                    centerX2 = HOR_OFFSET;
                } else if (centerX2 > HOR_OFFSET + width) {
                    centerX2 = width + HOR_OFFSET;
                }
                this.progress = (centerX2 - HOR_OFFSET) / width;
                if (this.delegate != null) {
                    this.delegate.onSeekBarDrag(this.progress);
                }
                invalidate();
                return true;
            }
        }
    }

    public void setDuration(int duration) {
        this.minDelta = 1000.0f / duration;
    }

    public void setVideoPath(String path) {
        this.mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            this.mediaMetadataRetriever.setDataSource(path);
            String duration = this.mediaMetadataRetriever.extractMetadata(9);
            this.videoLength = Long.parseLong(duration);
        } catch (Exception e) {
            L.e(e, TAG);
        }
    }

    public void setDelegate(VideoTimelineViewDelegate delegate) {
        this.delegate = delegate;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void reloadFrames(int frameNum) {
        if (this.mediaMetadataRetriever != null) {
            if (frameNum == 0) {
                this.frameHeight = FRAME_HEIGHT;
                this.framesToLoad = (getMeasuredWidth() - Screen.dp(16)) / this.frameHeight;
                this.frameWidth = (int) Math.ceil((getMeasuredWidth() - Screen.dp(16)) / this.framesToLoad);
                this.frameTimeOffset = this.videoLength / this.framesToLoad;
            }
            this.currentTask = new AsyncTask<Integer, Integer, Bitmap>() { // from class: com.vk.attachpicker.videotrim.VideoTimelineView.1
                private int frameNum = 0;

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public Bitmap doInBackground(Integer... objects) {
                    this.frameNum = objects[0].intValue();
                    Bitmap bitmap = null;
                    if (!isCancelled()) {
                        try {
                            bitmap = VideoTimelineView.this.mediaMetadataRetriever.getFrameAtTime(VideoTimelineView.this.frameTimeOffset * this.frameNum * 1000);
                        } catch (Exception e) {
                            L.e(e, VideoTimelineView.TAG);
                        }
                        if (isCancelled()) {
                            return null;
                        }
                        if (bitmap != null) {
                            Bitmap result = Bitmap.createBitmap(VideoTimelineView.this.frameWidth, VideoTimelineView.this.frameHeight, bitmap.getConfig());
                            Canvas canvas = new Canvas(result);
                            float scaleX = VideoTimelineView.this.frameWidth / bitmap.getWidth();
                            float scaleY = VideoTimelineView.this.frameHeight / bitmap.getHeight();
                            float scale = scaleX > scaleY ? scaleX : scaleY;
                            int w = (int) (bitmap.getWidth() * scale);
                            int h = (int) (bitmap.getHeight() * scale);
                            Rect srcRect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
                            Rect destRect = new Rect((VideoTimelineView.this.frameWidth - w) / 2, (VideoTimelineView.this.frameHeight - h) / 2, w, h);
                            canvas.drawBitmap(bitmap, srcRect, destRect, (Paint) null);
                            bitmap.recycle();
                            bitmap = result;
                        }
                        return bitmap;
                    }
                    return null;
                }

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // android.os.AsyncTask
                public void onPostExecute(Bitmap bitmap) {
                    if (!isCancelled()) {
                        VideoTimelineView.this.frames.add(bitmap);
                        VideoTimelineView.this.invalidate();
                        if (this.frameNum < VideoTimelineView.this.framesToLoad) {
                            VideoTimelineView.this.reloadFrames(this.frameNum + 1);
                        }
                    }
                }
            };
            this.currentTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, Integer.valueOf(frameNum), null, null);
        }
    }

    public void destroy() {
        synchronized (sync) {
            try {
                if (this.mediaMetadataRetriever != null) {
                    this.mediaMetadataRetriever.release();
                    this.mediaMetadataRetriever = null;
                }
            } catch (Exception e) {
                L.e(e, TAG);
            }
        }
        Iterator<Bitmap> it = this.frames.iterator();
        while (it.hasNext()) {
            Bitmap bitmap = it.next();
            if (bitmap != null) {
                bitmap.recycle();
            }
        }
        this.frames.clear();
        if (this.currentTask != null) {
            this.currentTask.cancel(true);
            this.currentTask = null;
        }
    }

    public void clearFrames() {
        Iterator<Bitmap> it = this.frames.iterator();
        while (it.hasNext()) {
            Bitmap bitmap = it.next();
            if (bitmap != null) {
                bitmap.recycle();
            }
        }
        this.frames.clear();
        if (this.currentTask != null) {
            this.currentTask.cancel(true);
            this.currentTask = null;
        }
        invalidate();
    }

    public float getProgress() {
        return this.progress;
    }

    public void setProgress(float progress) {
        if (progress < this.progressLeft) {
            progress = this.progressLeft;
        } else if (progress > this.progressRight) {
            progress = this.progressRight;
        }
        this.progress = progress;
        invalidate();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        int width = getMeasuredWidth() - (HOR_OFFSET * 2);
        int startX = ((int) (width * this.progressLeft)) + HOR_OFFSET;
        int endX = ((int) (width * this.progressRight)) + HOR_OFFSET;
        int centerX = ((int) (width * this.progress)) + HOR_OFFSET;
        if (centerX > endX - SELECTOR_WIDTH) {
            centerX = endX - SELECTOR_WIDTH;
        }
        int frameY = (canvas.getHeight() / 2) - (FRAME_HEIGHT / 2);
        canvas.save();
        canvas.clipRect(HOR_OFFSET, frameY, HOR_OFFSET + width, FRAME_HEIGHT + frameY);
        if (this.frames.isEmpty() && this.currentTask == null) {
            reloadFrames(0);
        } else {
            int offset = 0;
            Iterator<Bitmap> it = this.frames.iterator();
            while (it.hasNext()) {
                Bitmap bitmap = it.next();
                if (bitmap != null) {
                    canvas.drawBitmap(bitmap, Screen.dp(16) + (this.frameWidth * offset), frameY, (Paint) null);
                }
                offset++;
            }
        }
        canvas.drawRect(HOR_OFFSET, frameY, startX, FRAME_HEIGHT + frameY, this.paint2);
        canvas.drawRect(endX, frameY, HOR_OFFSET + width, FRAME_HEIGHT + frameY, this.paint2);
        canvas.restore();
        int selectorY = ((canvas.getHeight() / 2) - (SELECTOR_HEIGHT / 2)) - Screen.dp(11);
        this.pickDrawable.setBounds(centerX, selectorY, SELECTOR_WIDTH + centerX, SELECTOR_HEIGHT + selectorY);
        this.pickDrawable.draw(canvas);
        int selectionY = (canvas.getHeight() / 2) - (TIMELINE_HEIGHT / 2);
        this.selectedZoneDrawable.setBounds(startX, selectionY, endX, TIMELINE_HEIGHT + selectionY);
        this.selectedZoneDrawable.draw(canvas);
    }
}
