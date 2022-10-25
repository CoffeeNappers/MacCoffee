package com.vk.sharing.target;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Indexable;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
/* loaded from: classes2.dex */
public final class Target implements Parcelable, Indexable {
    public static final Parcelable.Creator<Target> CREATOR = new Parcelable.Creator<Target>() { // from class: com.vk.sharing.target.Target.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public Target mo527createFromParcel(Parcel source) {
            return new Target(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public Target[] mo528newArray(int size) {
            return new Target[size];
        }
    };
    public int id;
    public String insName;
    private boolean isPrivate;
    private boolean isUser;
    public String name;
    public String photoUrl;
    public boolean selected;

    public boolean getIsUser() {
        return this.isUser;
    }

    public boolean getIsPrivate() {
        return this.isPrivate;
    }

    public Target(@NonNull Target target) {
        this.id = target.id;
        this.name = target.name;
        this.insName = target.insName;
        this.photoUrl = target.photoUrl;
        this.selected = target.selected;
        this.isUser = target.getIsUser();
        this.isPrivate = target.getIsPrivate();
    }

    public Target(@NonNull UserProfile profile) {
        this.id = profile.uid;
        this.name = profile.fullName;
        String insName = profile.getNameInCase(4);
        if (insName != null) {
            this.insName = insName;
        } else {
            this.insName = this.name;
        }
        this.photoUrl = profile.photo;
        this.isUser = true;
    }

    public Target(@NonNull Group group) {
        boolean z = false;
        this.id = group.id;
        this.name = group.name;
        this.insName = group.name;
        this.photoUrl = group.photo;
        this.isUser = false;
        this.isPrivate = group.isClosed == 2 ? true : z;
    }

    private Target(@NonNull Parcel in) {
        boolean z = true;
        this.id = in.readInt();
        this.name = in.readString();
        this.insName = in.readString();
        this.photoUrl = in.readString();
        this.selected = in.readByte() == 1;
        this.isUser = in.readByte() == 1;
        this.isPrivate = in.readByte() != 1 ? false : z;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        int i = 1;
        dest.writeInt(this.id);
        dest.writeString(this.name);
        dest.writeString(this.insName);
        dest.writeString(this.photoUrl);
        dest.writeByte((byte) (this.selected ? 1 : 0));
        dest.writeByte((byte) (this.isUser ? 1 : 0));
        if (!this.isPrivate) {
            i = 0;
        }
        dest.writeByte((byte) i);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String toString() {
        return this.name;
    }

    @Override // com.vkontakte.android.Indexable
    public char[] getIndexChars() {
        if (this.name == null) {
            return new char[]{' '};
        }
        String[] strings = this.name.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        char[] chars = new char[strings.length];
        for (int i = 0; i < chars.length; i++) {
            chars[i] = TextUtils.isEmpty(strings[i]) ? ' ' : Character.toLowerCase(strings[i].charAt(0));
        }
        return chars;
    }

    @Override // com.vkontakte.android.Indexable
    public boolean matches(String q) {
        if (q != null) {
            String[] strings = q.toLowerCase().split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            for (String s1 : strings) {
                if (s1 != null && s1.startsWith(q)) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Target target = (Target) o;
        return this.id == target.id;
    }

    public int hashCode() {
        return this.id;
    }
}
