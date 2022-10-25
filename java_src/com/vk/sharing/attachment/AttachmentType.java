package com.vk.sharing.attachment;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
@Retention(RetentionPolicy.SOURCE)
/* loaded from: classes.dex */
public @interface AttachmentType {
    public static final int TYPE_AUDIO = 4;
    public static final int TYPE_DOCUMENT = 8;
    public static final int TYPE_MARKET = 7;
    public static final int TYPE_PHOTO = 5;
    public static final int TYPE_PLAYLIST = 10;
    public static final int TYPE_STORY = 9;
    public static final int TYPE_VIDEO = 6;
    public static final int TYPE_WALL = 1;
    public static final int TYPE_WALL_ADS = 2;
    public static final int TYPE_WALL_REPLY = 3;
}
