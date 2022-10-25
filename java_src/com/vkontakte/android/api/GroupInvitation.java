package com.vkontakte.android.api;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.models.Model;
/* loaded from: classes2.dex */
public class GroupInvitation extends Model {
    public static final int STATE_ACCEPTED = 2;
    public static final int STATE_DECLINED = 3;
    public static final int STATE_LOADING = 1;
    public static final int STATE_NEW = 0;
    public static final int STATE_UNSURE = 4;
    public Group group;
    public UserProfile inviter;
    public Boolean sent;
    public int size;
    public int state;

    public String toString() {
        return this.group.toString();
    }
}
