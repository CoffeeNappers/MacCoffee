package com.vk.imageloader;

import com.vk.core.util.Screen;
import com.vk.stories.StoriesProcessor;
/* loaded from: classes2.dex */
public enum ImageSize {
    VERY_SMALL,
    SMALL,
    MID,
    BIG,
    VERY_BIG;
    
    private static final int VERY_BIG_IMAGE_SIZE = Math.max((int) StoriesProcessor.MAX_PHOTO_WIDTH, Math.min(Screen.realHeight(), 1440));
    private static final int BIG_IMAGE_SIZE = Screen.width();
    private static final int MID_IMAGE_SIZE = (int) (Screen.width() / 2.0f);
    private static final int SMALL_IMAGE_SIZE = (int) (Screen.width() / 4.0f);
    private static final int VERY_SMALL_IMAGE_SIZE = (int) (Screen.width() / 6.0f);

    public int getPixelsSize() {
        if (equals(VERY_SMALL)) {
            return VERY_SMALL_IMAGE_SIZE;
        }
        if (equals(SMALL)) {
            return SMALL_IMAGE_SIZE;
        }
        if (equals(MID)) {
            return MID_IMAGE_SIZE;
        }
        if (equals(BIG)) {
            return BIG_IMAGE_SIZE;
        }
        return VERY_BIG_IMAGE_SIZE;
    }
}
