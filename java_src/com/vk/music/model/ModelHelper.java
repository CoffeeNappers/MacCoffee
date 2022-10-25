package com.vk.music.model;

import android.os.Bundle;
import android.support.annotation.NonNull;
/* loaded from: classes.dex */
final class ModelHelper {
    ModelHelper() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void saveAll(@NonNull Bundle b, @NonNull ActiveModel... models) {
        int length = models.length;
        int i = 0;
        int i2 = 0;
        while (i < length) {
            ActiveModel model = models[i];
            b.putBundle("s" + i2, model.save());
            i++;
            i2++;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void restoreAll(@NonNull Bundle b, @NonNull ActiveModel... models) {
        int length = models.length;
        int i = 0;
        int i2 = 0;
        while (i < length) {
            ActiveModel model = models[i];
            int i3 = i2 + 1;
            Bundle s = b.getBundle("s" + i2);
            if (s != null) {
                model.restore(s);
            }
            i++;
            i2 = i3;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void clearCallbacksAll(@NonNull ActiveModel... models) {
        for (ActiveModel model : models) {
            model.clearCallbacks();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void releaseAll(@NonNull ActiveModel... models) {
        for (ActiveModel model : models) {
            model.release();
        }
    }
}
