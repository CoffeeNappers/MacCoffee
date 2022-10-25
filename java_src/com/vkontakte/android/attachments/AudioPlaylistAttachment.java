package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import android.widget.TextView;
import com.vk.music.dto.Playlist;
import com.vk.music.fragment.PlaylistFragment;
import com.vk.music.view.ThumbsImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.FlowLayout;
import com.vkontakte.android.utils.Serializer;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class AudioPlaylistAttachment extends Attachment implements ImageAttachment {
    public static final Serializer.Creator<AudioPlaylistAttachment> CREATOR = new Serializer.CreatorAdapter<AudioPlaylistAttachment>() { // from class: com.vkontakte.android.attachments.AudioPlaylistAttachment.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public AudioPlaylistAttachment mo1087createFromSerializer(Serializer s) {
            Playlist playlist = (Playlist) s.readSerializable(Playlist.class.getClassLoader());
            if (playlist == null) {
                return null;
            }
            return new AudioPlaylistAttachment(playlist);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public AudioPlaylistAttachment[] mo1088newArray(int size) {
            return new AudioPlaylistAttachment[size];
        }
    };
    private final Playlist playlist;

    public AudioPlaylistAttachment(Playlist playlist) {
        this.playlist = playlist;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.playlist);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getFullView(Context context) {
        return getViewForList(context, null);
    }

    @Override // com.vkontakte.android.attachments.Attachment
    public View getViewForList(Context context, View reuse) {
        View v;
        boolean isMessagesSnippet = ViewUtils.getBoolFromTheme(context, R.attr.is_messages_snippet);
        if (reuse == null) {
            v = View.inflate(context, isMessagesSnippet ? R.layout.attach_audio_playlist_small_messages : R.layout.attach_audio_playlist_small, null);
        } else {
            v = reuse;
        }
        FlowLayout.LayoutParams lp = new FlowLayout.LayoutParams();
        lp.width = -1;
        lp.height = -2;
        lp.center = true;
        v.setLayoutParams(lp);
        TextView button = (TextView) v.findViewById(R.id.attach_button);
        ThumbsImageView imageView = (ThumbsImageView) v.findViewById(R.id.snippet_image);
        imageView.setCornerRadius(V.dp(2.0f), 0, V.dp(2.0f), 0);
        ViewUtils.setText((TextView) v.findViewById(R.id.attach_title), this.playlist.title);
        ViewUtils.setText((TextView) v.findViewById(R.id.attach_subtitle), this.playlist.description, true);
        ViewUtils.setText((TextView) v.findViewById(R.id.attach_subsubtitle), Integer.valueOf((int) R.string.music_title_playlist));
        ViewUtils.setText(button, Integer.valueOf((int) R.string.open));
        View.OnClickListener l = AudioPlaylistAttachment$$Lambda$1.lambdaFactory$(this, v);
        v.setOnClickListener(l);
        button.setOnClickListener(l);
        return v;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$getViewForList$0(View v, View v1) {
        new PlaylistFragment.Builder(this.playlist).go(v.getContext());
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public String getImageURL() {
        return null;
    }

    @Override // com.vkontakte.android.attachments.ImageAttachment
    public void bind(View view) {
        ThumbsImageView imageView = (ThumbsImageView) view.findViewById(R.id.snippet_image);
        if (this.playlist.photo != null) {
            imageView.setThumb(this.playlist.photo);
        } else {
            imageView.setThumbs(this.playlist.thumbs);
        }
    }
}
