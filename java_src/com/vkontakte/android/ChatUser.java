package com.vkontakte.android;
/* loaded from: classes2.dex */
public class ChatUser {
    public int admin = 0;
    public UserProfile inviter;
    public UserProfile user;

    public boolean isAdmin() {
        return this.user.uid == this.admin;
    }
}
