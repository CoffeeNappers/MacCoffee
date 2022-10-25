package android.support.v4.view;

import android.annotation.TargetApi;
import android.support.annotation.RequiresApi;
import android.view.ViewConfiguration;
@RequiresApi(14)
@TargetApi(14)
/* loaded from: classes.dex */
class ViewConfigurationCompatICS {
    ViewConfigurationCompatICS() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean hasPermanentMenuKey(ViewConfiguration config) {
        return config.hasPermanentMenuKey();
    }
}
