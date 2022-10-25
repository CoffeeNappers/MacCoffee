package com.vkontakte.android.attachments;

import android.content.Context;
import android.support.annotation.Nullable;
import android.view.View;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vkontakte.android.AudioAttachView;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class AudioAttachment extends Attachment {
    public static final Serializer.Creator<AudioAttachment> CREATOR = new Serializer.CreatorAdapter<AudioAttachment>() { // from class: com.vkontakte.android.attachments.AudioAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public AudioAttachment mo1087createFromSerializer(Serializer in) {
            return new AudioAttachment(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public AudioAttachment[] mo1088newArray(int size) {
            return new AudioAttachment[size];
        }
    };
    public MusicTrack musicTrack;
    public transient ArrayList<MusicTrack> playlist;
    public transient int playlistPos;
    @Nullable
    private transient PostInteract postInteract;
    private transient String refer = "";

    public void setReferData(String refer, @Nullable PostInteract postInteract) {
        this.refer = refer;
        this.postInteract = postInteract;
    }

    public String getRefer() {
        return this.refer;
    }

    @Nullable
    public PostInteract getPostInteract() {
        return this.postInteract;
    }

    public AudioAttachment(MusicTrack af) {
        this.musicTrack = af;
    }

    public AudioAttachment(Serializer s) {
        this.musicTrack = (MusicTrack) s.readSerializable(MusicTrack.class.getClassLoader());
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        AudioAttachView aav = (AudioAttachView) (reuse == null ? Attachment.getReusableView(context, MimeTypes.BASE_TYPE_AUDIO) : reuse);
        aav.setReferData(this.refer, this.postInteract);
        aav.setData(this.musicTrack.artist, this.musicTrack.title, this.musicTrack.oid, this.musicTrack.aid, this.musicTrack.duration);
        if (this.playlist != null) {
            aav.playlist = this.playlist;
            aav.playlistPos = this.playlistPos;
        }
        return aav;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.musicTrack);
    }

    public String toString() {
        return MimeTypes.BASE_TYPE_AUDIO + this.musicTrack.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.musicTrack.aid;
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public FlowLayout.LayoutParams overrideLayoutParams() {
        return null;
    }
}
