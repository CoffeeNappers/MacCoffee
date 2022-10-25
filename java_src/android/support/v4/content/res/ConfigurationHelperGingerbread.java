package android.support.v4.content.res;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.util.DisplayMetrics;
@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.dex */
class ConfigurationHelperGingerbread {
    ConfigurationHelperGingerbread() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getScreenHeightDp(@NonNull Resources resources) {
        DisplayMetrics metrics = resources.getDisplayMetrics();
        return (int) (metrics.heightPixels / metrics.density);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getScreenWidthDp(@NonNull Resources resources) {
        DisplayMetrics metrics = resources.getDisplayMetrics();
        return (int) (metrics.widthPixels / metrics.density);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getSmallestScreenWidthDp(@NonNull Resources resources) {
        return Math.min(getScreenWidthDp(resources), getScreenHeightDp(resources));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int getDensityDpi(@NonNull Resources resources) {
        return resources.getDisplayMetrics().densityDpi;
    }
}
