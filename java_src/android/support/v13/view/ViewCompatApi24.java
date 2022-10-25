package android.support.v13.view;

import android.annotation.TargetApi;
import android.content.ClipData;
import android.support.annotation.RequiresApi;
import android.view.View;
@RequiresApi(24)
@TargetApi(24)
/* loaded from: classes.dex */
class ViewCompatApi24 {
    public static boolean startDragAndDrop(View v, ClipData data, View.DragShadowBuilder shadowBuilder, Object localState, int flags) {
        return v.startDragAndDrop(data, shadowBuilder, localState, flags);
    }

    public static void cancelDragAndDrop(View v) {
        v.cancelDragAndDrop();
    }

    public static void updateDragShadow(View v, View.DragShadowBuilder shadowBuilder) {
        v.updateDragShadow(shadowBuilder);
    }

    private ViewCompatApi24() {
    }
}
