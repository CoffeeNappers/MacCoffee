package com.vkontakte.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.Indexable;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.models.Model;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class Group extends Model implements Indexable, Parcelable {
    public static final int ADMIN_LEVEL_ADMIN = 3;
    public static final int ADMIN_LEVEL_EDITOR = 2;
    public static final int ADMIN_LEVEL_MODERATOR = 1;
    public static final int ADMIN_LEVEL_NONE = 0;
    public static final int CLOSED_GROUP = 1;
    public static final Parcelable.Creator<Group> CREATOR = new Parcelable.Creator<Group>() { // from class: com.vkontakte.android.api.Group.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Group mo576createFromParcel(Parcel source) {
            return new Group(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Group[] mo577newArray(int size) {
            return new Group[size];
        }
    };
    public static final String DEACTIVATION_BANNED = "banned";
    public static final String DEACTIVATION_DELETED = "deleted";
    public static final int OPEN_GROUP = 0;
    public static final int PRIVATE_GROUP = 2;
    public static final int TYPE_EVENT = 1;
    public static final int TYPE_GROUP = 0;
    public static final int TYPE_PUBLIC = 2;
    public String activity;
    public int adminLevel;
    public boolean canMessage;
    public String deactivation;
    public String domain;
    public int id;
    public boolean isAdmin;
    public int isClosed;
    public int members_count;
    public boolean messagesBlocked;
    public String name;
    public String photo;
    public int startTime;
    public String stringMembersCount;
    public int type;
    public boolean verified;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Authority {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Deactivation {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Privacy {
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Type {
    }

    public Group() {
    }

    public Group(JSONObject gr) {
        String str;
        boolean z = true;
        try {
            this.id = gr.getInt("id");
            this.name = gr.getString("name");
            this.domain = gr.optString("screen_name");
            this.activity = gr.optString("activity");
            this.isAdmin = gr.optInt(ArgKeys.IS_ADMIN, 0) > 0;
            this.adminLevel = gr.optInt("admin_level");
            this.isClosed = gr.getInt(ArgKeys.IS_CLOSED);
            this.deactivation = gr.optString("deactivated");
            if (Global.displayDensity >= 2.0f || Screen.isTablet()) {
                str = "photo_200";
            } else {
                str = Global.displayDensity > 1.0f ? "photo_100" : "photo_50";
            }
            this.photo = gr.optString(str, gr.getString("photo_100"));
            this.type = 0;
            this.startTime = gr.optInt(FirebaseAnalytics.Param.START_DATE);
            this.adminLevel = gr.optInt("admin_level");
            this.canMessage = gr.optInt("can_message", 1) != 0;
            this.messagesBlocked = gr.optInt("is_messages_blocked", 0) != 0;
            if ("event".equals(gr.optString(ServerKeys.TYPE))) {
                this.type = 1;
            }
            if ("page".equals(gr.optString(ServerKeys.TYPE))) {
                this.type = 2;
            }
            this.members_count = gr.optInt(ServerKeys.MEMBERS_COUNT);
            this.verified = gr.optInt("verified", 0) != 1 ? false : z;
        } catch (Exception x) {
            Log.w("vk", "Error parsing group", x);
        }
    }

    public String toString() {
        return this.name;
    }

    @Override // com.vkontakte.android.Indexable
    public char[] getIndexChars() {
        String[] words = this.name.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        char[] result = new char[words.length];
        for (int i = 0; i < words.length; i++) {
            String word = words[i];
            int length = word.length();
            if (length != 0) {
                int j = 0;
                while (true) {
                    if (j < length) {
                        char letter = word.charAt(j);
                        if (!Character.isLetterOrDigit(letter)) {
                            j++;
                        } else {
                            result[i] = Character.toLowerCase(letter);
                            break;
                        }
                    }
                }
            }
        }
        return result;
    }

    @Override // com.vkontakte.android.Indexable
    public boolean matches(String q) {
        return this.name.toLowerCase().contains(q);
    }

    public Group(Parcel parcel) {
        boolean z = true;
        this.id = parcel.readInt();
        this.name = parcel.readString();
        this.photo = parcel.readString();
        this.domain = parcel.readString();
        this.isAdmin = parcel.readByte() != 0;
        this.isClosed = parcel.readInt();
        this.deactivation = parcel.readString();
        this.type = parcel.readInt();
        this.startTime = parcel.readInt();
        this.adminLevel = parcel.readInt();
        this.canMessage = parcel.readByte() != 0;
        this.members_count = parcel.readInt();
        this.verified = parcel.readByte() != 0;
        this.activity = parcel.readString();
        this.stringMembersCount = parcel.readString();
        this.messagesBlocked = parcel.readByte() == 0 ? false : z;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        dest.writeInt(this.id);
        dest.writeString(this.name);
        dest.writeString(this.photo);
        dest.writeString(this.domain);
        dest.writeByte(this.isAdmin ? (byte) 1 : (byte) 0);
        dest.writeInt(this.isClosed);
        dest.writeString(this.deactivation);
        dest.writeInt(this.type);
        dest.writeInt(this.startTime);
        dest.writeInt(this.adminLevel);
        dest.writeByte(this.canMessage ? (byte) 1 : (byte) 0);
        dest.writeInt(this.members_count);
        dest.writeByte(this.verified ? (byte) 1 : (byte) 0);
        dest.writeString(this.activity);
        dest.writeString(this.stringMembersCount);
        if (!this.messagesBlocked) {
            b = 0;
        }
        dest.writeByte(b);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Group group = (Group) o;
        return this.id == group.id;
    }

    public int hashCode() {
        return this.id;
    }
}
