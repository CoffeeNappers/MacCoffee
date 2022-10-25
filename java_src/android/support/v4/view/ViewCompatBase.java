package android.support.v4.view;

import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.support.annotation.RequiresApi;
import android.view.Display;
import android.view.View;
import android.view.ViewParent;
import android.view.WindowManager;
import java.lang.reflect.Field;
@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.dex */
class ViewCompatBase {
    private static final String TAG = "ViewCompatBase";
    private static Field sMinHeightField;
    private static boolean sMinHeightFieldFetched;
    private static Field sMinWidthField;
    private static boolean sMinWidthFieldFetched;

    ViewCompatBase() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ColorStateList getBackgroundTintList(View view) {
        if (view instanceof TintableBackgroundView) {
            return ((TintableBackgroundView) view).getSupportBackgroundTintList();
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setBackgroundTintList(View view, ColorStateList tintList) {
        if (view instanceof TintableBackgroundView) {
            ((TintableBackgroundView) view).setSupportBackgroundTintList(tintList);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static PorterDuff.Mode getBackgroundTintMode(View view) {
        if (view instanceof TintableBackgroundView) {
            return ((TintableBackgroundView) view).getSupportBackgroundTintMode();
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setBackgroundTintMode(View view, PorterDuff.Mode mode) {
        if (view instanceof TintableBackgroundView) {
            ((TintableBackgroundView) view).setSupportBackgroundTintMode(mode);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isLaidOut(View view) {
        return view.getWidth() > 0 && view.getHeight() > 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getMinimumWidth(View view) {
        if (!sMinWidthFieldFetched) {
            try {
                sMinWidthField = View.class.getDeclaredField("mMinWidth");
                sMinWidthField.setAccessible(true);
            } catch (NoSuchFieldException e) {
            }
            sMinWidthFieldFetched = true;
        }
        if (sMinWidthField != null) {
            try {
                return ((Integer) sMinWidthField.get(view)).intValue();
            } catch (Exception e2) {
            }
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getMinimumHeight(View view) {
        if (!sMinHeightFieldFetched) {
            try {
                sMinHeightField = View.class.getDeclaredField("mMinHeight");
                sMinHeightField.setAccessible(true);
            } catch (NoSuchFieldException e) {
            }
            sMinHeightFieldFetched = true;
        }
        if (sMinHeightField != null) {
            try {
                return ((Integer) sMinHeightField.get(view)).intValue();
            } catch (Exception e2) {
            }
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isAttachedToWindow(View view) {
        return view.getWindowToken() != null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void offsetTopAndBottom(View view, int offset) {
        int currentTop = view.getTop();
        view.offsetTopAndBottom(offset);
        if (offset != 0) {
            ViewParent parent = view.getParent();
            if (parent instanceof View) {
                int absOffset = Math.abs(offset);
                ((View) parent).invalidate(view.getLeft(), currentTop - absOffset, view.getRight(), view.getHeight() + currentTop + absOffset);
                return;
            }
            view.invalidate();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void offsetLeftAndRight(View view, int offset) {
        int currentLeft = view.getLeft();
        view.offsetLeftAndRight(offset);
        if (offset != 0) {
            ViewParent parent = view.getParent();
            if (parent instanceof View) {
                int absOffset = Math.abs(offset);
                ((View) parent).invalidate(currentLeft - absOffset, view.getTop(), view.getWidth() + currentLeft + absOffset, view.getBottom());
                return;
            }
            view.invalidate();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Display getDisplay(View view) {
        if (isAttachedToWindow(view)) {
            WindowManager wm = (WindowManager) view.getContext().getSystemService("window");
            return wm.getDefaultDisplay();
        }
        return null;
    }
}
