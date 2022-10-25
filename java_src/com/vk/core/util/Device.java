package com.vk.core.util;

import android.os.Build;
/* loaded from: classes2.dex */
public class Device {
    public static boolean isNexus5X() {
        return "LGE".equalsIgnoreCase(Build.MANUFACTURER) && "bullhead".equalsIgnoreCase(Build.DEVICE);
    }

    public static boolean isLenovoK900() {
        return "LENOVO".equalsIgnoreCase(Build.MANUFACTURER) && "K900_ROW".equalsIgnoreCase(Build.DEVICE);
    }

    public static boolean isGalaxyS8() {
        return "samsung".equalsIgnoreCase(Build.MANUFACTURER) && "dreamlte".equalsIgnoreCase(Build.DEVICE);
    }

    public static boolean isGalaxyS8Plus() {
        return "samsung".equalsIgnoreCase(Build.MANUFACTURER) && "dream2lte".equalsIgnoreCase(Build.DEVICE);
    }
}
