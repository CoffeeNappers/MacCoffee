package com.vk.attachpicker.crop;

import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class CropAspectRatio {
    public final float ar;
    public final int id;
    public final int titleResId;
    public static final CropAspectRatio CROP_NOT_SELECTED = new CropAspectRatio(0.0f, R.string.picker_not_selected, 0);
    public static final CropAspectRatio CROP_SQUARE = new CropAspectRatio(1.0f, R.string.picker_square, 1);
    public static final CropAspectRatio CROP_3X4 = new CropAspectRatio(0.75f, R.string.picker_ar_3x4, 2);
    public static final CropAspectRatio CROP_4X3 = new CropAspectRatio(1.3333334f, R.string.picker_ar_4x3, 3);

    public CropAspectRatio(float ar, int titleResId, int id) {
        this.ar = ar;
        this.titleResId = titleResId;
        this.id = id;
    }
}
