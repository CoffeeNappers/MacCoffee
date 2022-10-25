package com.vkontakte.android;

import com.vkontakte.android.attachments.Attachment;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public interface Comment {
    boolean canEdit();

    boolean containsGraffiti();

    ArrayList<Attachment> getAttachments();

    CharSequence getDisplayableText();

    int getId();

    int getNumLikes();

    String getResponseName();

    int getTime();

    int getUid();

    String getUserName();

    String getUserPhoto();

    boolean isAuthorVerified();

    boolean isBanned();

    boolean isLiked();

    boolean isReported();
}
