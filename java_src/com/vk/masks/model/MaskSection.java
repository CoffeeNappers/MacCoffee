package com.vk.masks.model;

import android.os.Parcel;
import android.os.Parcelable;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MaskSection implements Parcelable {
    public static final int RECENT_SECTION_ID = -1;
    public boolean hasNew;
    public String icon;
    public int id;
    public static final MaskSection RECENT_SECTION = new MaskSection(-1, null, false);
    public static final Parcelable.Creator<MaskSection> CREATOR = new Parcelable.Creator<MaskSection>() { // from class: com.vk.masks.model.MaskSection.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public MaskSection mo493createFromParcel(Parcel source) {
            return new MaskSection(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public MaskSection[] mo494newArray(int size) {
            return new MaskSection[size];
        }
    };

    public MaskSection(int id, String icon, boolean hasNew) {
        this.id = id;
        this.icon = icon;
        this.hasNew = hasNew;
    }

    public MaskSection(JSONObject jsonObject) {
        this.id = jsonObject.optInt("id");
        this.icon = jsonObject.optString(SettingsJsonConstants.APP_ICON_KEY);
        this.hasNew = jsonObject.optBoolean("has_new");
    }

    public JSONObject toJson() throws JSONException {
        JSONObject jo = new JSONObject();
        jo.put("id", this.id);
        jo.put(SettingsJsonConstants.APP_ICON_KEY, this.icon);
        jo.put("has_new", this.hasNew);
        return jo;
    }

    public boolean isRecentSection() {
        return this.id == -1;
    }

    public String toString() {
        return "MaskSection{id=" + this.id + ", icon='" + this.icon + "', hasNew=" + this.hasNew + '}';
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.id);
        dest.writeString(this.icon);
        dest.writeByte(this.hasNew ? (byte) 1 : (byte) 0);
    }

    protected MaskSection(Parcel in) {
        this.id = in.readInt();
        this.icon = in.readString();
        this.hasNew = in.readByte() != 0;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MaskSection that = (MaskSection) o;
        return this.id == that.id;
    }

    public int hashCode() {
        return this.id;
    }
}
