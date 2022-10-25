package com.vkontakte.android.ui.recyclerview;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.annotation.ColorInt;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.util.SparseIntArray;
import android.view.View;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ui.cardview.CardDrawable;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class CardItemDecoration extends RecyclerView.ItemDecoration {
    public static final int BACKGROUND_COLOR = -1315344;
    private int mBackgroundPaddingBottom;
    private int mBackgroundPaddingLeft;
    private int mBackgroundPaddingRight;
    private int mBackgroundPaddingTop;
    private final CardDrawable mCardBackground;
    private int mCardsSpacing;
    private boolean mFullSize;
    private int mPaddingBottom;
    private int mPaddingLeft;
    private int mPaddingRight;
    private int mPaddingTop;
    @Nullable
    private Provider mProvider;
    private boolean mClipToPadding = true;
    private boolean mBuildAdapterToChildProjection = true;
    private SparseIntArray mAdapterToChildPosition = new SparseIntArray();
    private final Paint mBackgroundPaint = new Paint();

    /* loaded from: classes3.dex */
    public interface Provider {
        public static final int BOTTOM = 4;
        public static final int LEFT = 8;
        public static final int MIDDLE = 1;
        public static final int NONE = 0;
        public static final int RIGHT = 16;
        public static final int TOP = 2;

        int getBlockType(int i);
    }

    public CardItemDecoration(@Nullable Provider provider, boolean fullWidth) {
        this.mFullSize = fullWidth;
        this.mCardBackground = new CardDrawable(VKApplication.context.getResources(), -1, V.dp(2.0f), fullWidth);
        this.mBackgroundPaint.setColor(-1315344);
        this.mProvider = provider;
        Rect padding = new Rect();
        this.mCardBackground.getPadding(padding);
        this.mBackgroundPaddingLeft = padding.left;
        this.mBackgroundPaddingTop = padding.top;
        this.mBackgroundPaddingRight = padding.right;
        this.mBackgroundPaddingBottom = padding.bottom;
    }

    public CardItemDecoration setProvider(@Nullable Provider provider) {
        this.mProvider = provider;
        return this;
    }

    public CardItemDecoration setBackgroundColor(@ColorInt int color) {
        this.mBackgroundPaint.setColor(color);
        return this;
    }

    public float getShadowSize() {
        return this.mCardBackground.getShadowSize();
    }

    public CardItemDecoration clipToPadding(boolean clipToPadding) {
        this.mClipToPadding = clipToPadding;
        return this;
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void onDraw(Canvas c, RecyclerView parent, RecyclerView.State state) {
        int leftDefault;
        int rightDefault;
        if (parent != null) {
            if (this.mProvider == null) {
                int left = (parent.getPaddingLeft() - this.mBackgroundPaddingLeft) - this.mPaddingLeft;
                int top = (parent.getPaddingTop() - this.mCardBackground.getRadius()) - this.mPaddingTop;
                int right = (parent.getWidth() - parent.getPaddingRight()) + this.mBackgroundPaddingRight + this.mPaddingRight;
                int bottom = (parent.getHeight() - parent.getPaddingBottom()) + this.mCardBackground.getRadius() + this.mPaddingBottom;
                drawBackground(c, parent, left, top, right, bottom, 0, 0);
                return;
            }
            parent.getLayoutManager();
            if (this.mFullSize) {
                leftDefault = 0;
            } else {
                leftDefault = this.mClipToPadding ? (parent.getPaddingLeft() - this.mBackgroundPaddingLeft) - this.mPaddingLeft : Integer.MAX_VALUE;
            }
            if (this.mFullSize) {
                rightDefault = parent.getWidth();
            } else {
                rightDefault = this.mClipToPadding ? (parent.getWidth() - parent.getPaddingRight()) + this.mBackgroundPaddingRight + this.mPaddingRight : Integer.MIN_VALUE;
            }
            int top2 = 0;
            int bottom2 = 0;
            int topExtra = 0;
            int bottomExtra = this.mCardsSpacing;
            int left2 = leftDefault;
            int right2 = rightDefault;
            boolean wasTop = false;
            boolean wasBottom = false;
            boolean draw = false;
            int start = this.mBuildAdapterToChildProjection ? RecyclerViewUtils.getRealFirstPosition(parent) : 0;
            int viewEnd = this.mBuildAdapterToChildProjection ? RecyclerViewUtils.mapAdapterToChildPositions(parent, this.mAdapterToChildPosition, start) : parent.getChildCount() - 1;
            int adapterEnd = parent.mo1204getAdapter().getItemCount() - 1;
            for (int position = start; position <= viewEnd; position++) {
                int viewPosition = this.mBuildAdapterToChildProjection ? this.mAdapterToChildPosition.get(position, -1) : position;
                if (viewPosition != -1) {
                    View child = parent.getChildAt(viewPosition);
                    int adapterPosition = this.mBuildAdapterToChildProjection ? position : parent.getChildAdapterPosition(child);
                    int type = this.mProvider.getBlockType(adapterPosition);
                    if (!this.mFullSize && !this.mClipToPadding) {
                        if (is(type, 8)) {
                            left2 = Math.min((child.getLeft() - this.mBackgroundPaddingLeft) - this.mPaddingLeft, left2);
                        }
                        if (is(type, 16)) {
                            right2 = Math.max(child.getRight() + this.mBackgroundPaddingRight + this.mPaddingRight, right2);
                        }
                    }
                    if (type != 0 && !wasTop) {
                        top2 = ((child.getTop() + Math.round(child.getTranslationY())) - this.mBackgroundPaddingTop) - this.mPaddingTop;
                        wasTop = true;
                        wasBottom = false;
                        if (adapterPosition == 0) {
                            topExtra = (parent.getPaddingTop() - this.mBackgroundPaddingTop) - this.mPaddingTop;
                        }
                    }
                    if (type != 0) {
                        bottom2 = child.getBottom() + Math.round(child.getTranslationY()) + this.mBackgroundPaddingBottom + this.mPaddingBottom;
                    }
                    if (is(type, 4) && !wasBottom) {
                        wasTop = false;
                        wasBottom = true;
                        draw = true;
                    }
                    if (adapterPosition == viewEnd && wasTop && !wasBottom) {
                        draw = true;
                        wasTop = false;
                        wasBottom = false;
                    }
                    if (adapterPosition == adapterEnd || adapterPosition == viewEnd) {
                        bottomExtra = parent.getBottom() - bottom2;
                    }
                    if (draw) {
                        drawBackground(c, parent, left2, top2, right2, bottom2, topExtra, bottomExtra);
                        draw = false;
                        topExtra = 0;
                        bottomExtra = this.mCardsSpacing;
                        left2 = leftDefault;
                        right2 = rightDefault;
                    }
                }
            }
        }
    }

    private void drawBackground(Canvas c, View parent, int left, int top, int right, int bottom, int topExtra, int bottomExtra) {
        if (this.mBackgroundPaint.getColor() != 0) {
            int radius = this.mCardBackground.getRadius();
            c.drawRect(0.0f, top - topExtra, this.mBackgroundPaddingLeft + left, bottom + bottomExtra, this.mBackgroundPaint);
            c.drawRect(right - this.mBackgroundPaddingRight, top - topExtra, parent.getWidth(), bottom + bottomExtra, this.mBackgroundPaint);
            c.drawRect(this.mBackgroundPaddingLeft + left, top - topExtra, right - this.mBackgroundPaddingRight, this.mBackgroundPaddingTop + top, this.mBackgroundPaint);
            c.drawRect(this.mBackgroundPaddingLeft + left, bottom - this.mBackgroundPaddingBottom, right - this.mBackgroundPaddingRight, bottom + bottomExtra, this.mBackgroundPaint);
            c.drawRect(this.mBackgroundPaddingLeft + left, this.mBackgroundPaddingTop + top, this.mBackgroundPaddingLeft + left + radius, this.mBackgroundPaddingTop + top + radius, this.mBackgroundPaint);
            c.drawRect(this.mBackgroundPaddingLeft + left, (bottom - this.mBackgroundPaddingBottom) - radius, this.mBackgroundPaddingLeft + left + radius, bottom - this.mBackgroundPaddingBottom, this.mBackgroundPaint);
            c.drawRect((right - this.mBackgroundPaddingRight) - radius, this.mBackgroundPaddingTop + top, right - this.mBackgroundPaddingRight, this.mBackgroundPaddingTop + top + radius, this.mBackgroundPaint);
            c.drawRect((right - this.mBackgroundPaddingRight) - radius, (bottom - this.mBackgroundPaddingBottom) - radius, right - this.mBackgroundPaddingRight, bottom - this.mBackgroundPaddingBottom, this.mBackgroundPaint);
        }
        this.mCardBackground.setBounds(left, top, right, bottom);
        this.mCardBackground.draw(c);
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        if (this.mProvider != null) {
            int position = parent.getChildAdapterPosition(view);
            int type = this.mProvider.getBlockType(position);
            if (is(type, 4)) {
                outRect.bottom += this.mCardsSpacing;
            }
        }
    }

    public CardItemDecoration setPadding(int left, int top, int right, int bottom) {
        this.mPaddingLeft = left;
        this.mPaddingTop = top;
        this.mPaddingRight = right;
        this.mPaddingBottom = bottom;
        return this;
    }

    public CardItemDecoration setFullSize(boolean fullSize) {
        this.mFullSize = fullSize;
        return this;
    }

    public CardItemDecoration setCardsSpacing(int spacing) {
        this.mCardsSpacing = spacing;
        return this;
    }

    public int getPaddingLeft() {
        return this.mPaddingLeft;
    }

    public int getPaddingTop() {
        return this.mPaddingTop;
    }

    public int getPaddingRight() {
        return this.mPaddingRight;
    }

    public int getPaddingBottom() {
        return this.mPaddingBottom;
    }

    static boolean is(int i, int inspection) {
        return (i & inspection) == inspection;
    }

    static boolean isnt(int i, int inspection) {
        return (i & inspection) == 0;
    }
}
