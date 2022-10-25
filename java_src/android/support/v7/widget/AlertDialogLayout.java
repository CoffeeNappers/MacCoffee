package android.support.v7.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R;
import android.support.v7.widget.LinearLayoutCompat;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.dex */
public class AlertDialogLayout extends LinearLayoutCompat {
    public AlertDialogLayout(@Nullable Context context) {
        super(context);
    }

    public AlertDialogLayout(@Nullable Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.LinearLayoutCompat, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (!tryOnMeasure(widthMeasureSpec, heightMeasureSpec)) {
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        }
    }

    private boolean tryOnMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int childHeightSpec;
        View topPanel = null;
        View buttonPanel = null;
        View middlePanel = null;
        int count = getChildCount();
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                int id = child.getId();
                if (id == R.id.topPanel) {
                    topPanel = child;
                } else if (id == R.id.buttonPanel) {
                    buttonPanel = child;
                } else if ((id != R.id.contentPanel && id != R.id.customPanel) || middlePanel != null) {
                    return false;
                } else {
                    middlePanel = child;
                }
            }
        }
        int heightMode = View.MeasureSpec.getMode(heightMeasureSpec);
        int heightSize = View.MeasureSpec.getSize(heightMeasureSpec);
        int widthMode = View.MeasureSpec.getMode(widthMeasureSpec);
        int childState = 0;
        int usedHeight = getPaddingTop() + getPaddingBottom();
        if (topPanel != null) {
            topPanel.measure(widthMeasureSpec, 0);
            usedHeight += topPanel.getMeasuredHeight();
            childState = ViewCompat.combineMeasuredStates(0, ViewCompat.getMeasuredState(topPanel));
        }
        int buttonHeight = 0;
        int buttonWantsHeight = 0;
        if (buttonPanel != null) {
            buttonPanel.measure(widthMeasureSpec, 0);
            buttonHeight = resolveMinimumHeight(buttonPanel);
            buttonWantsHeight = buttonPanel.getMeasuredHeight() - buttonHeight;
            usedHeight += buttonHeight;
            childState = ViewCompat.combineMeasuredStates(childState, ViewCompat.getMeasuredState(buttonPanel));
        }
        int middleHeight = 0;
        if (middlePanel != null) {
            if (heightMode == 0) {
                childHeightSpec = 0;
            } else {
                childHeightSpec = View.MeasureSpec.makeMeasureSpec(Math.max(0, heightSize - usedHeight), heightMode);
            }
            middlePanel.measure(widthMeasureSpec, childHeightSpec);
            middleHeight = middlePanel.getMeasuredHeight();
            usedHeight += middleHeight;
            childState = ViewCompat.combineMeasuredStates(childState, ViewCompat.getMeasuredState(middlePanel));
        }
        int remainingHeight = heightSize - usedHeight;
        if (buttonPanel != null) {
            int usedHeight2 = usedHeight - buttonHeight;
            int heightToGive = Math.min(remainingHeight, buttonWantsHeight);
            if (heightToGive > 0) {
                remainingHeight -= heightToGive;
                buttonHeight += heightToGive;
            }
            int childHeightSpec2 = View.MeasureSpec.makeMeasureSpec(buttonHeight, 1073741824);
            buttonPanel.measure(widthMeasureSpec, childHeightSpec2);
            usedHeight = usedHeight2 + buttonPanel.getMeasuredHeight();
            childState = ViewCompat.combineMeasuredStates(childState, ViewCompat.getMeasuredState(buttonPanel));
        }
        if (middlePanel != null && remainingHeight > 0) {
            int heightToGive2 = remainingHeight;
            int i2 = remainingHeight - heightToGive2;
            int childHeightSpec3 = View.MeasureSpec.makeMeasureSpec(middleHeight + heightToGive2, heightMode);
            middlePanel.measure(widthMeasureSpec, childHeightSpec3);
            usedHeight = (usedHeight - middleHeight) + middlePanel.getMeasuredHeight();
            childState = ViewCompat.combineMeasuredStates(childState, ViewCompat.getMeasuredState(middlePanel));
        }
        int maxWidth = 0;
        for (int i3 = 0; i3 < count; i3++) {
            View child2 = getChildAt(i3);
            if (child2.getVisibility() != 8) {
                maxWidth = Math.max(maxWidth, child2.getMeasuredWidth());
            }
        }
        int widthSizeAndState = ViewCompat.resolveSizeAndState(maxWidth + getPaddingLeft() + getPaddingRight(), widthMeasureSpec, childState);
        int heightSizeAndState = ViewCompat.resolveSizeAndState(usedHeight, heightMeasureSpec, 0);
        setMeasuredDimension(widthSizeAndState, heightSizeAndState);
        if (widthMode != 1073741824) {
            forceUniformWidth(count, heightMeasureSpec);
        }
        return true;
    }

    private void forceUniformWidth(int count, int heightMeasureSpec) {
        int uniformMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LinearLayoutCompat.LayoutParams lp = (LinearLayoutCompat.LayoutParams) child.getLayoutParams();
                if (lp.width == -1) {
                    int oldHeight = lp.height;
                    lp.height = child.getMeasuredHeight();
                    measureChildWithMargins(child, uniformMeasureSpec, 0, heightMeasureSpec, 0);
                    lp.height = oldHeight;
                }
            }
        }
    }

    private static int resolveMinimumHeight(View v) {
        int minHeight = ViewCompat.getMinimumHeight(v);
        if (minHeight <= 0) {
            if (v instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) v;
                if (vg.getChildCount() == 1) {
                    return resolveMinimumHeight(vg.getChildAt(0));
                }
            }
            return 0;
        }
        return minHeight;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.widget.LinearLayoutCompat, android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int childTop;
        int childLeft;
        int paddingLeft = getPaddingLeft();
        int width = right - left;
        int childRight = width - getPaddingRight();
        int childSpace = (width - paddingLeft) - getPaddingRight();
        int totalLength = getMeasuredHeight();
        int count = getChildCount();
        int gravity = getGravity();
        int majorGravity = gravity & 112;
        int minorGravity = gravity & GravityCompat.RELATIVE_HORIZONTAL_GRAVITY_MASK;
        switch (majorGravity) {
            case 16:
                childTop = getPaddingTop() + (((bottom - top) - totalLength) / 2);
                break;
            case 80:
                childTop = ((getPaddingTop() + bottom) - top) - totalLength;
                break;
            default:
                childTop = getPaddingTop();
                break;
        }
        Drawable dividerDrawable = getDividerDrawable();
        int dividerHeight = dividerDrawable == null ? 0 : dividerDrawable.getIntrinsicHeight();
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child != null && child.getVisibility() != 8) {
                int childWidth = child.getMeasuredWidth();
                int childHeight = child.getMeasuredHeight();
                LinearLayoutCompat.LayoutParams lp = (LinearLayoutCompat.LayoutParams) child.getLayoutParams();
                int layoutGravity = lp.gravity;
                if (layoutGravity < 0) {
                    layoutGravity = minorGravity;
                }
                int layoutDirection = ViewCompat.getLayoutDirection(this);
                int absoluteGravity = GravityCompat.getAbsoluteGravity(layoutGravity, layoutDirection);
                switch (absoluteGravity & 7) {
                    case 1:
                        childLeft = ((((childSpace - childWidth) / 2) + paddingLeft) + lp.leftMargin) - lp.rightMargin;
                        break;
                    case 5:
                        childLeft = (childRight - childWidth) - lp.rightMargin;
                        break;
                    default:
                        childLeft = paddingLeft + lp.leftMargin;
                        break;
                }
                if (hasDividerBeforeChildAt(i)) {
                    childTop += dividerHeight;
                }
                int childTop2 = childTop + lp.topMargin;
                setChildFrame(child, childLeft, childTop2, childWidth, childHeight);
                childTop = childTop2 + lp.bottomMargin + childHeight;
            }
        }
    }

    private void setChildFrame(View child, int left, int top, int width, int height) {
        child.layout(left, top, left + width, top + height);
    }
}
