package android.support.v4.view;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.MotionEvent;
@RequiresApi(12)
@TargetApi(12)
/* loaded from: classes.dex */
class MotionEventCompatHoneycombMr1 {
    MotionEventCompatHoneycombMr1() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float getAxisValue(MotionEvent event, int axis) {
        return event.getAxisValue(axis);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float getAxisValue(MotionEvent event, int axis, int pointerIndex) {
        return event.getAxisValue(axis, pointerIndex);
    }
}
