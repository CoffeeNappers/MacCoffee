package android.support.v4.widget;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.widget.PopupWindow;
@RequiresApi(23)
@TargetApi(23)
/* loaded from: classes.dex */
class PopupWindowCompatApi23 {
    PopupWindowCompatApi23() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setOverlapAnchor(PopupWindow popupWindow, boolean overlapAnchor) {
        popupWindow.setOverlapAnchor(overlapAnchor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean getOverlapAnchor(PopupWindow popupWindow) {
        return popupWindow.getOverlapAnchor();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setWindowLayoutType(PopupWindow popupWindow, int layoutType) {
        popupWindow.setWindowLayoutType(layoutType);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getWindowLayoutType(PopupWindow popupWindow) {
        return popupWindow.getWindowLayoutType();
    }
}
