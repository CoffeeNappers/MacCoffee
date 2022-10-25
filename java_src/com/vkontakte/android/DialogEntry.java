package com.vkontakte.android;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public class DialogEntry implements Indexable {
    public Message lastMessage;
    public String lastMessagePhoto;
    public boolean muted;
    public UserProfile profile;
    public int unreadCount;
    private Map<Integer, UserProfile> writesMessage;
    private final Object writesMessageMonitor;
    private List<UserProfile> writesMessageUsers;

    public DialogEntry() {
        this.profile = UserProfile.EMPTY_USER;
        this.muted = false;
        this.writesMessageMonitor = new Object();
    }

    public DialogEntry(DialogEntry other) {
        this.profile = UserProfile.EMPTY_USER;
        this.muted = false;
        this.writesMessageMonitor = new Object();
        this.profile = other.profile;
        this.lastMessage = other.lastMessage;
        this.lastMessagePhoto = other.lastMessagePhoto;
        this.unreadCount = other.unreadCount;
        if (other.writesMessage != null) {
            this.writesMessage.putAll(other.writesMessage);
        }
        this.muted = other.muted;
    }

    @Override // com.vkontakte.android.Indexable
    public char[] getIndexChars() {
        return this.profile.getIndexChars();
    }

    @Override // com.vkontakte.android.Indexable
    public boolean matches(String q) {
        return this.profile.matches(q);
    }

    public boolean updateMutedState() {
        boolean newMuted = !NotificationUtils.arePeerNotificationsEnabled(VKApplication.context, this.lastMessage.peer);
        if (this.muted != newMuted) {
            this.muted = newMuted;
            return true;
        }
        return false;
    }

    public String toString() {
        return "DialogEntry {profile=" + this.profile + ", lastMessage=" + this.lastMessage + "}";
    }

    public List<UserProfile> getWritesMessage() {
        List<UserProfile> list;
        synchronized (this.writesMessageMonitor) {
            list = this.writesMessageUsers;
        }
        return list;
    }

    public void setWritesMessage(Collection<? extends UserProfile> writesMessage) {
        synchronized (this.writesMessageMonitor) {
            if (this.writesMessage != null) {
                this.writesMessage.clear();
            } else {
                this.writesMessage = new HashMap();
            }
            if (this.writesMessageUsers != null) {
                this.writesMessageUsers.clear();
            } else {
                this.writesMessageUsers = new ArrayList();
            }
            for (UserProfile profile : writesMessage) {
                this.writesMessage.put(Integer.valueOf(profile.uid), profile);
            }
            this.writesMessageUsers.addAll(this.writesMessage.values());
        }
    }
}
