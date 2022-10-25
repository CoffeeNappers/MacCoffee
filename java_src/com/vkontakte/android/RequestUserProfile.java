package com.vkontakte.android;

import com.vkontakte.android.utils.Serializer;
/* loaded from: classes2.dex */
public class RequestUserProfile extends UserProfile {
    public static final Serializer.Creator<RequestUserProfile> CREATOR = new Serializer.CreatorAdapter<RequestUserProfile>() { // from class: com.vkontakte.android.RequestUserProfile.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public RequestUserProfile mo1087createFromSerializer(Serializer in) {
            return new RequestUserProfile(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public RequestUserProfile[] mo1088newArray(int size) {
            return new RequestUserProfile[size];
        }
    };
    public String info;
    public boolean isOutgoing;
    public boolean isSuggesting;
    public String message;
    public UserProfile[] mutualFriends;
    public int numMutualFriends;
    public Boolean sent;

    public RequestUserProfile(UserProfile profile) {
        super(profile);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RequestUserProfile(Serializer in) {
        super(in);
        Boolean valueOf;
        boolean z = true;
        this.message = in.readString();
        int sentVal = in.readByte();
        if (sentVal == -1) {
            valueOf = null;
        } else {
            valueOf = Boolean.valueOf(sentVal == 1);
        }
        this.sent = valueOf;
        this.info = in.readString();
        int size = in.readInt();
        this.mutualFriends = new UserProfile[size];
        for (int i = 0; i < size; i++) {
            this.mutualFriends[i] = (UserProfile) in.readSerializable(UserProfile.class.getClassLoader());
        }
        this.numMutualFriends = in.readInt();
        this.isOutgoing = in.readByte() == 1;
        this.isSuggesting = in.readByte() != 1 ? false : z;
    }

    @Override // com.vkontakte.android.UserProfile, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        byte b;
        byte b2 = 1;
        super.serializeTo(p);
        p.writeString(this.message);
        if (this.sent == null) {
            b = -1;
        } else {
            b = this.sent.booleanValue() ? (byte) 1 : (byte) 0;
        }
        p.writeByte(b);
        p.writeString(this.info);
        int size = this.mutualFriends == null ? 0 : this.mutualFriends.length;
        p.writeInt(size);
        for (int i = 0; i < size; i++) {
            p.writeSerializable(this.mutualFriends[i]);
        }
        p.writeInt(this.numMutualFriends);
        p.writeByte(this.isOutgoing ? (byte) 1 : (byte) 0);
        if (!this.isSuggesting) {
            b2 = 0;
        }
        p.writeByte(b2);
    }
}
