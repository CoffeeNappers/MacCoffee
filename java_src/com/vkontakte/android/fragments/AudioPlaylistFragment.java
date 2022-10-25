package com.vkontakte.android.fragments;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.Toolbar;
import android.support.v7.widget.helper.ItemTouchHelper;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.ui.WindowCallbackDelegate;
import com.vkontakte.android.ui.drawable.AudioVisualizerDrawable;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.utils.L;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes2.dex */
public class AudioPlaylistFragment extends DialogFragment {
    private UsableRecyclerView list;
    private MusicTrack nowPlaying;
    private ArrayList<PlayerTrack> files = new ArrayList<>();
    private boolean animatingTransitionOut = false;
    private final AudioListAdapter adapter = new AudioListAdapter();
    private PlayerListener playerListener = new PlayerListener.PlayerListenerAdapter() { // from class: com.vkontakte.android.fragments.AudioPlaylistFragment.1
        @Override // com.vkontakte.android.audio.player.PlayerListener.PlayerListenerAdapter, com.vkontakte.android.audio.player.PlayerListener
        public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
            AudioPlaylistFragment.this.syncPlayList();
        }
    };
    private BroadcastReceiver receiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.AudioPlaylistFragment.2
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context arg0, Intent intent) {
            if (AudioFacade.ACTION_USER_AUDIO_REMOVED.equals(intent.getAction())) {
                AudioPlaylistFragment.this.update();
            }
        }
    };

    /* JADX INFO: Access modifiers changed from: private */
    public void syncPlayList() {
        MusicTrack file = AudioFacade.getCurrentTrack();
        if (file != null) {
            long nowPlayingId = this.nowPlaying != null ? (this.nowPlaying.oid << 32) | this.nowPlaying.aid : 0L;
            long fileId = (file.oid << 32) | file.aid;
            if (file.equals(this.nowPlaying)) {
                this.adapter.notifyDataSetChanged();
                return;
            }
            int animOut = -1;
            int animIn = -1;
            int i = 0;
            int j = 0;
            while (true) {
                if (j >= this.adapter.getItemCount()) {
                    break;
                }
                long id = this.adapter.getItemId(j);
                if (nowPlayingId == id) {
                    animOut = i;
                    break;
                } else {
                    i++;
                    j++;
                }
            }
            int i2 = 0;
            int j2 = 0;
            while (true) {
                if (j2 >= this.adapter.getItemCount()) {
                    break;
                }
                long id2 = this.adapter.getItemId(j2);
                if (fileId == id2) {
                    animIn = i2;
                    break;
                } else {
                    i2++;
                    j2++;
                }
            }
            this.nowPlaying = file;
            animateStateTransition(animIn, true);
            animateStateTransition(animOut, false);
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle b) {
        super.onCreate(b);
        update();
        IntentFilter filter = new IntentFilter();
        filter.addAction(AudioFacade.ACTION_USER_AUDIO_REMOVED);
        VKApplication.context.registerReceiver(this.receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        this.nowPlaying = AudioFacade.getCurrentTrack();
        AudioFacade.addPlayerListener(this.playerListener, true);
        setStyle(1, 0);
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        AudioFacade.removePlayerListener(this.playerListener);
        try {
            VKApplication.context.unregisterReceiver(this.receiver);
        } catch (Exception e) {
        }
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
        if (savedInstanceState != null) {
            getActivity().getFragmentManager().beginTransaction().remove(this).commit();
        }
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.list = new UsableRecyclerView(getActivity());
        this.list.setLayoutManager(new LinearLayoutManager(getActivity()));
        this.list.setAdapter(this.adapter);
        this.list.setPadding(0, V.dp(8.0f), 0, V.dp(8.0f));
        this.list.setClipToPadding(false);
        new ItemTouchHelper(new DragController()).attachToRecyclerView(this.list);
        int currentPosition = AudioFacade.getActualTrackIndex();
        if (currentPosition >= 0) {
            this.list.getLayoutManager().scrollToPosition(Math.max(0, currentPosition - 1));
        }
        getDialog().setCanceledOnTouchOutside(true);
        final Toolbar toolbar = new Toolbar(new ContextThemeWrapper(getActivity(), (int) R.style.ActionBarTheme_White));
        toolbar.setTitle(R.string.play_queue);
        toolbar.setNavigationIcon(R.drawable.ic_close);
        toolbar.setNavigationOnClickListener(AudioPlaylistFragment$$Lambda$1.lambdaFactory$(this));
        LinearLayout content = new LinearLayout(getActivity());
        content.setOrientation(1);
        TypedArray ta = toolbar.getContext().obtainStyledAttributes((AttributeSet) null, new int[]{R.attr.actionBarSize});
        content.addView(toolbar, new LinearLayout.LayoutParams(-1, ta.getDimensionPixelSize(0, V.dp(56.0f))));
        ta.recycle();
        View sep = new View(getActivity());
        sep.setBackgroundColor(-2631463);
        content.addView(sep, new LinearLayout.LayoutParams(-1, V.dp(0.5f)));
        content.addView(this.list, new LinearLayout.LayoutParams(-1, -1));
        if (Build.VERSION.SDK_INT < 21) {
            toolbar.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() { // from class: com.vkontakte.android.fragments.AudioPlaylistFragment.3
                @Override // android.view.ViewTreeObserver.OnPreDrawListener
                public boolean onPreDraw() {
                    toolbar.getViewTreeObserver().removeOnPreDrawListener(this);
                    try {
                        Field f = toolbar.getClass().getDeclaredField("mTitleTextView");
                        f.setAccessible(true);
                        TextView view = (TextView) f.get(toolbar);
                        if (view != null) {
                            view.setTypeface(Font.Medium.typeface);
                        }
                    } catch (Exception e) {
                        L.e(e, new Object[0]);
                    }
                    return false;
                }
            });
        }
        return content;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$0(View v) {
        dismiss();
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        Dialog dlg = getDialog();
        dlg.getWindow().setFlags(0, 2);
        WindowManager.LayoutParams lp = dlg.getWindow().getAttributes();
        lp.horizontalMargin = 0.0f;
        Rect r = new Rect();
        lp.y = r.top;
        lp.gravity = 17;
        if (Screen.isTablet(getActivity())) {
            lp.width = V.dp(392.0f);
            lp.height = V.dp(672.0f);
            if (getResources().getConfiguration().screenWidthDp > getResources().getConfiguration().screenHeightDp) {
                int pw = Math.min(832, getResources().getConfiguration().screenWidthDp - 32);
                int px = ((getResources().getConfiguration().screenWidthDp - pw) / 2) + 32;
                lp.x = V.dp(px);
                lp.gravity = 21;
            }
        } else {
            lp.width = -1;
            lp.height = -1;
        }
        dlg.getWindow().setAttributes(lp);
        dlg.getWindow().setCallback(new WindowCallbackDelegate(dlg.getWindow().getCallback()) { // from class: com.vkontakte.android.fragments.AudioPlaylistFragment.4
            @Override // com.vkontakte.android.ui.WindowCallbackDelegate, android.view.Window.Callback
            public boolean dispatchTouchEvent(MotionEvent ev) {
                if (ev.getY() >= 0.0f || ev.getAction() != 0) {
                    return super.dispatchTouchEvent(ev);
                }
                ViewUtils.dismissDialogSafety(AudioPlaylistFragment.this.getDialog());
                return true;
            }
        });
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        super.onDestroyView();
        this.list.setAdapter(null);
        this.list = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void update() {
        if (AudioFacade.getPlayerState() != PlayerState.IDLE) {
            this.files.clear();
            this.files.addAll(AudioFacade.getActualTrackList());
            this.adapter.notifyDataSetChanged();
        }
    }

    private void animateStateTransition(int item, boolean in) {
        UsableRecyclerView.ViewHolder holder = this.list == null ? null : this.list.mo1203findViewHolderForAdapterPosition(item);
        if (holder != null) {
            final View v = holder.itemView;
            int iconSize = V.dp(32.0f);
            if (in) {
                v.findViewById(R.id.audio_play_icon).setVisibility(0);
                ArrayList<Animator> anims = new ArrayList<>();
                anims.add(ObjectAnimator.ofFloat(v.findViewById(R.id.audio_play_icon), "translationX", -iconSize, 0.0f).setDuration(200L));
                anims.add(ObjectAnimator.ofFloat(v.findViewById(R.id.audio_info_wrap), "translationX", -iconSize, 0.0f).setDuration(200L));
                anims.add(ObjectAnimator.ofFloat(v.findViewById(R.id.audio_play_icon), "alpha", 0.0f, 1.0f).setDuration(200L));
                v.findViewById(R.id.audio_play_icon).setSelected(true);
                AnimatorSet set = new AnimatorSet();
                set.playTogether(anims);
                set.start();
                return;
            }
            this.animatingTransitionOut = true;
            ArrayList<Animator> anims2 = new ArrayList<>();
            anims2.add(ObjectAnimator.ofFloat(v.findViewById(R.id.audio_play_icon), "translationX", -iconSize).setDuration(200L));
            anims2.add(ObjectAnimator.ofFloat(v.findViewById(R.id.audio_info_wrap), "translationX", -iconSize).setDuration(200L));
            anims2.add(ObjectAnimator.ofFloat(v.findViewById(R.id.audio_play_icon), "alpha", 0.0f).setDuration(200L));
            AnimatorSet set2 = new AnimatorSet();
            set2.playTogether(anims2);
            set2.addListener(new AnimatorListenerAdapter() { // from class: com.vkontakte.android.fragments.AudioPlaylistFragment.5
                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                public void onAnimationEnd(Animator animation) {
                    v.findViewById(R.id.audio_play_icon).setAlpha(1.0f);
                    v.findViewById(R.id.audio_play_icon).setTranslationX(0.0f);
                    v.findViewById(R.id.audio_info_wrap).setTranslationX(0.0f);
                    v.findViewById(R.id.audio_play_icon).setVisibility(8);
                    AudioPlaylistFragment.this.animatingTransitionOut = false;
                }
            });
            set2.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class AudioListAdapter extends UsableRecyclerView.Adapter<AudioViewHolder> {
        public AudioListAdapter() {
            setHasStableIds(false);
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public AudioViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new AudioViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(AudioViewHolder holder, int position) {
            holder.bind(AudioPlaylistFragment.this.files.get(position));
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return AudioPlaylistFragment.this.files.size();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 0;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public long getItemId(int position) {
            MusicTrack af = (MusicTrack) AudioPlaylistFragment.this.files.get(position);
            return (af.oid << 32) | af.aid;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class AudioViewHolder extends RecyclerHolder<PlayerTrack> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable {
        private TextView artist;
        private ImageView cacheIcon;
        private TextView duration;
        private ImageView playIcon;
        private TextView title;

        public AudioViewHolder() {
            super(AudioPlaylistFragment.this.getActivity(), R.layout.audio_list_item, AudioPlaylistFragment.this.list);
            this.title = (TextView) this.itemView.findViewById(R.id.audio_title);
            this.artist = (TextView) this.itemView.findViewById(R.id.audio_artist);
            this.duration = (TextView) this.itemView.findViewById(R.id.audio_duration);
            this.playIcon = (ImageView) this.itemView.findViewById(R.id.audio_play_icon);
            this.cacheIcon = (ImageView) this.itemView.findViewById(R.id.audio_saved_icon);
            this.playIcon.setImageDrawable(new AudioVisualizerDrawable().setColor(-3749428));
            this.itemView.setPadding(V.dp(16.0f), 0, V.dp(16.0f), 0);
        }

        @Override // com.vkontakte.android.ui.holder.RecyclerHolder
        public void onBind(PlayerTrack item) {
            boolean pt = true;
            int i = 0;
            this.title.setText(item.title);
            this.artist.setText(item.artist);
            this.duration.setText(String.format("%d:%02d", Integer.valueOf(item.duration / 60), Integer.valueOf(item.duration % 60)));
            MusicTrack musicTrack = AudioFacade.getCurrentTrack();
            boolean isCurrent = item.equals(musicTrack);
            boolean isCached = AudioFacade.isCached(item.getMid());
            if (!isCurrent || !AudioFacade.getPlayerState().isPlayState()) {
                pt = false;
            }
            if (!AudioPlaylistFragment.this.animatingTransitionOut) {
                this.playIcon.setVisibility(isCurrent ? 0 : 8);
            }
            this.playIcon.setSelected(pt);
            ImageView imageView = this.cacheIcon;
            if (!isCached) {
                i = 8;
            }
            imageView.setVisibility(i);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            PlayerTrack track = AudioFacade.getCurrentTrack();
            if (TextUtils.equals(track == null ? null : track.uuid, ((PlayerTrack) this.item).uuid)) {
                AudioFacade.toggleResumePause();
            } else {
                AudioFacade.playTrack(((PlayerTrack) this.item).uuid);
            }
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
        public boolean onLongClick() {
            return false;
        }
    }

    /* loaded from: classes2.dex */
    private class DragController extends ItemTouchHelper.Callback {
        private boolean mDragging;
        private int mEndPosition;
        private int mStartPosition;

        private DragController() {
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public int getMovementFlags(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder) {
            int i = 0;
            boolean isCurrentPosition = viewHolder.getAdapterPosition() != AudioFacade.getActualTrackIndex();
            if (isCurrentPosition) {
                i = 12;
            }
            return makeMovementFlags(3, i);
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean canDropOver(RecyclerView recyclerView, RecyclerView.ViewHolder current, RecyclerView.ViewHolder target) {
            return true;
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean onMove(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder, RecyclerView.ViewHolder target) {
            int fromPosition = viewHolder.getAdapterPosition();
            int toPosition = target.getAdapterPosition();
            if (fromPosition < toPosition) {
                for (int i = fromPosition; i < toPosition; i++) {
                    PlayerTrack track1 = (PlayerTrack) AudioPlaylistFragment.this.files.get(i);
                    PlayerTrack track2 = (PlayerTrack) AudioPlaylistFragment.this.files.get(i + 1);
                    Collections.swap(AudioPlaylistFragment.this.files, i, i + 1);
                    AudioFacade.swapPlaylistTracks(track1, track2);
                }
            } else {
                for (int i2 = fromPosition; i2 > toPosition; i2--) {
                    PlayerTrack track12 = (PlayerTrack) AudioPlaylistFragment.this.files.get(i2);
                    PlayerTrack track22 = (PlayerTrack) AudioPlaylistFragment.this.files.get(i2 - 1);
                    Collections.swap(AudioPlaylistFragment.this.files, i2, i2 - 1);
                    AudioFacade.swapPlaylistTracks(track12, track22);
                }
            }
            AudioListAdapter audioListAdapter = AudioPlaylistFragment.this.adapter;
            this.mEndPosition = toPosition;
            audioListAdapter.notifyItemMoved(fromPosition, toPosition);
            return true;
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public void onSelectedChanged(RecyclerView.ViewHolder viewHolder, int actionState) {
            super.onSelectedChanged(viewHolder, actionState);
            switch (actionState) {
                case 0:
                    this.mDragging = false;
                    return;
                case 1:
                default:
                    return;
                case 2:
                    this.mDragging = true;
                    this.mStartPosition = viewHolder.getAdapterPosition();
                    viewHolder.itemView.performHapticFeedback(0);
                    return;
            }
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public void onSwiped(RecyclerView.ViewHolder viewHolder, int direction) {
            AudioFacade.removePlaylistItem(((PlayerTrack) AudioPlaylistFragment.this.files.get(viewHolder.getAdapterPosition())).uuid);
            AudioPlaylistFragment.this.files.remove(viewHolder.getAdapterPosition());
            AudioPlaylistFragment.this.adapter.notifyItemRemoved(viewHolder.getAdapterPosition());
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean isLongPressDragEnabled() {
            return true;
        }

        @Override // android.support.v7.widget.helper.ItemTouchHelper.Callback
        public boolean isItemViewSwipeEnabled() {
            return true;
        }
    }
}
