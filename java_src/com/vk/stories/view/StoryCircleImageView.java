package com.vk.stories.view;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.util.Property;
import com.facebook.drawee.generic.GenericDraweeHierarchyBuilder;
import com.vk.core.util.AnimationUtils;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKCircleImageView;
import com.vk.stories.model.StoriesContainer;
import com.vk.stories.model.StoryEntry;
import com.vkontakte.android.R;
import java.util.HashSet;
/* loaded from: classes2.dex */
public class StoryCircleImageView extends VKCircleImageView {
    private ObjectAnimator animator;
    private Bitmap borderBitmap;
    private final RectF dst;
    private Drawable failBorderDrawable;
    private boolean hasNewStories;
    private final Matrix m;
    private final RectF oval;
    private Paint paint;
    private float selectionAmount;
    private final RectF src;
    private boolean uploadFailed;
    public static final Property<StoryCircleImageView, Float> BORDER_DEGREES = new Property<StoryCircleImageView, Float>(Float.class, "borderDegrees") { // from class: com.vk.stories.view.StoryCircleImageView.1
        @Override // android.util.Property
        public void set(StoryCircleImageView object, Float value) {
            object.setSelectionAmount(value.floatValue());
        }

        @Override // android.util.Property
        public Float get(StoryCircleImageView object) {
            return Float.valueOf(object.getSelectionAmount());
        }
    };
    private static final int BORDER = Screen.dp(2);
    private static final HashSet<Integer> animatedUploadIds = new HashSet<>();

    public StoryCircleImageView(Context context) {
        super(context);
        this.paint = new Paint(1);
        this.m = new Matrix();
        this.src = new RectF();
        this.dst = new RectF();
        this.oval = new RectF();
        this.selectionAmount = 1.0f;
        init();
    }

    public StoryCircleImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.paint = new Paint(1);
        this.m = new Matrix();
        this.src = new RectF();
        this.dst = new RectF();
        this.oval = new RectF();
        this.selectionAmount = 1.0f;
        init();
    }

    public StoryCircleImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.paint = new Paint(1);
        this.m = new Matrix();
        this.src = new RectF();
        this.dst = new RectF();
        this.oval = new RectF();
        this.selectionAmount = 1.0f;
        init();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vk.imageloader.view.VKCircleImageView, com.vk.imageloader.view.VKImageView, com.vk.imageloader.view.GenericVKImageView
    public void buildHierarchy(GenericDraweeHierarchyBuilder builder) {
        super.buildHierarchy(builder);
        builder.setDesiredAspectRatio(1.0f);
    }

    private void init() {
        int b2 = BORDER * 2;
        setPadding(b2, b2, b2, b2);
        this.failBorderDrawable = ContextCompat.getDrawable(getContext(), R.drawable.bg_stores_failed_border);
        this.borderBitmap = BitmapFactory.decodeResource(getResources(), R.drawable.bg_stores_unread_border);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.failBorderDrawable.setBounds(0, 0, w, h);
        this.src.set(0.0f, 0.0f, this.borderBitmap.getWidth(), this.borderBitmap.getHeight());
        this.dst.set(0.0f, 0.0f, w, h);
        this.m.setRectToRect(this.src, this.dst, Matrix.ScaleToFit.CENTER);
        Shader shader = new BitmapShader(this.borderBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        shader.setLocalMatrix(this.m);
        this.paint.setShader(shader);
        this.m.mapRect(this.oval, this.src);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.uploadFailed) {
            this.failBorderDrawable.draw(canvas);
        } else if (this.hasNewStories) {
            canvas.drawArc(this.oval, -90.0f, this.selectionAmount * 360.0f, true, this.paint);
        }
    }

    public void setStoryContainer(StoriesContainer container) {
        boolean z = false;
        boolean myStory = container.myStory();
        if (container != null) {
            if (myStory) {
                if (container.hasValidStories()) {
                    if (container.getAuthorAvatarUrl() != null) {
                        load(container.getAuthorAvatarUrl());
                    } else {
                        clear();
                    }
                    if (container.hasFailedUploads()) {
                        setUploadFailed(true);
                        setHasNewStories(false, false);
                        return;
                    }
                    setUploadFailed(false);
                    if (container.hasNewStories()) {
                        StoryEntry lastUploadStory = container.getLastLocalStory();
                        if (lastUploadStory != null) {
                            if (!animatedUploadIds.contains(Integer.valueOf(lastUploadStory.id))) {
                                z = true;
                            }
                            setHasNewStories(true, z);
                            animatedUploadIds.add(Integer.valueOf(lastUploadStory.id));
                            return;
                        }
                        setHasNewStories(true, false);
                        return;
                    }
                    setHasNewStories(false, false);
                    return;
                }
                clear();
                setUploadFailed(false);
                setHasNewStories(false, false);
                return;
            }
            setUploadFailed(false);
            setHasNewStories(container.hasNewStories(), false);
            if (container.getAuthorAvatarUrl() != null) {
                load(container.getAuthorAvatarUrl());
                return;
            } else {
                clear();
                return;
            }
        }
        clear();
        setHasNewStories(false, false);
        setUploadFailed(false);
    }

    private void setHasNewStories(boolean hasNewStories, boolean animate) {
        cancelCurrentAnimator();
        this.hasNewStories = hasNewStories;
        if (!animate) {
            setSelectionAmount(1.0f);
        } else {
            startBorderAnimator();
        }
    }

    private void setUploadFailed(boolean uploadFailed) {
        this.uploadFailed = uploadFailed;
        invalidate();
    }

    public float getSelectionAmount() {
        return this.selectionAmount;
    }

    public void setSelectionAmount(float selectionAmount) {
        this.selectionAmount = selectionAmount;
        invalidate();
    }

    private void startBorderAnimator() {
        setSelectionAmount(0.0f);
        this.animator = ObjectAnimator.ofFloat(this, BORDER_DEGREES, 0.0f, 1.0f);
        this.animator.setInterpolator(AnimationUtils.decelerateInterpolator2);
        this.animator.setDuration(600L);
        this.animator.setStartDelay(800L);
        this.animator.start();
    }

    private void cancelCurrentAnimator() {
        if (this.animator != null) {
            this.animator.cancel();
            this.animator = null;
        }
    }
}
