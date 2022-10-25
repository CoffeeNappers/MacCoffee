package com.vk.stories.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.vk.stories.StoriesController;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.auth.VKAccountManager;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class StoriesContainer implements Parcelable {
    public static final Parcelable.Creator<StoriesContainer> CREATOR = new Parcelable.Creator<StoriesContainer>() { // from class: com.vk.stories.model.StoriesContainer.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public StoriesContainer mo536createFromParcel(Parcel source) {
            return new StoriesContainer(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public StoriesContainer[] mo537newArray(int size) {
            return new StoriesContainer[size];
        }
    };
    private final Group group;
    public final ArrayList<StoryEntry> storyEntries;
    private final UserProfile userProfile;

    public StoriesContainer(UserProfile userProfile, ArrayList<StoryEntry> storyEntries) {
        this.userProfile = userProfile;
        this.group = null;
        this.storyEntries = storyEntries;
    }

    public StoriesContainer(Group group, ArrayList<StoryEntry> storyEntries) {
        this.userProfile = null;
        this.group = group;
        this.storyEntries = storyEntries;
    }

    public boolean hasFailedUploads() {
        if (this.storyEntries != null) {
            for (int i = 0; i < this.storyEntries.size(); i++) {
                StoryEntry se = this.storyEntries.get(i);
                StoriesController.StoryUpload su = StoriesController.getUploadState(se);
                if (su != null && su.uploadFailed()) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean hasValidStories() {
        return this.storyEntries != null && this.storyEntries.size() > 0;
    }

    public boolean isPromo() {
        return hasValidStories() && this.storyEntries.get(0).isPromo;
    }

    public int getAuthorId() {
        if (this.userProfile != null) {
            return this.userProfile.uid;
        }
        if (this.group != null) {
            return -this.group.id;
        }
        return 0;
    }

    public String getAuthorFullName() {
        if (hasValidStories() && !TextUtils.isEmpty(this.storyEntries.get(0).ownerName)) {
            return this.storyEntries.get(0).ownerName;
        }
        if (this.userProfile != null) {
            return this.userProfile.fullName;
        }
        if (this.group != null) {
            return this.group.name;
        }
        return null;
    }

    public String getAuthorFirstName() {
        if (hasValidStories() && !TextUtils.isEmpty(this.storyEntries.get(0).ownerName)) {
            return this.storyEntries.get(0).ownerName;
        }
        if (this.userProfile != null) {
            return this.userProfile.firstName;
        }
        if (this.group != null) {
            return this.group.name;
        }
        return null;
    }

    public String getAuthorAvatarUrl() {
        if (hasValidStories() && !TextUtils.isEmpty(this.storyEntries.get(0).ownerPhoto)) {
            return this.storyEntries.get(0).ownerPhoto;
        }
        if (this.userProfile != null) {
            return this.userProfile.photo;
        }
        if (this.group != null) {
            return this.group.photo;
        }
        return null;
    }

    public boolean myStory() {
        return this.userProfile != null && this.userProfile.uid == VKAccountManager.getCurrent().getUid();
    }

    public StoryEntry getStartStory() {
        return this.storyEntries.get(getStartIndex());
    }

    public int getStartIndex() {
        for (int i = 0; i < this.storyEntries.size(); i++) {
            if (!this.storyEntries.get(i).seen) {
                return i;
            }
        }
        return 0;
    }

    public StoryEntry getFirstStory() {
        return this.storyEntries.get(0);
    }

    public StoryEntry getLastStory() {
        return this.storyEntries.get(this.storyEntries.size() - 1);
    }

    public boolean hasNewStories() {
        for (int i = 0; i < this.storyEntries.size(); i++) {
            if (!this.storyEntries.get(i).seen) {
                return true;
            }
        }
        return false;
    }

    public StoryEntry getLastLocalStory() {
        for (int i = this.storyEntries.size() - 1; i >= 0; i--) {
            if (this.storyEntries.get(i).local) {
                return this.storyEntries.get(i);
            }
        }
        return null;
    }

    public boolean canComment() {
        if (this.storyEntries.size() > 0) {
            return this.storyEntries.get(0).canComment;
        }
        return false;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeParcelable(this.userProfile, flags);
        dest.writeParcelable(this.group, flags);
        dest.writeTypedList(this.storyEntries);
    }

    protected StoriesContainer(Parcel in) {
        this.userProfile = (UserProfile) in.readParcelable(UserProfile.class.getClassLoader());
        this.group = (Group) in.readParcelable(Group.class.getClassLoader());
        this.storyEntries = in.createTypedArrayList(StoryEntry.CREATOR);
    }
}
