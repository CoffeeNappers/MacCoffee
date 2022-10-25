package android.support.v4.hardware.display;

import android.annotation.TargetApi;
import android.content.Context;
import android.hardware.display.DisplayManager;
import android.support.annotation.RequiresApi;
import android.view.Display;
import com.facebook.internal.ServerProtocol;
@RequiresApi(17)
@TargetApi(17)
/* loaded from: classes.dex */
final class DisplayManagerJellybeanMr1 {
    DisplayManagerJellybeanMr1() {
    }

    public static Object getDisplayManager(Context context) {
        return context.getSystemService(ServerProtocol.DIALOG_PARAM_DISPLAY);
    }

    public static Display getDisplay(Object displayManagerObj, int displayId) {
        return ((DisplayManager) displayManagerObj).getDisplay(displayId);
    }

    public static Display[] getDisplays(Object displayManagerObj) {
        return ((DisplayManager) displayManagerObj).getDisplays();
    }

    public static Display[] getDisplays(Object displayManagerObj, String category) {
        return ((DisplayManager) displayManagerObj).getDisplays(category);
    }
}
