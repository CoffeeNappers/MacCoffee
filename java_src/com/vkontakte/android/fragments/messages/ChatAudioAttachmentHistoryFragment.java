package com.vkontakte.android.fragments.messages;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.messages.MessagesGetHistoryAttachments;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.VKRecyclerFragment;
import com.vkontakte.android.ui.drawable.AudioVisualizerDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.util.ArrayList;
import java.util.List;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class ChatAudioAttachmentHistoryFragment extends VKRecyclerFragment<MusicTrack> {
    private Adapter adapter;
    private String nextFrom;
    private final PlayerListener.PlayerListenerAdapter playerListener;

    public static ChatAudioAttachmentHistoryFragment create(int peer) {
        Bundle bundle = new Bundle();
        bundle.putInt("peer_id", peer);
        ChatAudioAttachmentHistoryFragment fr2 = new ChatAudioAttachmentHistoryFragment();
        fr2.setArguments(bundle);
        return fr2;
    }

    public ChatAudioAttachmentHistoryFragment() {
        super(50);
        this.playerListener = new PlayerListener.PlayerListenerAdapter() { // from class: com.vkontakte.android.fragments.messages.ChatAudioAttachmentHistoryFragment.1
            @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
            public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
                ChatAudioAttachmentHistoryFragment.this.updateList();
            }

            @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
            public void onTrackListChanged(List<PlayerTrack> list) {
                ChatAudioAttachmentHistoryFragment.this.updateList();
            }
        };
        this.adapter = new Adapter();
        this.nextFrom = null;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        AudioFacade.addPlayerListener(this.playerListener, false);
    }

    @Override // me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        AudioFacade.removePlayerListener(this.playerListener);
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (getActivity() != null) {
            if (offset == 0) {
                this.nextFrom = null;
            }
            this.currentRequest = MessagesGetHistoryAttachments.create(MusicTrack.class, getArguments().getInt("peer_id"), this.nextFrom, count).setCallback(new SimpleCallback<VKList<MusicTrack>>(this) { // from class: com.vkontakte.android.fragments.messages.ChatAudioAttachmentHistoryFragment.2
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<MusicTrack> res) {
                    ChatAudioAttachmentHistoryFragment.this.nextFrom = MessagesGetHistoryAttachments.nextFrom(res);
                    ChatAudioAttachmentHistoryFragment.this.getActivity().invalidateOptionsMenu();
                    ChatAudioAttachmentHistoryFragment.this.onDataLoaded(res, !TextUtils.isEmpty(ChatAudioAttachmentHistoryFragment.this.nextFrom));
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                }
            }).exec((Context) getActivity());
        }
    }

    @Override // com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // me.grishka.appkit.fragments.BaseRecyclerFragment
    /* renamed from: getAdapter */
    protected RecyclerView.Adapter mo1066getAdapter() {
        return this.adapter;
    }

    /* loaded from: classes2.dex */
    private class Adapter extends UsableRecyclerView.Adapter<AudioViewHolder> {
        private Adapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public AudioViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new AudioViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(AudioViewHolder holder, int position) {
            holder.bind(ChatAudioAttachmentHistoryFragment.this.data.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return ChatAudioAttachmentHistoryFragment.this.data.size();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class AudioViewHolder extends RecyclerHolder<MusicTrack> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private TextView artist;
        private ImageView cacheIcon;
        private TextView duration;
        private ImageView playIcon;
        private TextView title;

        public AudioViewHolder() {
            super(ChatAudioAttachmentHistoryFragment.this.getActivity(), R.layout.audio_list_item, ChatAudioAttachmentHistoryFragment.this.list);
            this.title = (TextView) this.itemView.findViewById(R.id.audio_title);
            this.artist = (TextView) this.itemView.findViewById(R.id.audio_artist);
            this.duration = (TextView) this.itemView.findViewById(R.id.audio_duration);
            this.playIcon = (ImageView) this.itemView.findViewById(R.id.audio_play_icon);
            this.cacheIcon = (ImageView) this.itemView.findViewById(R.id.audio_saved_icon);
            this.playIcon.setImageDrawable(new AudioVisualizerDrawable());
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(MusicTrack item) {
            boolean pt = true;
            int i = 0;
            this.title.setText(item.title);
            this.artist.setText(item.artist);
            this.duration.setText(String.format("%d:%02d", Integer.valueOf(item.duration / 60), Integer.valueOf(item.duration % 60)));
            MusicTrack audioFile = AudioFacade.getCurrentTrack();
            boolean isCurrent = item.equals(audioFile);
            boolean isCached = AudioFacade.isCached(item.getMid());
            if (!isCurrent || !AudioFacade.getPlayerState().isPlayState()) {
                pt = false;
            }
            this.playIcon.setVisibility(isCurrent ? 0 : 8);
            this.playIcon.setSelected(pt);
            ImageView imageView = this.cacheIcon;
            if (!isCached) {
                i = 8;
            }
            imageView.setVisibility(i);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            MusicTrack file = (MusicTrack) this.item;
            MusicTrack cur = AudioFacade.getCurrentTrack();
            if (!file.equals(cur)) {
                AudioFacade.playTracks(ChatAudioAttachmentHistoryFragment.this.data, getAdapterPosition(), PlayerRefer.none, true);
            } else {
                AudioFacade.toggleResumePause();
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            MusicTrack file = (MusicTrack) this.item;
            return file != null && ChatAudioAttachmentHistoryFragment.this.showContextMenuFor(file);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean showContextMenuFor(final MusicTrack file) {
        List<CharSequence> items = new ArrayList<>();
        final List<String> values = new ArrayList<>();
        if (AudioFacade.canEnqueue(file)) {
            items.add(getString(R.string.audio_add_to_queue));
            values.add("enqueue");
        }
        if (!items.isEmpty()) {
            new VKAlertDialog.Builder(getActivity()).setTitle(R.string.audio).setItems((CharSequence[]) items.toArray(new CharSequence[items.size()]), new DialogInterface.OnClickListener() { // from class: com.vkontakte.android.fragments.messages.ChatAudioAttachmentHistoryFragment.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    String action = (String) values.get(which);
                    if ("enqueue".equals(action)) {
                        ChatAudioAttachmentHistoryFragment.this.enqueue(file);
                    }
                }
            }).show();
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean enqueue(MusicTrack file) {
        if (!AudioFacade.enqueue(file)) {
            return false;
        }
        Toast.makeText(getActivity(), (int) R.string.audio_added_to_queue, 0).show();
        return true;
    }
}
