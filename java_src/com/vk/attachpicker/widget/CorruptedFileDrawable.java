package com.vk.attachpicker.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import com.vk.attachpicker.Picker;
import com.vkontakte.android.R;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.HashMap;
/* loaded from: classes2.dex */
public class CorruptedFileDrawable extends Drawable {
    private static final HashMap<String, StaticLayout> textLayouts = new HashMap<>();

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.drawColor(ViewCompat.MEASURED_STATE_MASK);
        StaticLayout staticLayout = getTextLayoutForSize(canvas.getWidth(), canvas.getHeight());
        int count = canvas.save();
        canvas.translate(staticLayout.getWidth() / 2, (canvas.getHeight() / 2) - (staticLayout.getHeight() / 2));
        staticLayout.draw(canvas);
        canvas.restoreToCount(count);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    private static StaticLayout getTextLayoutForSize(int width, int height) {
        StaticLayout layout = textLayouts.get(width + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + height);
        if (layout == null) {
            TextPaint textPaint = new TextPaint();
            textPaint.setColor(-1);
            textPaint.setAntiAlias(true);
            textPaint.setTextAlign(Paint.Align.CENTER);
            textPaint.setTextSize(Math.min(width, height) / 12);
            StaticLayout layout2 = new StaticLayout(Picker.getContext().getResources().getString(R.string.picker_file_corrupted_or_deleted), textPaint, Math.min(width, height), Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
            textLayouts.put(width + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + height, layout2);
            return layout2;
        }
        return layout;
    }
}
