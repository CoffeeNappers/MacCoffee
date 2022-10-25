package com.vk.stories.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseArray;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GetStoriesResponse implements Parcelable {
    public final int count;
    public final JSONObject originalJsonObject;
    public final ArrayList<StoriesContainer> storiesResponse;
    public static final Comparator<StoryEntry> DATE_STORY_COMPARATOR = new Comparator<StoryEntry>() { // from class: com.vk.stories.model.GetStoriesResponse.1
        @Override // java.util.Comparator
        public int compare(StoryEntry storyEntry, StoryEntry t1) {
            if (storyEntry.date < t1.date) {
                return -1;
            }
            if (storyEntry.date > t1.date) {
                return 1;
            }
            return 0;
        }
    };
    public static final Parcelable.Creator<GetStoriesResponse> CREATOR = new Parcelable.Creator<GetStoriesResponse>() { // from class: com.vk.stories.model.GetStoriesResponse.2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GetStoriesResponse mo534createFromParcel(Parcel source) {
            return new GetStoriesResponse(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GetStoriesResponse[] mo535newArray(int size) {
            return new GetStoriesResponse[size];
        }
    };

    public GetStoriesResponse(JSONObject jsonObject) {
        this.storiesResponse = new ArrayList<>();
        this.originalJsonObject = jsonObject;
        if (jsonObject == null) {
            this.count = 0;
            return;
        }
        this.count = jsonObject.optInt(ServerKeys.COUNT);
        SparseArray<UserProfile> profiles = new SparseArray<>();
        parseProfiles(profiles, jsonObject.optJSONArray("profiles"));
        SparseArray<Group> groups = new SparseArray<>();
        parseGroups(groups, jsonObject.optJSONArray("groups"));
        JSONArray allStories = jsonObject.optJSONArray(ServerKeys.ITEMS);
        if (allStories != null) {
            for (int i = 0; i < allStories.length(); i++) {
                try {
                    JSONArray userStories = allStories.getJSONArray(i);
                    if (userStories != null && userStories.length() > 0) {
                        ArrayList<StoryEntry> localStories = new ArrayList<>();
                        for (int j = 0; j < userStories.length(); j++) {
                            JSONObject jo = userStories.optJSONObject(j);
                            if (jo != null) {
                                localStories.add(new StoryEntry(jo));
                            }
                        }
                        Collections.sort(localStories, DATE_STORY_COMPARATOR);
                        if (localStories.size() > 0) {
                            int uid = localStories.get(0).ownerId;
                            if (uid > 0) {
                                this.storiesResponse.add(new StoriesContainer(profiles.get(uid), localStories));
                            } else {
                                this.storiesResponse.add(new StoriesContainer(groups.get(-uid), localStories));
                            }
                        }
                    }
                } catch (Exception e) {
                    JSONObject story = allStories.optJSONObject(i);
                    if (story != null) {
                        ArrayList<StoryEntry> localStories2 = new ArrayList<>();
                        localStories2.add(new StoryEntry(story));
                        if (localStories2.size() > 0) {
                            int uid2 = localStories2.get(0).ownerId;
                            if (uid2 < 0) {
                                Group group = groups.get(-uid2);
                                if (group != null) {
                                    this.storiesResponse.add(new StoriesContainer(group, localStories2));
                                }
                            } else {
                                UserProfile p = profiles.get(uid2);
                                if (p != null) {
                                    this.storiesResponse.add(new StoriesContainer(p, localStories2));
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private void parseProfiles(SparseArray<UserProfile> profiles, JSONArray profilesJson) {
        if (profilesJson != null) {
            for (int i = 0; i < profilesJson.length(); i++) {
                JSONObject jo = profilesJson.optJSONObject(i);
                if (jo != null) {
                    try {
                        UserProfile up = new UserProfile(jo);
                        if (up != null) {
                            profiles.put(up.uid, up);
                        }
                    } catch (JSONException e) {
                    }
                }
            }
        }
    }

    private void parseGroups(SparseArray<Group> groups, JSONArray groupsJson) {
        if (groupsJson != null) {
            for (int i = 0; i < groupsJson.length(); i++) {
                JSONObject jo = groupsJson.optJSONObject(i);
                if (jo != null) {
                    try {
                        Group up = new Group(jo);
                        if (up != null) {
                            groups.put(up.id, up);
                        }
                    } catch (Exception e) {
                    }
                }
            }
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.count);
        dest.writeTypedList(this.storiesResponse);
    }

    protected GetStoriesResponse(Parcel in) {
        this.storiesResponse = new ArrayList<>();
        this.originalJsonObject = null;
        this.count = in.readInt();
        this.storiesResponse.addAll(in.createTypedArrayList(StoriesContainer.CREATOR));
    }
}
