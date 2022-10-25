package ru.mail.libverify.notifications;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ActivityManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.support.annotation.NonNull;
import android.util.TypedValue;
import ru.mail.libverify.R;
/* loaded from: classes3.dex */
final class g {
    /* JADX INFO: Access modifiers changed from: package-private */
    @TargetApi(21)
    public static void a(@NonNull Activity activity, int i, String str) {
        activity.setTitle(str);
        if (Build.VERSION.SDK_INT >= 21) {
            TypedValue typedValue = new TypedValue();
            activity.getTheme().resolveAttribute(R.attr.colorPrimary, typedValue, true);
            int i2 = typedValue.data;
            Bitmap decodeResource = BitmapFactory.decodeResource(activity.getResources(), i);
            activity.setTaskDescription(new ActivityManager.TaskDescription(str, decodeResource, i2));
            decodeResource.recycle();
        }
    }
}
