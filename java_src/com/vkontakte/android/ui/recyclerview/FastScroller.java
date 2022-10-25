package com.vkontakte.android.ui.recyclerview;

import android.animation.Animator;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.internal.view.SupportMenu;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;
import com.vkontakte.android.R;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class FastScroller extends View {
    private static final int TRACK_SNAP_RANGE = 5;
    private Drawable mHandle;
    private RecyclerView mList;
    private TextView mPopup;
    private boolean mPopupShown;
    private RecyclerView.OnScrollListener mScrollListener;
    private boolean mScrollLocked;
    private int mScrollOffset;
    @ColorInt
    private int mTrackColor;
    private Paint mTrackPaint;
    private int mTrackWidth;

    /* loaded from: classes3.dex */
    public interface Provider {
        CharSequence getPopupText(int i);
    }

    public FastScroller(Context context) {
        super(context);
        this.mTrackColor = SupportMenu.CATEGORY_MASK;
        this.mTrackWidth = V.dp(1.0f);
        this.mHandle = null;
        this.mScrollOffset = 0;
        this.mScrollListener = new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.recyclerview.FastScroller.1
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                int position;
                if (!FastScroller.this.mScrollLocked && FastScroller.this.getHeight() > 0) {
                    int itemCount = recyclerView.mo1204getAdapter().getItemCount();
                    int visibleRange = recyclerView.getChildCount();
                    int firstVisiblePosition = recyclerView.getChildAdapterPosition(recyclerView.getChildAt(0));
                    int lastVisiblePosition = firstVisiblePosition + visibleRange;
                    if (firstVisiblePosition == 0) {
                        position = 0;
                    } else if (lastVisiblePosition >= itemCount) {
                        position = itemCount;
                    } else {
                        position = firstVisiblePosition;
                    }
                    float proportion = position / itemCount;
                    FastScroller.this.setPosition(FastScroller.this.getHeight() * proportion);
                }
            }
        };
        init(context, null);
    }

    public FastScroller(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTrackColor = SupportMenu.CATEGORY_MASK;
        this.mTrackWidth = V.dp(1.0f);
        this.mHandle = null;
        this.mScrollOffset = 0;
        this.mScrollListener = new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.recyclerview.FastScroller.1
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                int position;
                if (!FastScroller.this.mScrollLocked && FastScroller.this.getHeight() > 0) {
                    int itemCount = recyclerView.mo1204getAdapter().getItemCount();
                    int visibleRange = recyclerView.getChildCount();
                    int firstVisiblePosition = recyclerView.getChildAdapterPosition(recyclerView.getChildAt(0));
                    int lastVisiblePosition = firstVisiblePosition + visibleRange;
                    if (firstVisiblePosition == 0) {
                        position = 0;
                    } else if (lastVisiblePosition >= itemCount) {
                        position = itemCount;
                    } else {
                        position = firstVisiblePosition;
                    }
                    float proportion = position / itemCount;
                    FastScroller.this.setPosition(FastScroller.this.getHeight() * proportion);
                }
            }
        };
        init(context, attrs);
    }

    public FastScroller(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mTrackColor = SupportMenu.CATEGORY_MASK;
        this.mTrackWidth = V.dp(1.0f);
        this.mHandle = null;
        this.mScrollOffset = 0;
        this.mScrollListener = new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.recyclerview.FastScroller.1
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                int position;
                if (!FastScroller.this.mScrollLocked && FastScroller.this.getHeight() > 0) {
                    int itemCount = recyclerView.mo1204getAdapter().getItemCount();
                    int visibleRange = recyclerView.getChildCount();
                    int firstVisiblePosition = recyclerView.getChildAdapterPosition(recyclerView.getChildAt(0));
                    int lastVisiblePosition = firstVisiblePosition + visibleRange;
                    if (firstVisiblePosition == 0) {
                        position = 0;
                    } else if (lastVisiblePosition >= itemCount) {
                        position = itemCount;
                    } else {
                        position = firstVisiblePosition;
                    }
                    float proportion = position / itemCount;
                    FastScroller.this.setPosition(FastScroller.this.getHeight() * proportion);
                }
            }
        };
        init(context, attrs);
    }

    @TargetApi(21)
    public FastScroller(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mTrackColor = SupportMenu.CATEGORY_MASK;
        this.mTrackWidth = V.dp(1.0f);
        this.mHandle = null;
        this.mScrollOffset = 0;
        this.mScrollListener = new RecyclerView.OnScrollListener() { // from class: com.vkontakte.android.ui.recyclerview.FastScroller.1
            @Override // android.support.v7.widget.RecyclerView.OnScrollListener
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                int position;
                if (!FastScroller.this.mScrollLocked && FastScroller.this.getHeight() > 0) {
                    int itemCount = recyclerView.mo1204getAdapter().getItemCount();
                    int visibleRange = recyclerView.getChildCount();
                    int firstVisiblePosition = recyclerView.getChildAdapterPosition(recyclerView.getChildAt(0));
                    int lastVisiblePosition = firstVisiblePosition + visibleRange;
                    if (firstVisiblePosition == 0) {
                        position = 0;
                    } else if (lastVisiblePosition >= itemCount) {
                        position = itemCount;
                    } else {
                        position = firstVisiblePosition;
                    }
                    float proportion = position / itemCount;
                    FastScroller.this.setPosition(FastScroller.this.getHeight() * proportion);
                }
            }
        };
        init(context, attrs);
    }

    private void init(Context context, @Nullable AttributeSet attrs) {
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.FastScroller);
        this.mTrackColor = a.getColor(1, this.mTrackColor);
        this.mTrackWidth = a.getDimensionPixelSize(0, this.mTrackWidth);
        this.mHandle = a.getDrawable(2);
        if (this.mHandle == null) {
            this.mHandle = context.getResources().getDrawable(R.drawable.fastscroller_section_indicator);
        }
        this.mHandle.setCallback(this);
        a.recycle();
        this.mTrackPaint = new Paint(5);
        this.mTrackPaint.setColor(this.mTrackColor);
    }

    public void setup(RecyclerView list, TextView popup) {
        this.mList = list;
        this.mPopup = popup;
        this.mPopup.setVisibility(8);
        list.addOnScrollListener(this.mScrollListener);
    }

    @Override // android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mHandle != null && this.mHandle.isStateful()) {
            this.mHandle.setState(getDrawableState());
        }
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || who == this.mHandle;
    }

    @Override // android.view.View
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        if (this.mHandle != null) {
            this.mHandle.jumpToCurrentState();
        }
    }

    @Override // android.view.View
    @TargetApi(21)
    public void drawableHotspotChanged(float x, float y) {
        super.drawableHotspotChanged(x, y);
        if (this.mHandle != null) {
            this.mHandle.setHotspot(x, y);
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        int width = getWidth();
        drawTrack(canvas, width);
        drawHandle(canvas, width);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // android.view.View
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        int action = event.getAction();
        switch (action) {
            case 0:
                showPopup();
                setPressed(true);
                this.mScrollLocked = true;
                break;
            case 1:
            case 3:
                hidePopup();
                setPressed(false);
                this.mScrollLocked = false;
                return true;
            case 2:
                break;
            default:
                return super.onTouchEvent(event);
        }
        setPosition(event.getY() - getTop());
        setRecyclerViewPosition(event.getY() - getTop());
        return true;
    }

    private void setRecyclerViewPosition(float y) {
        int itemCount;
        float proportion;
        if (this.mList != null && (itemCount = this.mList.mo1204getAdapter().getItemCount()) != 0) {
            if (this.mScrollOffset == 0) {
                proportion = 0.0f;
            } else if (this.mScrollOffset + this.mHandle.getIntrinsicHeight() >= getHeight() - 5) {
                proportion = 1.0f;
            } else {
                proportion = y / getHeight();
            }
            int targetPos = limit(0, itemCount - 1, (int) (itemCount * proportion));
            this.mList.scrollToPosition(targetPos);
            Provider segmenter = (Provider) this.mList.mo1204getAdapter();
            this.mPopup.setText(segmenter.getPopupText(targetPos));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setPosition(float y) {
        int bubbleHeight = this.mPopup.getHeight();
        int handleHeight = this.mHandle.getIntrinsicHeight();
        this.mScrollOffset = limit(0, getHeight() - handleHeight, (int) (y - (handleHeight / 2)));
        this.mPopup.setTranslationY(limit(0, (getHeight() - bubbleHeight) - (handleHeight / 2), (int) (y - bubbleHeight)));
        invalidate();
    }

    private static int limit(int min, int max, int value) {
        return Math.min(Math.max(min, value), max);
    }

    private void showPopup() {
        if (!this.mPopupShown) {
            this.mPopupShown = true;
            this.mPopup.animate().alpha(1.0f).setListener(new Animator.AnimatorListener() { // from class: com.vkontakte.android.ui.recyclerview.FastScroller.2
                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation) {
                    FastScroller.this.mPopup.setVisibility(0);
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationRepeat(Animator animation) {
                }
            }).setDuration(400L).start();
        }
    }

    private void hidePopup() {
        if (this.mPopupShown) {
            this.mPopupShown = false;
            this.mPopup.animate().alpha(0.0f).setListener(new Animator.AnimatorListener() { // from class: com.vkontakte.android.ui.recyclerview.FastScroller.3
                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationStart(Animator animation) {
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    FastScroller.this.mPopup.setVisibility(8);
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationCancel(Animator animation) {
                    FastScroller.this.mPopup.setVisibility(8);
                }

                @Override // android.animation.Animator.AnimatorListener
                public void onAnimationRepeat(Animator animation) {
                }
            }).setDuration(400L).start();
        }
    }

    private void drawHandle(Canvas canvas, int width) {
        int drawableWidth = this.mHandle.getIntrinsicWidth();
        int drawableHeight = this.mHandle.getIntrinsicHeight();
        int left = (width - drawableWidth) >> 1;
        int top = this.mScrollOffset;
        int right = left + drawableWidth;
        int bottom = top + drawableHeight;
        this.mHandle.setBounds(left, top, right, bottom);
        this.mHandle.draw(canvas);
    }

    private void drawTrack(Canvas canvas, int width) {
        int left = (width - this.mTrackWidth) >> 1;
        int right = left + this.mTrackWidth;
        int bottom = getHeight();
        canvas.drawRect(left, 0.0f, right, bottom, this.mTrackPaint);
    }
}
