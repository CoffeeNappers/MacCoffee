package android.support.v4.graphics;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.support.annotation.RequiresApi;
@RequiresApi(19)
@TargetApi(19)
/* loaded from: classes.dex */
class BitmapCompatKitKat {
    BitmapCompatKitKat() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getAllocationByteCount(Bitmap bitmap) {
        return bitmap.getAllocationByteCount();
    }
}
