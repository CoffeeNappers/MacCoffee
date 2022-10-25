package com.vkontakte.android;

import android.os.Bundle;
import android.os.Parcel;
import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.util.Screen;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.models.Model;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class UserProfile extends Model implements Serializer.Serializable, Indexable {
    public static final String ID_REGEX = "(id|club)[0-9]+";
    public static final int OFFLINE = 0;
    public static final int ONLINE_MOBILE_APP = 3;
    public static final int ONLINE_MOBILE_SITE = 2;
    public static final int ONLINE_SITE = 1;
    public String bdate;
    public int city;
    public int country;
    public String domain;
    public Bundle extra;
    public boolean f;
    public String firstName;
    public String fullName;
    public boolean isFriend;
    public boolean isSelected;
    public String lastName;
    public int online;
    public String photo;
    public int uid;
    public String university;
    public boolean verified;
    public static final UserProfile EMPTY_USER = new UserProfile();
    public static final Serializer.Creator<UserProfile> CREATOR = new Serializer.CreatorAdapter<UserProfile>() { // from class: com.vkontakte.android.UserProfile.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public UserProfile mo1087createFromSerializer(Serializer in) {
            return new UserProfile(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public UserProfile[] mo1088newArray(int size) {
            return new UserProfile[size];
        }
    };

    public UserProfile() {
        this.firstName = "DELETED";
        this.fullName = "DELETED";
        this.lastName = "DELETED";
        this.photo = "http://vkontakte.ru/images/question_c.gif";
        this.online = 0;
        this.university = "";
        this.bdate = null;
        this.extra = new Bundle();
    }

    public boolean getHasRealDomain() {
        return this.domain != null && !this.domain.isEmpty() && !this.domain.matches(ID_REGEX);
    }

    public UserProfile(UserProfile profile) {
        this.firstName = "DELETED";
        this.fullName = "DELETED";
        this.lastName = "DELETED";
        this.photo = "http://vkontakte.ru/images/question_c.gif";
        this.online = 0;
        this.university = "";
        this.bdate = null;
        this.uid = profile.uid;
        this.firstName = profile.firstName;
        this.fullName = profile.fullName;
        this.lastName = profile.lastName;
        this.photo = profile.photo;
        this.f = profile.f;
        this.isFriend = profile.isFriend;
        this.isSelected = profile.isSelected;
        this.online = profile.online;
        this.city = profile.city;
        this.country = profile.country;
        this.university = profile.university;
        this.bdate = profile.bdate;
        this.domain = profile.domain;
        this.extra = profile.extra;
        this.verified = profile.verified;
    }

    public UserProfile(Serializer in) {
        boolean z = true;
        this.firstName = "DELETED";
        this.fullName = "DELETED";
        this.lastName = "DELETED";
        this.photo = "http://vkontakte.ru/images/question_c.gif";
        this.online = 0;
        this.university = "";
        this.bdate = null;
        this.uid = in.readInt();
        this.firstName = in.readString();
        this.fullName = in.readString();
        this.domain = in.readString();
        this.photo = in.readString();
        this.online = in.readInt();
        this.f = in.readInt() == 1;
        this.isFriend = in.readInt() == 1;
        this.extra = in.readBundle(UserProfile.class.getClassLoader());
        this.verified = in.readByte() == 0 ? false : z;
    }

    public UserProfile(VKAccount vkAccount) {
        String str = null;
        this.firstName = "DELETED";
        this.fullName = "DELETED";
        this.lastName = "DELETED";
        this.photo = "http://vkontakte.ru/images/question_c.gif";
        this.online = 0;
        this.university = "";
        this.bdate = null;
        this.uid = vkAccount.getUid();
        String name = vkAccount.getName();
        if (!TextUtils.isEmpty(name)) {
            String[] sp = name.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, 2);
            this.firstName = sp.length > 0 ? sp[0] : null;
            this.lastName = sp.length > 1 ? sp[1] : str;
        }
        this.fullName = name;
        this.photo = vkAccount.getPhoto();
        this.extra = new Bundle();
    }

    public UserProfile(JSONObject o) throws JSONException {
        String str;
        int g;
        boolean z = true;
        this.firstName = "DELETED";
        this.fullName = "DELETED";
        this.lastName = "DELETED";
        this.photo = "http://vkontakte.ru/images/question_c.gif";
        this.online = 0;
        this.university = "";
        this.bdate = null;
        this.uid = o.getInt("id");
        this.firstName = o.optString("first_name", this.firstName);
        this.lastName = o.optString("last_name", this.lastName);
        this.domain = o.optString("domain");
        this.fullName = this.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.lastName;
        if (Global.displayDensity >= 2.0f || Screen.isTablet()) {
            str = "photo_200";
        } else {
            str = Global.displayDensity > 1.0f ? "photo_100" : "photo_50";
        }
        this.photo = o.optString(str, o.optString("photo_100"));
        this.f = o.optInt("sex") == 1;
        this.online = Global.getUserOnlineStatus(o);
        this.extra = new Bundle();
        if (o.has("first_name_gen")) {
            this.extra.putString("first_name_gen", o.getString("first_name_gen"));
            if (o.has("last_name_gen")) {
                this.extra.putString("name_gen", o.getString("first_name_gen") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + o.getString("last_name_gen"));
            }
        }
        if (o.has("first_name_dat")) {
            this.extra.putString("first_name_dat", o.getString("first_name_dat"));
            if (o.has("last_name_dat")) {
                this.extra.putString("name_dat", o.getString("first_name_dat") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + o.getString("last_name_dat"));
            }
        }
        if (o.has("first_name_acc") && o.has("last_name_acc")) {
            this.extra.putString("first_name_acc", o.getString("first_name_acc"));
            if (o.has("last_name_acc")) {
                this.extra.putString("name_acc", o.getString("first_name_acc") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + o.getString("last_name_acc"));
            }
        }
        if (o.has("first_name_ins") && o.has("last_name_ins")) {
            this.extra.putString("first_name_ins", o.getString("first_name_ins"));
            if (o.has("last_name_ins")) {
                this.extra.putString("name_ins", o.getString("first_name_ins") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + o.getString("last_name_ins"));
            }
        }
        if (o.has("first_name_abl") && o.has("last_name_abl")) {
            this.extra.putString("first_name_abl", o.getString("first_name_abl"));
            if (o.has("last_name_abl")) {
                this.extra.putString("name_abl", o.getString("first_name_abl") + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + o.getString("last_name_abl"));
            }
        }
        if (o.has("university_name") && o.getString("university_name").length() > 0) {
            this.university = o.getString("university_name").trim();
            if (o.has("graduation") && (g = o.getInt("graduation")) > 0) {
                this.university += String.format(" '%02d", Integer.valueOf(g % 100));
            }
        } else if (o.has("city")) {
            JSONObject city = o.getJSONObject("city");
            this.university = city.getString("title");
        }
        if (o.has("verified") && o.getInt("verified") == 1) {
            this.extra.putBoolean("verified", true);
            this.verified = true;
        }
        if (o.has("is_friend")) {
            this.isFriend = o.getInt("is_friend") == 1;
        }
        if (o.has("description")) {
            this.extra.putString("description", o.getString("description"));
        }
        if (o.has("is_messages_blocked")) {
            this.extra.putBoolean("is_messages_blocked", o.getInt("is_messages_blocked") != 1 ? false : z);
        }
    }

    public UserProfile(Group g) {
        this.firstName = "DELETED";
        this.fullName = "DELETED";
        this.lastName = "DELETED";
        this.photo = "http://vkontakte.ru/images/question_c.gif";
        this.online = 0;
        this.university = "";
        this.bdate = null;
        this.fullName = g.name;
        this.photo = g.photo;
        this.uid = -g.id;
        this.domain = g.domain;
        this.verified = g.verified;
    }

    public String getNameInCase(int c) {
        if (getIsGroup()) {
            return this.fullName;
        }
        switch (c) {
            case 0:
                return this.fullName;
            case 1:
                return this.extra.getString("name_gen");
            case 2:
                return this.extra.getString("name_dat");
            case 3:
                return this.extra.getString("name_acc");
            case 4:
                return this.extra.getString("name_ins");
            case 5:
                return this.extra.getString("name_abl");
            case 6:
            case 7:
            case 8:
            case 9:
            default:
                return null;
            case 10:
                return this.firstName;
            case 11:
                return this.extra.getString("first_name_gen");
            case 12:
                return this.extra.getString("first_name_dat");
            case 13:
                return this.extra.getString("first_name_acc");
            case 14:
                return this.extra.getString("first_name_ins");
            case 15:
                return this.extra.getString("first_name_abl");
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel p, int arg1) {
        try {
            serializeTo(Serializer.get(p));
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    public void serializeTo(Serializer p) {
        byte b = 1;
        p.writeInt(this.uid);
        p.writeString(this.firstName);
        p.writeString(this.fullName);
        p.writeString(this.domain);
        p.writeString(this.photo);
        p.writeInt(this.online);
        p.writeInt(this.f ? 1 : 0);
        p.writeInt(this.isFriend ? 1 : 0);
        p.writeBundle(this.extra);
        if (!this.verified) {
            b = 0;
        }
        p.writeByte(b);
    }

    public boolean getIsGroup() {
        return this.uid < 0;
    }

    public String toString() {
        return "User {id=" + this.uid + ", name=" + this.fullName + " [" + this.firstName + CameraUtilsEffects.FILE_DELIM + this.lastName + "], photo=" + this.photo + ", online=" + this.online + ", extra=" + this.extra + ", gender=" + this.f + "}";
    }

    public int hashCode() {
        return this.uid;
    }

    public boolean equals(Object o) {
        if (o instanceof UserProfile) {
            UserProfile p = (UserProfile) o;
            return this.uid == p.uid;
        }
        return false;
    }

    private static char getFirstChar(String s) {
        if (s == null || s.length() == 0) {
            return ' ';
        }
        return Character.toLowerCase(s.charAt(0));
    }

    private static char[] getFirstChars(String s) {
        if (s == null) {
            return new char[]{' '};
        }
        String[] strings = s.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        char[] chars = new char[strings.length];
        for (int i = 0; i < chars.length; i++) {
            chars[i] = getFirstChar(strings[i]);
        }
        return chars;
    }

    private static boolean isWordStartFrom(String s, String q) {
        if (s != null) {
            String[] strings = s.toLowerCase().split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            for (String s1 : strings) {
                if (s1 != null && s1.startsWith(q)) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    @Override // com.vkontakte.android.Indexable
    public char[] getIndexChars() {
        return this.uid > 2000000000 ? getFirstChars(this.fullName) : new char[]{getFirstChar(this.firstName), getFirstChar(this.lastName)};
    }

    @Override // com.vkontakte.android.Indexable
    public boolean matches(String q) {
        if (this.uid > 2000000000) {
            return isWordStartFrom(this.fullName, q);
        }
        return this.fullName.toLowerCase().startsWith(q) || this.firstName.toLowerCase().startsWith(q) || this.lastName.toLowerCase().startsWith(q);
    }
}
