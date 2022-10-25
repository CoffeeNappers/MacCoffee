package com.vkontakte.android.ui;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.vkontakte.android.Log;
import com.vkontakte.android.ui.cardview.CardDrawable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class CardItemDecorator extends RecyclerView.ItemDecoration {
    public static final int BACKGROUND_COLOR = -1315344;
    public static final int BOTTOM = 4;
    public static final int FIRST_ROW = 32;
    public static final int LAST_ROW = 64;
    public static final int LEFT = 8;
    public static final int MIDDLE = 1;
    public static final int NONE = 0;
    public static final int RIGHT = 16;
    public static final int TOP = 2;
    private Paint bgPaint;
    private int firstCardOffset;
    private boolean fullWidth;
    private final CardDrawable mDrawable;
    private final RecyclerView.LayoutManager mManager;
    private final Provider mProvider;
    private int marginBottom;
    private int marginLeft;
    private int marginRight;
    private int marginTop;
    private int paddingAfter;
    private int paddingBefore;
    private int paddingFirst;
    private int paddingLast;
    private ArrayList<View> sortedChildren;
    private Rect tmpRect;
    private Comparator<View> viewComparator;

    /* loaded from: classes3.dex */
    public interface Provider {
        int getBlockType(int i);
    }

    public CardItemDecorator(RecyclerView recyclerView, Provider provider, boolean fullWidth) {
        this(recyclerView.getResources(), provider, recyclerView.getLayoutManager(), fullWidth);
    }

    public CardItemDecorator(RecyclerView recyclerView, boolean fullWidth) {
        this(recyclerView, (Provider) recyclerView.mo1204getAdapter(), fullWidth);
    }

    public CardItemDecorator(Resources resources, Provider provider, RecyclerView.LayoutManager manager, boolean fullWidth) {
        this.tmpRect = new Rect();
        this.fullWidth = false;
        this.firstCardOffset = 0;
        this.sortedChildren = new ArrayList<>();
        this.viewComparator = new Comparator<View>() { // from class: com.vkontakte.android.ui.CardItemDecorator.1
            @Override // java.util.Comparator
            public int compare(View lhs, View rhs) {
                if (lhs.equals(rhs)) {
                    return 0;
                }
                return lhs.getTop() - rhs.getTop();
            }
        };
        if (provider != null) {
            this.mProvider = provider;
            this.mManager = manager;
            this.fullWidth = fullWidth;
            this.mDrawable = new CardDrawable(resources, -1, V.dp(2.0f), fullWidth);
            this.bgPaint = new Paint();
            this.bgPaint.setColor(-1315344);
            return;
        }
        throw new NullPointerException("provider must be not null");
    }

    public void setBackgroundColor(int color) {
        this.bgPaint.setColor(color);
    }

    public void setPadding(int before, int after, int first, int last) {
        this.paddingBefore = before;
        this.paddingAfter = after;
        this.paddingFirst = first;
        this.paddingLast = last;
    }

    public void setFirstCardOffset(int offset) {
        this.firstCardOffset = offset;
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void onDraw(Canvas c, RecyclerView parent, RecyclerView.State state) {
        int bottom;
        int bottom2;
        super.onDraw(c, parent, state);
        int top = Integer.MIN_VALUE;
        int left = parent.getLeft() + parent.getPaddingLeft();
        int right = parent.getRight() - parent.getPaddingRight();
        int typeTop = 0;
        int lastBottom = 0;
        for (int i = 0; i < parent.getChildCount(); i++) {
            this.sortedChildren.add(parent.getChildAt(i));
        }
        Collections.sort(this.sortedChildren, this.viewComparator);
        int i2 = 0;
        while (true) {
            if (i2 >= this.sortedChildren.size()) {
                break;
            }
            View child = this.sortedChildren.get(i2);
            int position = parent.getChildAdapterPosition(child);
            if (position >= 0) {
                boolean isLastByPosition = position == parent.mo1204getAdapter().getItemCount() + (-1);
                if (position >= parent.mo1204getAdapter().getItemCount()) {
                    c.drawRect(0.0f, getViewTop(child), c.getWidth(), getViewBottom(child), this.bgPaint);
                    break;
                }
                int type = this.mProvider.getBlockType(position);
                if (((this.mManager instanceof GridLayoutManager) && ((GridLayoutManager) this.mManager).getSpanCount() == 1) || ((this.mManager instanceof LinearLayoutManager) && !(this.mManager instanceof GridLayoutManager))) {
                    if (position == 0) {
                        type |= 32;
                    }
                    if (position == parent.mo1204getAdapter().getItemCount() - 1) {
                        type |= 64;
                    }
                }
                if ((type & 6) == 6) {
                    int top2 = getViewTop(child);
                    if ((type & 32) == 32) {
                        top2 += this.firstCardOffset;
                    }
                    int bottom3 = getViewBottom(child);
                    lastBottom = bottom3;
                    this.mDrawable.setBounds(left, top2 + ((type & 32) == 32 ? this.paddingFirst : this.paddingBefore), right, bottom3 - ((type & 64) == 64 ? this.paddingLast : this.paddingAfter));
                    drawBackground(c, this.mDrawable.getBounds(), (type & 32) == 32 ? this.paddingFirst : this.paddingBefore, (type & 64) == 64 ? this.paddingLast : this.paddingAfter);
                    this.mDrawable.draw(c);
                    top = Integer.MIN_VALUE;
                    typeTop = 0;
                } else if ((type & 2) == 2) {
                    top = getViewTop(child);
                    typeTop = type;
                    if ((typeTop & 32) == 32) {
                        top += this.firstCardOffset;
                    }
                    if ((i2 == parent.getChildCount() - 1 || isLastByPosition) && (bottom2 = getViewBottom(child) + V.dp(2.0f)) >= lastBottom) {
                        lastBottom = bottom2;
                        this.mDrawable.setBounds(left, top + ((typeTop & 32) == 32 ? this.paddingFirst : this.paddingBefore), right, bottom2 - ((type & 64) == 64 ? this.paddingLast : this.paddingAfter));
                        drawBackground(c, this.mDrawable.getBounds(), (typeTop & 32) == 32 ? this.paddingFirst : this.paddingBefore, (type & 64) == 64 ? this.paddingLast : this.paddingAfter);
                        this.mDrawable.draw(c);
                    }
                } else if ((type & 1) == 1) {
                    if (top == Integer.MIN_VALUE) {
                        top = getViewTop(child) - V.dp(5.0f);
                    }
                    if ((i2 == parent.getChildCount() - 1 || isLastByPosition) && (bottom = getViewBottom(child) + V.dp(2.0f)) >= lastBottom) {
                        lastBottom = bottom;
                        this.mDrawable.setBounds(left, top + ((typeTop & 32) == 32 ? this.paddingFirst : this.paddingBefore), right, bottom - ((type & 64) == 64 ? this.paddingLast : this.paddingAfter));
                        drawBackground(c, this.mDrawable.getBounds(), (typeTop & 32) == 32 ? this.paddingFirst : this.paddingBefore, (type & 64) == 64 ? this.paddingLast : this.paddingAfter);
                        this.mDrawable.draw(c);
                    }
                } else if ((type & 4) == 4) {
                    if (top == Integer.MIN_VALUE) {
                        top = getViewTop(child);
                    }
                    int bottom4 = getViewBottom(child);
                    if (bottom4 >= lastBottom) {
                        lastBottom = bottom4;
                        this.mDrawable.setBounds(left, top + ((typeTop & 32) == 32 ? this.paddingFirst : this.paddingBefore), right, bottom4 - ((type & 64) == 64 ? this.paddingLast : this.paddingAfter));
                        if (this.mDrawable.getBounds().bottom > this.mDrawable.getBounds().top) {
                            drawBackground(c, this.mDrawable.getBounds(), (typeTop & 32) == 32 ? this.paddingFirst : this.paddingBefore, (type & 64) == 64 ? this.paddingLast : this.paddingAfter);
                            this.mDrawable.draw(c);
                        }
                        top = Integer.MIN_VALUE;
                        typeTop = 0;
                    }
                } else if (type == 0) {
                    c.drawRect(0.0f, getViewTop(child), c.getWidth(), getViewBottom(child), this.bgPaint);
                }
            }
            i2++;
        }
        if (lastBottom < parent.getHeight()) {
            c.drawRect(0.0f, lastBottom, c.getWidth(), parent.getHeight(), this.bgPaint);
        }
        this.sortedChildren.clear();
    }

    private int getViewTop(View v) {
        return this.mManager.getDecoratedTop(v) + Math.round(v.getTranslationY());
    }

    private int getViewBottom(View v) {
        return this.mManager.getDecoratedBottom(v) + Math.round(v.getTranslationY());
    }

    private void drawBackground(Canvas c, Rect bounds, int padBefore, int padAfter) {
        if (bounds.bottom < bounds.top) {
            try {
                throw new Exception("bad bounds " + this.tmpRect);
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }
        this.mDrawable.getPadding(this.tmpRect);
        this.tmpRect.top += padBefore;
        this.tmpRect.bottom += padAfter;
        if (this.tmpRect.left > 0) {
            c.drawRect(0.0f, bounds.top + this.tmpRect.top, bounds.left + this.tmpRect.left, bounds.bottom - this.tmpRect.bottom, this.bgPaint);
            c.drawRect(bounds.left + this.tmpRect.left, (bounds.top + this.tmpRect.top) - Math.min(0, padBefore), bounds.left + this.tmpRect.left + V.dp(2.0f), ((bounds.top + this.tmpRect.top) - Math.min(0, padBefore)) + V.dp(2.0f), this.bgPaint);
            c.drawRect(bounds.left + this.tmpRect.left, (bounds.bottom - this.tmpRect.bottom) - V.dp(2.0f), bounds.left + this.tmpRect.left + V.dp(2.0f), bounds.bottom - this.tmpRect.bottom, this.bgPaint);
        }
        if (this.tmpRect.right > 0) {
            c.drawRect(bounds.right - this.tmpRect.left, bounds.top + this.tmpRect.top, c.getWidth(), bounds.bottom - this.tmpRect.bottom, this.bgPaint);
            c.drawRect((bounds.right - this.tmpRect.right) - V.dp(2.0f), (bounds.top + this.tmpRect.top) - Math.min(0, padBefore), bounds.right - this.tmpRect.right, ((bounds.top + this.tmpRect.top) - Math.min(0, padBefore)) + V.dp(2.0f), this.bgPaint);
            c.drawRect((bounds.right - this.tmpRect.right) - V.dp(2.0f), (bounds.bottom - this.tmpRect.bottom) - V.dp(2.0f), bounds.right - this.tmpRect.right, bounds.bottom - this.tmpRect.bottom, this.bgPaint);
        }
        if (this.tmpRect.top > 0 && bounds.top > (-this.tmpRect.top)) {
            c.drawRect(0.0f, bounds.top - padBefore, c.getWidth(), (bounds.top + this.tmpRect.top) - Math.min(0, padBefore), this.bgPaint);
        }
        if (this.tmpRect.bottom > 0 && bounds.bottom < c.getHeight()) {
            c.drawRect(0.0f, bounds.bottom - this.tmpRect.bottom, c.getWidth(), bounds.bottom + padAfter, this.bgPaint);
        }
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        int pos = parent.getChildAdapterPosition(view);
        if (pos >= parent.mo1204getAdapter().getItemCount()) {
            outRect.set(0, 0, 0, 0);
            return;
        }
        this.mDrawable.getPadding(outRect);
        int type = this.mProvider.getBlockType(pos);
        RecyclerView.LayoutManager lm = parent.getLayoutManager();
        if (((lm instanceof GridLayoutManager) && ((GridLayoutManager) lm).getSpanCount() == 1) || ((lm instanceof LinearLayoutManager) && !(lm instanceof GridLayoutManager))) {
            if (pos == 0) {
                type |= 32;
            }
            if (pos == parent.mo1204getAdapter().getItemCount() - 1) {
                type |= 64;
            }
        }
        outRect.top = ((type & 32) == 32 ? this.paddingFirst : this.paddingBefore) + outRect.top;
        outRect.bottom = ((type & 64) == 64 ? this.paddingLast : this.paddingAfter) + outRect.bottom;
        if ((type & 6) != 6) {
            if ((type & 2) == 2) {
                outRect.bottom = 0;
            } else if ((type & 4) == 4) {
                outRect.top = 0;
            } else if ((type & 1) == 1) {
                outRect.bottom = 0;
                outRect.top = 0;
            }
        }
        if ((type & 2) == 2) {
            outRect.top += this.marginTop;
        }
        if ((type & 4) == 4) {
            outRect.top += this.marginBottom;
        }
        if ((type & 8) == 8) {
            outRect.right = 0;
            outRect.left += this.marginLeft;
        }
        if ((type & 16) == 16) {
            outRect.left = 0;
            outRect.right += this.marginRight;
        }
    }

    public void setInnerMargins(int left, int top, int right, int bottom) {
        this.marginLeft = left;
        this.marginRight = right;
        this.marginTop = top;
        this.marginBottom = bottom;
    }
}
