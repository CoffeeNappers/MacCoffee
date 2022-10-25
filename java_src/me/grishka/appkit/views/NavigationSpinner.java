package me.grishka.appkit.views;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class NavigationSpinner extends Spinner {
    private static final int MAX_ITEMS_MEASURED = 15;
    public static final int POPUP_SIZE_ALGORITHM_MAX = 1;
    public static final int POPUP_SIZE_ALGORITHM_MIN = 0;
    private DropDownWidthHelper dropDownWidthHelper;
    protected int popupSizeAlgorithm;

    /* loaded from: classes3.dex */
    public interface DropDownWidthHelper {
        int getDropDownWidth(NavigationSpinner navigationSpinner, int i, int i2, int i3);
    }

    public NavigationSpinner(Context context) {
        super(context);
        this.popupSizeAlgorithm = 0;
        this.dropDownWidthHelper = null;
    }

    public NavigationSpinner(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.popupSizeAlgorithm = 0;
        this.dropDownWidthHelper = null;
    }

    public NavigationSpinner(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.popupSizeAlgorithm = 0;
        this.dropDownWidthHelper = null;
    }

    @TargetApi(21)
    public NavigationSpinner(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes, int mode) {
        super(context, attrs, defStyleAttr, defStyleRes, mode);
        this.popupSizeAlgorithm = 0;
        this.dropDownWidthHelper = null;
    }

    public NavigationSpinner(Context context, AttributeSet attrs, int defStyleAttr, int mode) {
        super(context, attrs, defStyleAttr, mode);
        this.popupSizeAlgorithm = 0;
        this.dropDownWidthHelper = null;
    }

    public NavigationSpinner(Context context, int mode) {
        super(context, mode);
        this.popupSizeAlgorithm = 0;
        this.dropDownWidthHelper = null;
    }

    public void setDropDownWidthHelper(DropDownWidthHelper dropDownWidthHelper) {
        this.dropDownWidthHelper = dropDownWidthHelper;
    }

    public int measureContentWidth(SpinnerAdapter adapter, Drawable background) {
        if (adapter == null) {
            return 0;
        }
        Rect tempRect = new Rect();
        int widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        int start = Math.max(0, getSelectedItemPosition());
        int end = Math.min(adapter.getCount(), start + 15);
        int count = end - start;
        int width = considerWidth(adapter, Math.max(0, start - (15 - count)), end, widthMeasureSpec, heightMeasureSpec, 0);
        int maxLenIndex = 0;
        if (adapter.getCount() > 15) {
            int len = 0;
            for (int i = 0; i < adapter.getCount(); i++) {
                int localLen = len(adapter.getItem(i));
                if (localLen > len) {
                    maxLenIndex = i;
                    len = localLen;
                }
            }
            width = considerWidth(adapter, maxLenIndex, maxLenIndex + 1, widthMeasureSpec, heightMeasureSpec, width);
        }
        if (background != null) {
            background.getPadding(tempRect);
            return width + tempRect.left + tempRect.right;
        }
        return width;
    }

    public static int len(Object o) {
        if (o instanceof CharSequence) {
            return ((CharSequence) o).length();
        }
        return 0;
    }

    protected int considerWidth(SpinnerAdapter adapter, int start, int end, int widthMeasureSpec, int heightMeasureSpec, int width) {
        View itemView = null;
        int itemType = 0;
        for (int i = start; i < end; i++) {
            int positionType = adapter.getItemViewType(i);
            if (positionType != itemType) {
                itemType = positionType;
                itemView = null;
            }
            itemView = adapter.getView(i, itemView, this);
            if (itemView.getLayoutParams() == null) {
                itemView.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
            }
            itemView.measure(widthMeasureSpec, heightMeasureSpec);
            width = Math.max(width, itemView.getMeasuredWidth());
        }
        return width;
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration newConfig) {
        if (this.dropDownWidthHelper != null) {
            int w = this.dropDownWidthHelper.getDropDownWidth(this, Math.min(measureContentWidth(getAdapter(), null), getWidth()), V.dp(newConfig.screenWidthDp), getLeft());
            if (Build.VERSION.SDK_INT >= 16) {
                setDropDownWidth(w);
            }
        }
        super.onConfigurationChanged(newConfig);
    }

    @Override // android.widget.Spinner, android.view.View
    public boolean performClick() {
        int w;
        if (this.popupSizeAlgorithm == 0) {
            w = Math.min(measureContentWidth(getAdapter(), null), getWidth());
        } else {
            w = Math.max(measureContentWidth(getAdapter(), null), getWidth());
        }
        if ((getParent() instanceof View) && this.dropDownWidthHelper != null) {
            w = this.dropDownWidthHelper.getDropDownWidth(this, w, ((View) getParent()).getWidth(), getLeft());
        }
        if (Build.VERSION.SDK_INT >= 16) {
            setDropDownWidth(w);
        }
        return super.performClick();
    }

    public void setPopupSizeAlgorithm(int popupSizeAlgorithm) {
        this.popupSizeAlgorithm = popupSizeAlgorithm;
    }
}
