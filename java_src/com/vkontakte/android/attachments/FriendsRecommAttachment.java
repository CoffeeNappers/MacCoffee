package com.vkontakte.android.attachments;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import com.vkontakte.android.SystemUtils;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class FriendsRecommAttachment extends Attachment {
    public static final Serializer.Creator<FriendsRecommAttachment> CREATOR = new Serializer.CreatorAdapter<FriendsRecommAttachment>() { // from class: com.vkontakte.android.attachments.FriendsRecommAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public FriendsRecommAttachment mo1087createFromSerializer(Serializer is) {
            String nextFrom = is.readString();
            int count = is.readInt();
            ArrayList<UserProfile> profiles = new ArrayList<>(count);
            for (int i = 0; i < count; i++) {
                UserProfile p = new UserProfile();
                p.uid = is.readInt();
                p.firstName = is.readString();
                p.fullName = is.readString();
                p.photo = is.readString();
                p.online = is.readInt();
                p.f = is.readInt() == 1;
                p.isFriend = is.readInt() == 1;
                p.extra = new Bundle();
                SystemUtils.deserializeBundle(is.readString(), p.extra);
                profiles.add(p);
            }
            return new FriendsRecommAttachment(profiles, nextFrom);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public FriendsRecommAttachment[] mo1088newArray(int size) {
            return new FriendsRecommAttachment[size];
        }
    };
    public String nextFrom;
    public ArrayList<UserProfile> profiles;

    public FriendsRecommAttachment(ArrayList<UserProfile> profiles, String nextFrom) {
        this.profiles = profiles;
        this.nextFrom = nextFrom;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return null;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        return null;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.nextFrom);
        s.writeInt(this.profiles.size());
        Iterator<UserProfile> it = this.profiles.iterator();
        while (it.hasNext()) {
            UserProfile p = it.next();
            s.writeInt(p.uid);
            s.writeString(p.firstName);
            s.writeString(p.fullName);
            s.writeString(p.photo);
            s.writeInt(p.online);
            s.writeInt(p.f ? 1 : 0);
            s.writeInt(p.isFriend ? 1 : 0);
            s.writeString(SystemUtils.serializeBundle(p.extra));
        }
    }
}
