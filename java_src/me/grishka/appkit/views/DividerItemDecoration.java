package me.grishka.appkit.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.vkontakte.android.ViewUtils;
/* loaded from: classes3.dex */
public class DividerItemDecoration extends RecyclerView.ItemDecoration {
    private Drawable bottom;
    private int bottomHeight;
    private Drawable divider;
    private int height;
    private int paddingBottom;
    private int paddingLeft;
    private int paddingRight;
    private int paddingTop;
    private Provider provider;
    private Drawable top;
    private int topHeight;
    private boolean useDecoratedVBounds;

    /* loaded from: classes3.dex */
    public interface Provider {
        boolean needDrawDividerAfter(int i);
    }

    public DividerItemDecoration(Context ctx, @DrawableRes int drawable) {
        this.paddingLeft = 0;
        this.paddingTop = 0;
        this.paddingRight = 0;
        this.paddingBottom = 0;
        this.divider = ViewUtils.getDrawable(ctx, drawable);
        this.height = this.divider.getIntrinsicHeight();
    }

    public DividerItemDecoration(Drawable drawable) {
        this(drawable, drawable.getIntrinsicHeight());
    }

    public DividerItemDecoration(Drawable drawable, int height) {
        this.paddingLeft = 0;
        this.paddingTop = 0;
        this.paddingRight = 0;
        this.paddingBottom = 0;
        this.divider = drawable;
        this.height = height;
    }

    public DividerItemDecoration(Drawable divider, Drawable top, Drawable bottom) {
        this(divider, divider.getIntrinsicHeight(), top, top.getIntrinsicHeight(), bottom, bottom.getIntrinsicHeight());
    }

    public DividerItemDecoration(Drawable divider, int dividerHeight, Drawable top, int topHeight, Drawable bottom, int bottomHeight) {
        this(divider, dividerHeight);
        this.top = top;
        this.topHeight = topHeight;
        this.bottom = bottom;
        this.bottomHeight = bottomHeight;
    }

    public DividerItemDecoration setProvider(Provider p) {
        this.provider = p;
        return this;
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void getItemOffsets(Rect outRect, View view, RecyclerView parent, RecyclerView.State state) {
        outRect.set(0, 0, 0, 0);
        int pos = parent.getChildAdapterPosition(view);
        if (pos == 0) {
            outRect.top += this.topHeight;
        }
        if (pos == parent.mo1204getAdapter().getItemCount() - 1) {
            if (this.bottomHeight > 0) {
                outRect.bottom += this.bottomHeight;
            }
        } else if (this.provider == null || (pos < parent.mo1204getAdapter().getItemCount() && this.provider.needDrawDividerAfter(pos))) {
            outRect.bottom += this.height;
        }
    }

    public boolean isUseDecoratedVBounds() {
        return this.useDecoratedVBounds;
    }

    public void setUseDecoratedVBounds(boolean useDecoratedVBounds) {
        this.useDecoratedVBounds = useDecoratedVBounds;
    }

    private int getItemBottom(View item, RecyclerView parent) {
        return this.useDecoratedVBounds ? parent.getLayoutManager().getDecoratedBottom(item) : item.getBottom() + this.height;
    }

    private int getItemTop(View item, RecyclerView parent) {
        return this.useDecoratedVBounds ? parent.getLayoutManager().getDecoratedTop(item) : item.getTop();
    }

    @Override // android.support.v7.widget.RecyclerView.ItemDecoration
    public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
        RecyclerView.LayoutManager lm = parent.getLayoutManager();
        for (int i = 0; i < lm.getChildCount(); i++) {
            View item = lm.getChildAt(i);
            int pos = lm.getPosition(item);
            if (pos == 0 && this.top != null) {
                this.top.setBounds(item.getLeft(), item.getTop() - this.topHeight, item.getRight(), item.getTop());
                this.top.draw(c);
            }
            if (pos == parent.mo1204getAdapter().getItemCount() - 1) {
                if (this.bottom != null) {
                    this.bottom.setBounds(item.getLeft(), item.getBottom(), item.getRight(), item.getBottom() + this.bottomHeight);
                    this.bottom.draw(c);
                }
            } else if (this.provider == null || (pos < parent.mo1204getAdapter().getItemCount() && this.provider.needDrawDividerAfter(pos))) {
                this.divider.setBounds(item.getLeft(), getItemBottom(item, parent) - this.height, item.getRight(), getItemBottom(item, parent));
                this.divider.draw(c);
            }
        }
    }
}
