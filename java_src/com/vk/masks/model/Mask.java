package com.vk.masks.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.vk.masks.MasksController;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Mask implements Parcelable {
    private static final int deviceVkEngineVersion = 1;
    public long createTime;
    public DisableReason disableReason;
    public int engineVersion;
    public int id;
    public boolean isNew;
    public String name;
    public Group ownerGroup;
    public int ownerId;
    public UserProfile ownerProfile;
    public String preview;
    public int sectionId;
    public long updateTime;
    public String url;
    public String userHint;
    public int vkEngineVersion;
    private static final int deviceEngineVersion = MasksController.getInstance().getMasksEngineVersion();
    public static final Parcelable.Creator<Mask> CREATOR = new Parcelable.Creator<Mask>() { // from class: com.vk.masks.model.Mask.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Mask mo489createFromParcel(Parcel source) {
            return new Mask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Mask[] mo490newArray(int size) {
            return new Mask[size];
        }
    };

    public Mask(JSONObject jsonObject) {
        this.id = jsonObject.optInt("id");
        this.ownerId = jsonObject.optInt("owner_id");
        this.name = jsonObject.optString("name");
        this.sectionId = jsonObject.optInt("section_id");
        this.updateTime = jsonObject.optLong("update_time");
        this.createTime = jsonObject.optLong("create_time");
        this.url = jsonObject.optString("url");
        this.preview = jsonObject.optJSONObject("preview").optString("preview_300");
        this.isNew = jsonObject.optBoolean("is_new");
        this.engineVersion = jsonObject.optInt("engine_version");
        this.vkEngineVersion = jsonObject.optInt("vk_engine_version");
        this.userHint = jsonObject.optString("hint");
        JSONObject disableJson = jsonObject.optJSONObject("disabled");
        if (disableJson != null) {
            this.disableReason = new DisableReason(disableJson);
        }
    }

    public boolean hasHint() {
        return !TextUtils.isEmpty(this.userHint);
    }

    public boolean hasAuthor() {
        return (this.ownerProfile == null && this.ownerGroup == null) ? false : true;
    }

    public String getAuthorAvatarUrl() {
        if (this.ownerProfile != null) {
            return this.ownerProfile.photo;
        }
        if (this.ownerGroup != null) {
            return this.ownerGroup.photo;
        }
        return null;
    }

    public String getAuthorName() {
        if (this.ownerProfile != null) {
            return this.ownerProfile.fullName;
        }
        if (this.ownerGroup != null) {
            return this.ownerGroup.name;
        }
        return "";
    }

    public boolean isDisabled() {
        return this.disableReason != null;
    }

    public boolean isSupported() {
        return deviceEngineVersion >= this.engineVersion && 1 >= this.vkEngineVersion;
    }

    public String getFullId() {
        return this.ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.id;
    }

    public JSONObject toJson() throws JSONException {
        JSONObject jo = new JSONObject();
        jo.put("id", this.id);
        jo.put("owner_id", this.ownerId);
        jo.put("name", this.name);
        jo.put("section_id", this.sectionId);
        jo.put("update_time", this.updateTime);
        jo.put("create_time", this.createTime);
        jo.put("url", this.url);
        jo.put("preview", new JSONObject().put("preview_300", this.preview));
        jo.put("is_new", this.isNew);
        jo.put("engine_version", this.engineVersion);
        jo.put("vk_engine_version", this.vkEngineVersion);
        jo.put("hint", this.userHint);
        return jo;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Mask mask = (Mask) o;
        return this.id == mask.id;
    }

    public int hashCode() {
        int result = this.id;
        return (result * 31) + this.ownerId;
    }

    /* loaded from: classes2.dex */
    public static class DisableReason implements Parcelable {
        public static final Parcelable.Creator<DisableReason> CREATOR = new Parcelable.Creator<DisableReason>() { // from class: com.vk.masks.model.Mask.DisableReason.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public DisableReason mo491createFromParcel(Parcel source) {
                return new DisableReason(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public DisableReason[] mo492newArray(int size) {
                return new DisableReason[size];
            }
        };
        public String subtitle;
        public String title;
        public String url;

        public DisableReason(JSONObject jo) {
            if (jo.has("reason")) {
                this.subtitle = jo.optString("reason");
            } else {
                this.title = jo.optString("title");
                this.subtitle = jo.optString("subtitle");
            }
            this.url = jo.optString("url");
        }

        public boolean hasUrl() {
            return !TextUtils.isEmpty(this.url);
        }

        public boolean hasTitle() {
            return !TextUtils.isEmpty(this.title);
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.title);
            dest.writeString(this.subtitle);
            dest.writeString(this.url);
        }

        protected DisableReason(Parcel in) {
            this.title = in.readString();
            this.subtitle = in.readString();
            this.url = in.readString();
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeParcelable(this.ownerProfile, flags);
        dest.writeParcelable(this.ownerGroup, flags);
        dest.writeInt(this.id);
        dest.writeInt(this.ownerId);
        dest.writeString(this.name);
        dest.writeInt(this.sectionId);
        dest.writeLong(this.updateTime);
        dest.writeLong(this.createTime);
        dest.writeString(this.url);
        dest.writeString(this.preview);
        dest.writeByte(this.isNew ? (byte) 1 : (byte) 0);
        dest.writeInt(this.engineVersion);
        dest.writeInt(this.vkEngineVersion);
        dest.writeParcelable(this.disableReason, flags);
        dest.writeString(this.userHint);
    }

    protected Mask(Parcel in) {
        this.ownerProfile = (UserProfile) in.readParcelable(UserProfile.class.getClassLoader());
        this.ownerGroup = (Group) in.readParcelable(Group.class.getClassLoader());
        this.id = in.readInt();
        this.ownerId = in.readInt();
        this.name = in.readString();
        this.sectionId = in.readInt();
        this.updateTime = in.readLong();
        this.createTime = in.readLong();
        this.url = in.readString();
        this.preview = in.readString();
        this.isNew = in.readByte() != 0;
        this.engineVersion = in.readInt();
        this.vkEngineVersion = in.readInt();
        this.disableReason = (DisableReason) in.readParcelable(DisableReason.class.getClassLoader());
        this.userHint = in.readString();
    }
}
