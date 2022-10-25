package android.support.v13.app;

import android.annotation.TargetApi;
import android.app.Fragment;
import android.support.annotation.RequiresApi;
@RequiresApi(23)
@TargetApi(23)
/* loaded from: classes.dex */
class FragmentCompat23 {
    FragmentCompat23() {
    }

    public static void requestPermissions(Fragment fragment, String[] permissions, int requestCode) {
        fragment.requestPermissions(permissions, requestCode);
    }

    public static boolean shouldShowRequestPermissionRationale(Fragment fragment, String permission) {
        return fragment.shouldShowRequestPermissionRationale(permission);
    }
}
