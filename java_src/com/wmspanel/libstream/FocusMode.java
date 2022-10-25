package com.wmspanel.libstream;

import android.os.Build;
/* loaded from: classes3.dex */
public class FocusMode {
    public int antibandingMode;
    public int awbMode;
    public int exposureCompensation;
    public float focusDistance;
    public int focusMode;
    public String focusMode16 = "continuous-video";
    public String awbMode16 = "auto";
    public String antibandingMode16 = "off";

    public FocusMode() {
        if (Build.VERSION.SDK_INT >= 21) {
            this.focusMode = 3;
            this.awbMode = 1;
            this.antibandingMode = 0;
        }
    }
}
