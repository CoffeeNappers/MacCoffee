package android.support.v4.content.res;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
@RequiresApi(13)
@TargetApi(13)
/* loaded from: classes.dex */
class ConfigurationHelperHoneycombMr2 {
    ConfigurationHelperHoneycombMr2() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getScreenHeightDp(@NonNull Resources resources) {
        return resources.getConfiguration().screenHeightDp;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getScreenWidthDp(@NonNull Resources resources) {
        return resources.getConfiguration().screenWidthDp;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getSmallestScreenWidthDp(@NonNull Resources resources) {
        return resources.getConfiguration().smallestScreenWidthDp;
    }
}
