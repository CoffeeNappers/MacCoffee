package com.vk.sharing.action;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
/* loaded from: classes2.dex */
public final class ActionsInfo implements Parcelable {
    public static final Parcelable.Creator<ActionsInfo> CREATOR = new Parcelable.Creator<ActionsInfo>() { // from class: com.vk.sharing.action.ActionsInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ActionsInfo mo521createFromParcel(Parcel source) {
            return new ActionsInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ActionsInfo[] mo522newArray(int size) {
            return new ActionsInfo[size];
        }
    };
    private static final int FLAG_CAN_COPY_LINK = 4;
    private static final int FLAG_CAN_POST_GROUP_WALL = 2;
    private static final int FLAG_CAN_POST_USER_WALL = 1;
    private static final int FLAG_CAN_SHARE_EXTERNAL = 8;
    private final String comment;
    private final int flags;

    private ActionsInfo(int flags, String comment) {
        this.flags = flags;
        this.comment = comment == null ? "" : comment;
    }

    private ActionsInfo(Parcel in) {
        this.flags = in.readInt();
        this.comment = in.readString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.flags);
        dest.writeString(this.comment);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean canRepost() {
        return (this.flags & 1) > 0;
    }

    public boolean canPostGroup() {
        return (this.flags & 2) > 0;
    }

    public boolean canExtractLink() {
        return (this.flags & 4) > 0;
    }

    public boolean canShareExternal() {
        return (this.flags & 8) > 0;
    }

    public boolean haveComment() {
        return this.comment != null && !this.comment.isEmpty();
    }

    public String getComment() {
        return this.comment;
    }

    public boolean canAtLeastOneAction() {
        return canRepost() || canPostGroup() || canExtractLink() || canShareExternal();
    }

    /* loaded from: classes2.dex */
    public static final class Builder {
        private boolean postUserWall = true;
        private boolean postGroupWall = true;
        private boolean copyLink = true;
        private boolean shareExt = true;
        private String comment = null;

        @NonNull
        public Builder postUserWall(boolean postUserWall) {
            this.postUserWall = postUserWall;
            return this;
        }

        @NonNull
        public Builder postGroupWall(boolean postGroupWall) {
            this.postGroupWall = postGroupWall;
            return this;
        }

        @NonNull
        public Builder copyLink(boolean copyLink) {
            this.copyLink = copyLink;
            return this;
        }

        @NonNull
        public Builder shareExternal(boolean shareExt) {
            this.shareExt = shareExt;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @NonNull
        public Builder disableAllActions() {
            postUserWall(false);
            postGroupWall(false);
            copyLink(false);
            shareExternal(false);
            return this;
        }

        @NonNull
        public Builder predefineComment(String comment) {
            this.comment = comment;
            return this;
        }

        @NonNull
        public ActionsInfo build() {
            int flags = 0;
            if (this.postUserWall) {
                flags = 0 | 1;
            }
            if (this.postGroupWall) {
                flags |= 2;
            }
            if (this.copyLink) {
                flags |= 4;
            }
            if (this.shareExt) {
                flags |= 8;
            }
            return new ActionsInfo(flags, this.comment);
        }
    }
}
