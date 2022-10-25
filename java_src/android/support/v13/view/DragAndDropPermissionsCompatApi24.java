package android.support.v13.view;

import android.annotation.TargetApi;
import android.app.Activity;
import android.support.annotation.RequiresApi;
import android.view.DragAndDropPermissions;
import android.view.DragEvent;
@RequiresApi(24)
@TargetApi(24)
/* loaded from: classes.dex */
class DragAndDropPermissionsCompatApi24 {
    DragAndDropPermissionsCompatApi24() {
    }

    public static Object request(Activity activity, DragEvent dragEvent) {
        return activity.requestDragAndDropPermissions(dragEvent);
    }

    public static void release(Object dragAndDropPermissions) {
        ((DragAndDropPermissions) dragAndDropPermissions).release();
    }
}
