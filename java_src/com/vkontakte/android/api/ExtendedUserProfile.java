package com.vkontakte.android.api;

import android.graphics.RectF;
import android.support.annotation.Nullable;
import com.vk.music.dto.Playlist;
import com.vk.stories.model.GetStoriesResponse;
import com.vkontakte.android.Photo;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.models.GiftItem;
import com.vkontakte.android.api.widget.Widget;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.data.Wiki;
import java.util.ArrayList;
import java.util.HashMap;
/* loaded from: classes2.dex */
public class ExtendedUserProfile {
    public static final int ACCESS_CLOSED = 1;
    public static final int ACCESS_OPEN = 0;
    public static final int ACCESS_PRIVATE = 2;
    public static final int FRIEND_STATUS_FRIENDS = 3;
    public static final int FRIEND_STATUS_NONE = 0;
    public static final int FRIEND_STATUS_RECV_REQUEST = 2;
    public static final int FRIEND_STATUS_SENT_REQUEST = 1;
    public static final int GROUP_STATUS_DECLINED_INVITE = 3;
    public static final int GROUP_STATUS_INVITED = 5;
    public static final int GROUP_STATUS_MEMBER = 1;
    public static final int GROUP_STATUS_NONE = 0;
    public static final int GROUP_STATUS_NOT_SURE = 2;
    public static final int GROUP_STATUS_SENT_REQUEST = 4;
    public static final int MAIN_SECTION_AUDIO = 3;
    public static final int MAIN_SECTION_BOARD = 2;
    public static final int MAIN_SECTION_MARKET = 5;
    public static final int MAIN_SECTION_NONE = 0;
    public static final int MAIN_SECTION_PHOTOS = 1;
    public static final int MAIN_SECTION_STORIES = 6;
    public static final int MAIN_SECTION_VIDEO = 4;
    public static final int TYPE_EVENT = 1;
    public static final int TYPE_GROUP = 0;
    public static final int TYPE_PUBLIC = 2;
    public String about;
    public String activities;
    public String activity;
    public int adminLevel;
    public int alcohol;
    public boolean allPhotosAreHidden;
    public MusicTrack audioStatus;
    public ArrayList<MusicTrack> audios;
    public int bDay;
    public int bMonth;
    public int bYear;
    public BanInfo ban;
    public String bigPhoto;
    public boolean blacklisted;
    public String books;
    public int buttonAppId;
    public String buttonTitle;
    public boolean canCall;
    public boolean canPost;
    public boolean canSeeAllPosts;
    public boolean canSendFriendRequest;
    public boolean canUploadVideo;
    public boolean canWrite;
    public ArrayList<Employer> career;
    public String city;
    public ArrayList<Contact> contacts;
    public HashMap<String, Integer> counters;
    public String country;
    public Photo coverPhoto;
    public Deactivated deactivated;
    public ArrayList<String> displayFields;
    public ArrayList<Document> docs;
    public int eventEndTime;
    public int eventStartTime;
    public long facebookId;
    public String facebookName;
    public String firstNameAcc;
    public String firstNameDat;
    public String firstNameGen;
    public String firstNameIns;
    public int friendStatus;
    public ArrayList<UserProfile> friends;
    public String games;
    @Nullable
    public VKList<GiftItem> gifts;
    public VKList<Good> goods;
    public int groupAccess;
    public int groupType;
    public ArrayList<Group> groups;
    public boolean hasPhoto;
    public String homePhone;
    public String hometown;
    public String infoLine;
    public String inspiredBy;
    public String instagram;
    public String interests;
    public UserProfile invitedBy;
    public boolean isFavorite;
    public boolean isHiddenFromFeed;
    public boolean isLiveEnabled;
    public boolean isLiveSubscribed;
    public boolean isSubscribed;
    public String langs;
    public String lastNameAcc;
    public String lastNameDat;
    public String lastNameGen;
    public String lastNameIns;
    public int lastSeen;
    public boolean lastSeenMobile;
    public double lat;
    public int lifeMain;
    public ArrayList<Link> links;
    public String livejournal;
    public double lon;
    public PhotoAlbum mainAlbum;
    public int mainSection;
    public Wiki marketWiki;
    public String mobilePhone;
    public String movies;
    public String music;
    public int peopleMain;
    public Photo photo;
    public RectF photoRect;
    public VKList<Photo> photos;
    public ArrayList<Playlist> playlists;
    public int political;
    public int postponedCount;
    public UserProfile profile;
    public String quotations;
    public int relation;
    public int relationPartner;
    public String relationPartnerName;
    public String religion;
    public ArrayList<School> schools;
    public String screenName;
    public boolean showAllPosts;
    public String skype;
    public int smoking;
    public GetStoriesResponse storiesResponse;
    public ArrayList<UserProfile> subscriptions;
    public int suggestedCount;
    public ArrayList<BoardTopic> topics;
    public String tv;
    public String twitter;
    public ArrayList<University> universities;
    public boolean verified;
    public ArrayList<VideoFile> videos;
    public String website;
    public Widget widget;
    private boolean hasCover = false;
    @Nullable
    public UserProfile[] relativesParents = null;
    @Nullable
    public UserProfile[] relativesSibling = null;
    @Nullable
    public UserProfile[] relativesChild = null;
    @Nullable
    public UserProfile[] relativesGrandparent = null;
    @Nullable
    public UserProfile[] relativesGrandchild = null;
    public int marketMainAlbumId = -1;

    /* loaded from: classes2.dex */
    public static class BanInfo {
        public String comment;
        public int endTime;
        public int reason;
    }

    /* loaded from: classes2.dex */
    public static class Contact {
        public String email;
        public String phone;
        public String title;
        public UserProfile user;
    }

    /* loaded from: classes2.dex */
    public static class Employer {
        public String city;
        public Group group;
        public String position;
        public String title;
        public int yearFrom;
        public int yearTo;
    }

    /* loaded from: classes2.dex */
    public static class Link {
        public String photo;
        public String subtitle;
        public String title;
        public String url;
    }

    /* loaded from: classes2.dex */
    public static class School {
        public String city;
        public String className;
        public int from;
        public int graduation;
        public String name;
        public String speciality;
        public int to;
        public String type;
    }

    /* loaded from: classes2.dex */
    public static class University {
        public String chair;
        public String city;
        public String faculty;
        public int graduation;
        public String name;
    }

    public boolean hasWidget() {
        return this.widget != null;
    }

    public boolean hasValidStories() {
        return this.storiesResponse != null && this.storiesResponse.storiesResponse.size() > 0 && this.storiesResponse.storiesResponse.get(0).hasValidStories();
    }

    public boolean hasCounter(String key) {
        return "stories".equals(key) ? hasValidStories() : this.counters.containsKey(key);
    }

    public int getCounter(String key) {
        if ("stories".equals(key)) {
            if (!hasValidStories()) {
                return 0;
            }
            return this.storiesResponse.storiesResponse.get(0).storyEntries.size();
        } else if (!this.counters.containsKey(key)) {
            return 0;
        } else {
            return this.counters.get(key).intValue();
        }
    }

    /* loaded from: classes2.dex */
    public enum Deactivated {
        Banned,
        Deleted;

        @Nullable
        public static Deactivated parse(@Nullable String reason) {
            String valueOf = String.valueOf(reason);
            char c = 65535;
            switch (valueOf.hashCode()) {
                case -1396343010:
                    if (valueOf.equals(Group.DEACTIVATION_BANNED)) {
                        c = 0;
                        break;
                    }
                    break;
                case 1550463001:
                    if (valueOf.equals(Group.DEACTIVATION_DELETED)) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    return Banned;
                case 1:
                    return Deleted;
                default:
                    return null;
            }
        }
    }

    public boolean isDeactivated() {
        return this.deactivated != null;
    }

    public boolean hasCover() {
        return this.hasCover && !isDeactivated();
    }

    public void setHasCover(boolean hasCover) {
        this.hasCover = hasCover;
    }
}
