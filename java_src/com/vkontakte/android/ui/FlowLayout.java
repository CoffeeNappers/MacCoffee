package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
/* loaded from: classes3.dex */
public class FlowLayout extends ViewGroup {
    static final /* synthetic */ boolean $assertionsDisabled;
    private Vector<Integer> lineHeights;
    private List<LayoutParams> lparams;
    private int measuredHeight;
    public int pwidth;

    static {
        $assertionsDisabled = !FlowLayout.class.desiredAssertionStatus();
    }

    /* loaded from: classes3.dex */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        public boolean breakAfter;
        public boolean center;
        public boolean floating;
        public int height;
        public int horizontal_spacing;
        public int vertical_spacing;
        public int width;

        public LayoutParams(int horizontal_spacing, int vertical_spacing) {
            super(0, 0);
            this.horizontal_spacing = horizontal_spacing;
            this.vertical_spacing = vertical_spacing;
        }

        public static LayoutParams CreateLayoutParamsForZhukovsLayout() {
            return new LayoutParams(Global.scale(2.0f), Global.scale(2.0f));
        }

        public LayoutParams() {
            super(0, 0);
        }
    }

    public FlowLayout(Context context) {
        super(context);
        this.lineHeights = new Vector<>();
        this.pwidth = Global.scale(5.0f);
        this.measuredHeight = 0;
    }

    public FlowLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.lineHeights = new Vector<>();
        this.pwidth = Global.scale(5.0f);
        this.measuredHeight = 0;
    }

    public List<Rect> layoutWithParams(List<LayoutParams> params, int w, int h) {
        int childw;
        this.lparams = params;
        ArrayList<Rect> result = new ArrayList<>();
        int count = params.size();
        int xpos = getPaddingLeft();
        int ypos = getPaddingTop();
        boolean breakNext = false;
        this.lineHeights.clear();
        int floatingH = 0;
        int line_height = 0;
        int maxw = 0;
        for (int i = 0; i < count; i++) {
            LayoutParams lp = params.get(i);
            int childw2 = lp.width <= 0 ? w : lp.width;
            int childh = lp.height;
            if (childh < 0) {
                throw new IllegalArgumentException("Height should be constant");
            }
            if (breakNext || xpos + childw2 > this.pwidth + w) {
                xpos = getPaddingLeft();
                ypos += Math.max(line_height, floatingH);
                this.lineHeights.add(Integer.valueOf(Math.max(line_height, floatingH)));
                line_height = 0;
                floatingH = 0;
            }
            line_height = Math.max(line_height, lp.vertical_spacing + childh);
            if (lp.floating) {
                ypos += lp.vertical_spacing + childh;
                floatingH += lp.vertical_spacing + childh;
                maxw = Math.max(maxw, xpos + childw2);
            } else {
                floatingH = 0;
                xpos += lp.horizontal_spacing + childw2;
            }
            breakNext = lp.breakAfter;
            maxw = Math.max(maxw, xpos - lp.horizontal_spacing);
        }
        if (line_height > 0) {
            this.lineHeights.add(Integer.valueOf(line_height));
        }
        int xpos2 = getPaddingLeft();
        int ypos2 = getPaddingTop();
        int floatY = 0;
        boolean prevFloat = false;
        boolean breakNext2 = false;
        int line = 0;
        for (int i2 = 0; i2 < count; i2++) {
            LayoutParams lp2 = params.get(i2);
            if (lp2.width <= 0) {
                childw = w;
            } else {
                childw = lp2.width;
            }
            int childh2 = lp2.height;
            if (childh2 < 0) {
                throw new IllegalArgumentException("Height should be constant");
            }
            if (!lp2.floating && prevFloat) {
                ypos2 = floatY;
            }
            if (breakNext2 || xpos2 + childw > this.pwidth + w) {
                xpos2 = getPaddingLeft();
                ypos2 += this.lineHeights.elementAt(line).intValue();
                line++;
            }
            if (lp2.center) {
                xpos2 = (getWidth() / 2) - (childw / 2);
            }
            Log.v("vk", xpos2 + ";" + ypos2 + ";" + childw + ";" + childh2);
            result.add(new Rect(xpos2, ypos2, xpos2 + childw, ypos2 + childh2));
            if (lp2.floating) {
                if (!prevFloat) {
                    floatY = ypos2;
                    prevFloat = true;
                }
                ypos2 += lp2.vertical_spacing + childh2;
            } else {
                prevFloat = false;
                xpos2 += lp2.horizontal_spacing + childw;
            }
            breakNext2 = lp2.breakAfter;
        }
        this.measuredHeight = getFullHeight();
        return result;
    }

    public int getFullHeight() {
        int h = 0;
        Iterator<Integer> it = this.lineHeights.iterator();
        while (it.hasNext()) {
            int i = it.next().intValue();
            h += i;
        }
        return h;
    }

    public void resetParams() {
        this.lparams = null;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int childHeightMeasureSpec;
        int childh;
        if ($assertionsDisabled || View.MeasureSpec.getMode(widthMeasureSpec) != 0) {
            int width = (View.MeasureSpec.getSize(widthMeasureSpec) - getPaddingLeft()) - getPaddingRight();
            int height = (View.MeasureSpec.getSize(heightMeasureSpec) - getPaddingTop()) - getPaddingBottom();
            int count = getChildCount();
            int line_height = 0;
            int xpos = getPaddingLeft();
            int ypos = getPaddingTop();
            int maxw = 0;
            if (View.MeasureSpec.getMode(heightMeasureSpec) == Integer.MIN_VALUE) {
                childHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(height, Integer.MIN_VALUE);
            } else {
                childHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
            }
            this.lineHeights.clear();
            boolean breakNext = false;
            int floatingH = 0;
            int i = 0;
            while (true) {
                if (i >= Math.max(count, this.lparams != null ? this.lparams.size() : 0)) {
                    break;
                }
                View child = getChildAt(i);
                if ((child != null && child.getVisibility() != 8) || child == null) {
                    LayoutParams lp = child != null ? (LayoutParams) child.getLayoutParams() : this.lparams.get(i);
                    if (child != null && lp.width == -1) {
                        child.measure(View.MeasureSpec.makeMeasureSpec(width, 1073741824), childHeightMeasureSpec);
                    } else if (child != null) {
                        child.measure(lp.width <= 0 ? View.MeasureSpec.makeMeasureSpec(width, Integer.MIN_VALUE) : View.MeasureSpec.makeMeasureSpec(lp.width, 1073741824), childHeightMeasureSpec);
                    }
                    int childw = lp.width <= 0 ? child != null ? child.getMeasuredWidth() : width : lp.width;
                    if (lp.height <= 0) {
                        childh = child != null ? child.getMeasuredHeight() : 0;
                    } else {
                        childh = lp.height;
                    }
                    if (breakNext || xpos + childw > this.pwidth + width) {
                        xpos = getPaddingLeft();
                        ypos += Math.max(line_height, floatingH);
                        this.lineHeights.add(Integer.valueOf(Math.max(line_height, floatingH)));
                        line_height = 0;
                        floatingH = 0;
                    }
                    line_height = Math.max(line_height, lp.vertical_spacing + childh);
                    if (lp.floating) {
                        ypos += lp.vertical_spacing + childh;
                        floatingH += lp.vertical_spacing + childh;
                        maxw = Math.max(maxw, xpos + childw);
                    } else {
                        floatingH = 0;
                        xpos += lp.horizontal_spacing + childw;
                    }
                    breakNext = lp.breakAfter;
                    maxw = Math.max(maxw, xpos - lp.horizontal_spacing);
                }
                i++;
            }
            if (View.MeasureSpec.getMode(heightMeasureSpec) == 0) {
                height = Math.max(line_height, floatingH);
                Iterator<Integer> it = this.lineHeights.iterator();
                while (it.hasNext()) {
                    int h = it.next().intValue();
                    height += h;
                }
            } else if (View.MeasureSpec.getMode(heightMeasureSpec) == Integer.MIN_VALUE && ypos + line_height < height) {
                height = line_height;
                Iterator<Integer> it2 = this.lineHeights.iterator();
                while (it2.hasNext()) {
                    int h2 = it2.next().intValue();
                    height += h2;
                }
            }
            if (View.MeasureSpec.getMode(widthMeasureSpec) == 1073741824) {
                setMeasuredDimension(width, height);
                return;
            } else {
                setMeasuredDimension(maxw, height);
                return;
            }
        }
        throw new AssertionError();
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(Global.scale(2.0f), Global.scale(2.0f));
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int count = getChildCount();
        int width = r - l;
        int xpos = getPaddingLeft();
        int ypos = getPaddingTop();
        int line = 0;
        boolean breakNext = false;
        boolean prevFloat = false;
        int floatY = 0;
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int childw = lp.width <= 0 ? child.getMeasuredWidth() : lp.width;
                int childh = lp.height <= 0 ? child.getMeasuredHeight() : lp.height;
                if (!lp.floating && prevFloat) {
                    ypos = floatY;
                }
                if (breakNext || xpos + childw > this.pwidth + width) {
                    xpos = getPaddingLeft();
                    ypos += this.lineHeights.elementAt(line).intValue();
                    line++;
                }
                if (lp.center) {
                    xpos = (getWidth() / 2) - (childw / 2);
                }
                child.layout(xpos, ypos, xpos + childw, ypos + childh);
                if (lp.floating) {
                    if (!prevFloat) {
                        floatY = ypos;
                        prevFloat = true;
                    }
                    ypos += lp.vertical_spacing + childh;
                } else {
                    prevFloat = false;
                    xpos += lp.horizontal_spacing + childw;
                }
                breakNext = lp.breakAfter;
            }
        }
    }
}
