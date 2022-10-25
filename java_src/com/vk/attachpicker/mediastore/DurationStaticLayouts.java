package com.vk.attachpicker.mediastore;

import android.support.v4.view.ViewCompat;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import com.vk.core.util.Screen;
import java.util.HashMap;
/* loaded from: classes2.dex */
public class DurationStaticLayouts {
    private static final TextPaint durationPaint = new TextPaint(1);
    private static final int layoutWidth = Screen.width() / 3;
    private static final HashMap<Integer, StaticLayout> layouts;

    static {
        durationPaint.setColor(-1);
        durationPaint.setTextSize(Screen.sp(14));
        durationPaint.setShadowLayer(2.0f, 0.0f, 1.0f, ViewCompat.MEASURED_STATE_MASK);
        layouts = new HashMap<>();
    }

    public static StaticLayout get(int duration) {
        StaticLayout layout = layouts.get(Integer.valueOf(duration));
        if (layout == null) {
            StaticLayout layout2 = new StaticLayout(stringDuration(duration), durationPaint, layoutWidth, Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
            layouts.put(Integer.valueOf(duration), layout2);
            return layout2;
        }
        return layout;
    }

    private static String stringDuration(int duration) {
        long absSeconds = Math.abs(duration);
        return String.format("%02d:%02d", Long.valueOf((absSeconds % 3600) / 60), Long.valueOf(absSeconds % 60));
    }
}
