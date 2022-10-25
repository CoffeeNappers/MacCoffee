package com.vkontakte.android.attachments;

import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
/* loaded from: classes2.dex */
public class PromoPostAttachment extends PostAttachment {
    public static final Serializer.Creator<PromoPostAttachment> CREATOR = new Serializer.CreatorAdapter<PromoPostAttachment>() { // from class: com.vkontakte.android.attachments.PromoPostAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PromoPostAttachment mo1087createFromSerializer(Serializer in) {
            NewsEntry post = (NewsEntry) in.readSerializable(NewsEntry.class.getClassLoader());
            Log.i("vk", "read from parcel " + post);
            return new PromoPostAttachment(post);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PromoPostAttachment[] mo1088newArray(int size) {
            return new PromoPostAttachment[size];
        }
    };

    public PromoPostAttachment(NewsEntry entry) {
        super(entry);
    }

    @Override // com.vkontakte.android.attachments.PostAttachment
    public String toString() {
        return "wall_ads" + this.post.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.post.postID;
    }
}
