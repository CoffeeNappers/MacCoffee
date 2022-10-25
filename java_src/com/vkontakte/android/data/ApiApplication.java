package com.vkontakte.android.data;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.vk.core.util.AnimationUtils;
import com.vkontakte.android.GCMBroadcastReceiver;
import com.vkontakte.android.Log;
import com.vkontakte.android.Photo;
import com.vkontakte.android.VKApplication;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ApiApplication implements Parcelable, ServerKeys {
    public static final int LEADERBOARD_TYPE_LEVEL = 1;
    public static final int LEADERBOARD_TYPE_NOT_SUPPORTED = 0;
    public static final int LEADERBOARD_TYPE_POINTS = 2;
    public static final int SCREEN_ORIENTATION_BOTH = 0;
    public static final int SCREEN_ORIENTATION_LANDSCAPE = 1;
    public static final int SCREEN_ORIENTATION_PORTRAIT = 2;
    public int author_group;
    public String banner;
    public String bannerBig;
    public CatalogInfo catalogInfo;
    public String description;
    public int friends;
    public ArrayList<String> friendsPhotos;
    public String genre;
    public Photo icon;
    public int id;
    public boolean installed;
    public boolean installedOnDevice;
    public boolean isHtml5App;
    public boolean isInCatalog;
    public boolean isNew;
    public int leaderboardType;
    public int members;
    public int notificationCount;
    public boolean notificationsEnabled;
    public String packageName;
    public int screenOrientation;
    public ArrayList<Photo> screenshot;
    public String shortDescription;
    public String title;
    private static final int[] ICON_SIZES = {75, 139, AnimationUtils.DELAY_MID, 278, GCMBroadcastReceiver.ID_VALIDATE_ACTION_NOTIFICATION_FIRST, 1120};
    public static final Parcelable.Creator<ApiApplication> CREATOR = new Parcelable.Creator<ApiApplication>() { // from class: com.vkontakte.android.data.ApiApplication.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ApiApplication mo954createFromParcel(Parcel source) {
            return new ApiApplication(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ApiApplication[] mo955newArray(int size) {
            return new ApiApplication[size];
        }
    };

    public ApiApplication() {
        this.isNew = true;
        this.screenshot = null;
        this.author_group = 0;
        this.installed = false;
        this.installedOnDevice = false;
        this.isInCatalog = false;
        this.isHtml5App = false;
        this.notificationCount = 0;
        this.catalogInfo = null;
        this.friendsPhotos = new ArrayList<>();
    }

    public ApiApplication(JSONObject o) {
        int[] iArr;
        boolean z = true;
        this.isNew = true;
        this.screenshot = null;
        this.author_group = 0;
        this.installed = false;
        this.installedOnDevice = false;
        this.isInCatalog = false;
        this.isHtml5App = false;
        this.notificationCount = 0;
        this.catalogInfo = null;
        this.friendsPhotos = new ArrayList<>();
        try {
            this.id = o.getInt("id");
            this.title = o.getString("title");
            this.description = o.optString("description");
            this.shortDescription = generateShortDescription(this.description);
            this.icon = new Photo();
            for (int ICON_SIZE : ICON_SIZES) {
                Photo.Image image = new Photo.Image();
                this.icon.sizes.add(image);
                image.height = ICON_SIZE;
                image.width = ICON_SIZE;
                image.url = o.optString("icon_" + ICON_SIZE);
            }
            this.packageName = o.optString(ServerKeys.PLATFORM_ID);
            this.isNew = o.optInt("new") == 1;
            this.members = o.optInt(ServerKeys.MEMBERS_COUNT);
            this.banner = o.optString(ServerKeys.BANNER_560);
            this.bannerBig = o.optString(ServerKeys.BANNER_1120);
            this.genre = o.optString(ServerKeys.GENRE, "No Genre");
            this.notificationsEnabled = o.optInt(ServerKeys.PUSH_ENABLE) == 1;
            if (o.has("friends")) {
                this.friends = o.getJSONArray("friends").length();
            }
            JSONArray jsonArray = o.optJSONArray(ServerKeys.SCREENSHOTS);
            if (jsonArray != null) {
                this.screenshot = new ArrayList<>(jsonArray.length());
                for (int i = 0; i < jsonArray.length(); i++) {
                    this.screenshot.add(new Photo(jsonArray.getJSONObject(i)));
                }
            }
            this.author_group = o.optInt(ServerKeys.AUTHOR_GROUP, 0);
            this.installed = o.optBoolean(ServerKeys.INSTALLED);
            this.installedOnDevice = Games.isAppInstalledOnDevice(this.packageName, VKApplication.context);
            this.isInCatalog = o.optInt("is_in_catalog", 0) != 0;
            this.isHtml5App = o.optInt("is_html5_app", 0) == 0 ? false : z;
            this.screenOrientation = o.optInt("screen_orientation");
            this.leaderboardType = o.optInt("leaderboard_type");
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }

    private static String generateShortDescription(@Nullable String description) {
        if (description == null) {
            return null;
        }
        char[] chars = {'.', '!', '?', ';'};
        int count = 0;
        for (int i = 0; i < description.length(); i++) {
            int length = chars.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    break;
                }
                char aChar = chars[i2];
                if (aChar != description.charAt(i)) {
                    i2++;
                } else {
                    count++;
                    break;
                }
            }
            if (count >= 1) {
                return description.substring(0, i + 1);
            }
        }
        return description;
    }

    public boolean equals(Object o) {
        return (o instanceof ApiApplication) && this.id == ((ApiApplication) o).id;
    }

    public int hashCode() {
        return this.id;
    }

    public String toString() {
        return "ApiApplication_" + Integer.toHexString(super.hashCode()) + "_{id=" + this.id + ", title='" + this.title + "', description='" + this.description + "', packageName='" + this.packageName + "', members=" + this.members + '}';
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        dest.writeInt(this.id);
        dest.writeString(this.title);
        dest.writeParcelable(this.icon, flags);
        dest.writeString(this.banner);
        dest.writeString(this.bannerBig);
        dest.writeString(this.description);
        dest.writeString(this.shortDescription);
        dest.writeInt(this.members);
        dest.writeInt(this.friends);
        dest.writeString(this.packageName);
        dest.writeString(this.genre);
        dest.writeByte(this.isNew ? (byte) 1 : (byte) 0);
        dest.writeByte(this.notificationsEnabled ? (byte) 1 : (byte) 0);
        dest.writeInt(this.notificationCount);
        dest.writeTypedList(this.screenshot);
        dest.writeInt(this.author_group);
        dest.writeByte(this.installed ? (byte) 1 : (byte) 0);
        dest.writeByte(this.installedOnDevice ? (byte) 1 : (byte) 0);
        dest.writeParcelable(this.catalogInfo, flags);
        dest.writeByte(this.isInCatalog ? (byte) 1 : (byte) 0);
        if (!this.isHtml5App) {
            b = 0;
        }
        dest.writeByte(b);
        dest.writeInt(this.screenOrientation);
        dest.writeInt(this.leaderboardType);
    }

    private ApiApplication(Parcel in) {
        boolean z = true;
        this.isNew = true;
        this.screenshot = null;
        this.author_group = 0;
        this.installed = false;
        this.installedOnDevice = false;
        this.isInCatalog = false;
        this.isHtml5App = false;
        this.notificationCount = 0;
        this.catalogInfo = null;
        this.friendsPhotos = new ArrayList<>();
        this.id = in.readInt();
        this.title = in.readString();
        this.icon = (Photo) in.readParcelable(Photo.class.getClassLoader());
        this.banner = in.readString();
        this.bannerBig = in.readString();
        this.description = in.readString();
        this.shortDescription = in.readString();
        this.members = in.readInt();
        this.friends = in.readInt();
        this.packageName = in.readString();
        this.genre = in.readString();
        this.isNew = in.readByte() != 0;
        this.notificationsEnabled = in.readByte() != 0;
        this.notificationCount = in.readInt();
        this.screenshot = in.createTypedArrayList(Photo.CREATOR);
        this.author_group = in.readInt();
        this.installed = in.readByte() != 0;
        this.installedOnDevice = in.readByte() != 0;
        this.catalogInfo = (CatalogInfo) in.readParcelable(CatalogInfo.class.getClassLoader());
        this.isInCatalog = in.readByte() != 0;
        this.isHtml5App = in.readByte() == 0 ? false : z;
        this.screenOrientation = in.readInt();
        this.leaderboardType = in.readInt();
    }
}
