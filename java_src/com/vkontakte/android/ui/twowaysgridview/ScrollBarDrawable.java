package com.vkontakte.android.ui.twowaysgridview;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
/* loaded from: classes3.dex */
public class ScrollBarDrawable extends Drawable {
    private boolean mAlwaysDrawHorizontalTrack;
    private boolean mAlwaysDrawVerticalTrack;
    private boolean mChanged;
    private int mExtent;
    private Drawable mHorizontalThumb;
    private Drawable mHorizontalTrack;
    private int mOffset;
    private int mRange;
    private boolean mRangeChanged;
    private final Rect mTempBounds = new Rect();
    private boolean mVertical;
    private Drawable mVerticalThumb;
    private Drawable mVerticalTrack;

    public void setAlwaysDrawHorizontalTrack(boolean alwaysDrawTrack) {
        this.mAlwaysDrawHorizontalTrack = alwaysDrawTrack;
    }

    public void setAlwaysDrawVerticalTrack(boolean alwaysDrawTrack) {
        this.mAlwaysDrawVerticalTrack = alwaysDrawTrack;
    }

    public boolean getAlwaysDrawVerticalTrack() {
        return this.mAlwaysDrawVerticalTrack;
    }

    public boolean getAlwaysDrawHorizontalTrack() {
        return this.mAlwaysDrawHorizontalTrack;
    }

    public void setParameters(int range, int offset, int extent, boolean vertical) {
        if (this.mVertical != vertical) {
            this.mChanged = true;
        }
        if (this.mRange != range || this.mOffset != offset || this.mExtent != extent) {
            this.mRangeChanged = true;
        }
        this.mRange = range;
        this.mOffset = offset;
        this.mExtent = extent;
        this.mVertical = vertical;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        boolean vertical = this.mVertical;
        int extent = this.mExtent;
        int range = this.mRange;
        boolean drawTrack = true;
        boolean drawThumb = true;
        if (extent <= 0 || range <= extent) {
            drawTrack = vertical ? this.mAlwaysDrawVerticalTrack : this.mAlwaysDrawHorizontalTrack;
            drawThumb = false;
        }
        Rect r = getBounds();
        if (!canvas.quickReject(r.left, r.top, r.right, r.bottom, Canvas.EdgeType.AA)) {
            if (drawTrack) {
                drawTrack(canvas, r, vertical);
            }
            if (drawThumb) {
                int size = vertical ? r.height() : r.width();
                int thickness = vertical ? r.width() : r.height();
                int length = Math.round((size * extent) / range);
                int offset = Math.round(((size - length) * this.mOffset) / (range - extent));
                int minLength = thickness * 2;
                if (length < minLength) {
                    length = minLength;
                }
                if (offset + length > size) {
                    offset = size - length;
                }
                drawThumb(canvas, r, offset, length, vertical);
            }
        }
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.mChanged = true;
    }

    protected void drawTrack(Canvas canvas, Rect bounds, boolean vertical) {
        Drawable track;
        if (vertical) {
            track = this.mVerticalTrack;
        } else {
            track = this.mHorizontalTrack;
        }
        if (track != null) {
            if (this.mChanged) {
                track.setBounds(bounds);
            }
            track.draw(canvas);
        }
    }

    protected void drawThumb(Canvas canvas, Rect bounds, int offset, int length, boolean vertical) {
        Rect thumbRect = this.mTempBounds;
        boolean changed = this.mRangeChanged || this.mChanged;
        if (changed) {
            if (vertical) {
                thumbRect.set(bounds.left, bounds.top + offset, bounds.right, bounds.top + offset + length);
            } else {
                thumbRect.set(bounds.left + offset, bounds.top, bounds.left + offset + length, bounds.bottom);
            }
        }
        if (vertical) {
            Drawable thumb = this.mVerticalThumb;
            if (changed) {
                thumb.setBounds(thumbRect);
            }
            thumb.draw(canvas);
            return;
        }
        Drawable thumb2 = this.mHorizontalThumb;
        if (changed) {
            thumb2.setBounds(thumbRect);
        }
        thumb2.draw(canvas);
    }

    public void setVerticalThumbDrawable(Drawable thumb) {
        if (thumb != null) {
            this.mVerticalThumb = thumb;
        }
    }

    public void setVerticalTrackDrawable(Drawable track) {
        this.mVerticalTrack = track;
    }

    public void setHorizontalThumbDrawable(Drawable thumb) {
        if (thumb != null) {
            this.mHorizontalThumb = thumb;
        }
    }

    public void setHorizontalTrackDrawable(Drawable track) {
        this.mHorizontalTrack = track;
    }

    public int getSize(boolean vertical) {
        if (vertical) {
            return (this.mVerticalTrack != null ? this.mVerticalTrack : this.mVerticalThumb).getIntrinsicWidth();
        }
        return (this.mHorizontalTrack != null ? this.mHorizontalTrack : this.mHorizontalThumb).getIntrinsicHeight();
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        if (this.mVerticalTrack != null) {
            this.mVerticalTrack.setAlpha(alpha);
        }
        this.mVerticalThumb.setAlpha(alpha);
        if (this.mHorizontalTrack != null) {
            this.mHorizontalTrack.setAlpha(alpha);
        }
        this.mHorizontalThumb.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        if (this.mVerticalTrack != null) {
            this.mVerticalTrack.setColorFilter(cf);
        }
        this.mVerticalThumb.setColorFilter(cf);
        if (this.mHorizontalTrack != null) {
            this.mHorizontalTrack.setColorFilter(cf);
        }
        this.mHorizontalThumb.setColorFilter(cf);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    public String toString() {
        return "ScrollBarDrawable: range=" + this.mRange + " offset=" + this.mOffset + " extent=" + this.mExtent + (this.mVertical ? " V" : " H");
    }
}
