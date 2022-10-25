package com.vk.attachpicker.util;

import android.app.Activity;
import android.os.Build;
import android.view.WindowManager;
/* loaded from: classes2.dex */
public class OrientationLocker {
    private int prevOrientation = -10;

    public void lockOrientation(Activity activity) {
        if (this.prevOrientation == -10) {
            try {
                this.prevOrientation = activity.getRequestedOrientation();
                WindowManager manager = (WindowManager) activity.getSystemService("window");
                if (manager != null && manager.getDefaultDisplay() != null) {
                    int rotation = manager.getDefaultDisplay().getRotation();
                    int orientation = activity.getResources().getConfiguration().orientation;
                    if (rotation == 3) {
                        if (orientation == 1) {
                            activity.setRequestedOrientation(1);
                        } else if (Build.VERSION.SDK_INT >= 9) {
                            activity.setRequestedOrientation(8);
                        } else {
                            activity.setRequestedOrientation(0);
                        }
                    } else if (rotation == 1) {
                        if (orientation == 1) {
                            if (Build.VERSION.SDK_INT >= 9) {
                                activity.setRequestedOrientation(9);
                            } else {
                                activity.setRequestedOrientation(1);
                            }
                        } else {
                            activity.setRequestedOrientation(0);
                        }
                    } else if (rotation == 0) {
                        if (orientation == 2) {
                            activity.setRequestedOrientation(0);
                        } else {
                            activity.setRequestedOrientation(1);
                        }
                    } else if (orientation == 2) {
                        if (Build.VERSION.SDK_INT >= 9) {
                            activity.setRequestedOrientation(8);
                        } else {
                            activity.setRequestedOrientation(0);
                        }
                    } else if (Build.VERSION.SDK_INT >= 9) {
                        activity.setRequestedOrientation(9);
                    } else {
                        activity.setRequestedOrientation(1);
                    }
                }
            } catch (Exception e) {
            }
        }
    }

    public void unlockOrientation(Activity activity) {
        try {
            this.prevOrientation = -10;
            activity.setRequestedOrientation(-1);
        } catch (Exception e) {
        }
    }
}
