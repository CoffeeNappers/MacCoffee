package com.vkontakte.android;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Outline;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.text.TextUtils;
import android.text.method.ScrollingMovementMethod;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.imageloader.view.VKImageView;
import com.vk.music.fragment.MusicFragment;
import com.vk.music.fragment.SearchFragment;
import com.vk.music.utils.BoomHelper;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioAdd;
import com.vkontakte.android.api.audio.AudioDelete;
import com.vkontakte.android.api.audio.AudioGetLyrics;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.PlayerAction;
import com.vkontakte.android.audio.player.LoopMode;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.SavedTracks;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Groups;
import com.vkontakte.android.fragments.AudioPlaylistFragment;
import com.vkontakte.android.fragments.money.BuyMusicSubscriptionFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.DepthPageTransformer;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Utils;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class AudioPlayerActivity extends VKActivity implements PlayerListener, View.OnClickListener, SeekBar.OnSeekBarChangeListener, ViewPager.OnPageChangeListener, SavedTracks.SavedTracksListener {
    private ImageView buttonAdd;
    private ImageView buttonBroadcast;
    private View buttonMenu;
    private View buttonNext;
    private ImageView buttonPlay;
    private View buttonPlaylist;
    private View buttonPrev;
    private ImageView buttonRepeat;
    private ImageView buttonShuffle;
    private View disableAd;
    private TrackInfo lastTrackInfo;
    private ViewPager pagerCover;
    private Drawable pauseIcon;
    private Drawable playIcon;
    private SeekBar seekProgress;
    private TextView textArtist;
    private TextView textDuration;
    private TextView textTime;
    private TextView textTitle;
    private VKAPIRequest addRequest = null;
    private VKAPIRequest deleteRequest = null;
    private CoverPagerAdapter coverPagerAdapter = new CoverPagerAdapter(this);
    private BoomHelper boomHelper = new BoomHelper();
    private Animator animatorArtistTitle = null;
    private AnimatorListenerAdapter animatorArtistTitleListener = new AnimatorListenerAdapter() { // from class: com.vkontakte.android.AudioPlayerActivity.1
        {
            AudioPlayerActivity.this = this;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            AudioPlayerActivity.this.textArtist.setAlpha(1.0f);
            AudioPlayerActivity.this.textTitle.setAlpha(1.0f);
            AudioPlayerActivity.this.animatorArtistTitle = null;
        }

        @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
        public void onAnimationRepeat(Animator animation) {
            AudioPlayerActivity.this.textArtist.setText((CharSequence) AudioPlayerActivity.this.textArtist.getTag());
            AudioPlayerActivity.this.textTitle.setText((CharSequence) AudioPlayerActivity.this.textTitle.getTag());
        }
    };
    private int pagerCoverScrollState = 0;
    private int pagerCoverScrollStateDragIdle = 0;
    private boolean canUpdateProgress = true;
    private boolean buttonAddEnabled = true;

    public void setEnabledAddButton(boolean enable) {
        this.buttonAddEnabled = enable;
        TrackInfo trackInfo = this.lastTrackInfo;
        ImageView imageView = this.buttonAdd;
        if (trackInfo != null) {
            enable = enable && trackInfo.hasAction(PlayerAction.other);
        }
        ViewUtils.setEnabled(imageView, enable);
    }

    private void syncEnabled(TrackInfo trackInfo) {
        int i = 0;
        if (trackInfo != null) {
            setEnabled(this.buttonPlay, trackInfo.hasAction(PlayerAction.playPause));
            setEnabled(this.buttonAdd, trackInfo.hasAction(PlayerAction.other) && this.buttonAddEnabled);
            setEnabled(this.buttonBroadcast, trackInfo.hasAction(PlayerAction.other));
            setEnabled(this.pagerCover, trackInfo.hasAction(PlayerAction.changeTrack));
            setEnabled(trackInfo, this.seekProgress, trackInfo.hasAction(PlayerAction.seek));
            setEnabled(this.buttonPrev, trackInfo.hasAction(PlayerAction.changeTrack));
            setEnabled(this.buttonNext, trackInfo.hasAction(PlayerAction.changeTrack, PlayerAction.skipAd));
            setEnabled(this.buttonShuffle, trackInfo.hasAction(PlayerAction.shuffle));
            setEnabled(this.buttonRepeat, trackInfo.hasAction(PlayerAction.repeat));
            setEnabled(this.buttonMenu, trackInfo.hasAction(PlayerAction.other));
            setEnabled(this.buttonPlaylist, trackInfo.hasAction(PlayerAction.other));
            View view = this.disableAd;
            if (trackInfo.isContentMode() || !VKAccountManager.getCurrent().isMusicRestricted()) {
                i = 8;
            }
            view.setVisibility(i);
        }
    }

    private static void setEnabled(TrackInfo trackInfo, SeekBar seekProgress, boolean enabled) {
        if (seekProgress != null) {
            seekProgress.setEnabled(enabled);
            int thumbOffset = seekProgress.getThumbOffset();
            if (trackInfo.isContentMode()) {
                seekProgress.setThumb(ViewUtils.getDrawable(seekProgress.getContext(), R.drawable.ic_music_progress_thumb_24dp));
            } else if (!enabled) {
                seekProgress.setThumb(new ColorDrawable(0));
            } else {
                seekProgress.setThumb(ViewUtils.getDrawable(seekProgress.getContext(), R.drawable.ic_music_progress_thumb_ad_24dp));
            }
            seekProgress.setThumbOffset(thumbOffset);
        }
    }

    private static void setEnabled(View view, boolean enabled) {
        if (view != null && view.isEnabled() != enabled) {
            view.setEnabled(enabled);
            view.setAlpha(enabled ? 1.0f : 0.3f);
        }
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle b) {
        super.onCreate(b);
        setTitle(R.string.now_playing);
        ViewGroup contentView = (ViewGroup) View.inflate(this, R.layout.audio_player, null);
        contentView.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        contentView.setClipToPadding(false);
        setContentView(contentView);
        final Window w = getWindow();
        if (this.isTablet) {
            View textView = w.getDecorView().findViewById(R.id.title);
            if (textView != null) {
                ((ViewGroup) textView.getParent()).removeView(textView);
            }
            if (getResources().getConfiguration().screenWidthDp > getResources().getConfiguration().screenHeightDp) {
                w.setLayout(V.dp(Math.min(832, getResources().getConfiguration().screenWidthDp - 32)), V.dp(360.0f));
            } else {
                w.setLayout(V.dp(360.0f), V.dp(Math.min(600, getResources().getConfiguration().screenHeightDp - 32)));
            }
            w.setGravity(17);
            if (Build.VERSION.SDK_INT >= 21) {
                w.getDecorView().setOutlineProvider(new ViewOutlineProvider() { // from class: com.vkontakte.android.AudioPlayerActivity.2
                    {
                        AudioPlayerActivity.this = this;
                    }

                    @Override // android.view.ViewOutlineProvider
                    public void getOutline(View view, Outline outline) {
                        if (Build.VERSION.SDK_INT >= 21) {
                            outline.setRoundRect(0, 0, w.getAttributes().width, w.getAttributes().height, V.dp(2.0f));
                        }
                    }
                });
                w.getDecorView().setClipToOutline(true);
            }
        }
        if (Build.VERSION.SDK_INT >= 19) {
            w.getDecorView().setSystemUiVisibility(1024);
            if (Build.VERSION.SDK_INT >= 21) {
                w.addFlags(Integer.MIN_VALUE);
                w.setStatusBarColor(1140850688);
            } else {
                w.addFlags(67108864);
            }
        }
        this.buttonPrev = setOnClickListener(R.id.aplayer_prev);
        this.buttonPlay = (ImageView) setOnClickListener(R.id.aplayer_play);
        this.buttonNext = setOnClickListener(R.id.aplayer_next);
        this.disableAd = setOnClickListener(R.id.disable_music_ad);
        this.seekProgress = (SeekBar) findViewById(R.id.aplayer_progress);
        this.seekProgress.setOnSeekBarChangeListener(this);
        this.textArtist = (TextView) findViewById(R.id.aplayer_artist);
        this.textTitle = (TextView) findViewById(R.id.aplayer_title);
        this.textTime = (TextView) findViewById(R.id.aplayer_time);
        this.textDuration = (TextView) findViewById(R.id.aplayer_duration);
        boolean isTouchWiz = new File("/system/app/SecLauncher2.apk").exists() || new File("/system/app/SecLauncher3.apk").exists();
        if (isTouchWiz) {
            this.textArtist.setMovementMethod(new ScrollingMovementMethod());
            this.textTitle.setMovementMethod(new ScrollingMovementMethod());
        } else {
            this.textArtist.setSelected(true);
            this.textTitle.setSelected(true);
        }
        this.buttonRepeat = (ImageView) setOnClickListener(R.id.aplayer_repeat);
        this.buttonRepeat.setSelected(AudioFacade.getLoopMode() == LoopMode.TRACK);
        this.buttonRepeat.setImageDrawable(new RecoloredDrawable(ContextCompat.getDrawable(this, R.drawable.ic_repeat_24dp), getResources().getColorStateList(R.color.highlightable_text)));
        this.buttonShuffle = (ImageView) setOnClickListener(R.id.aplayer_shuffle);
        this.buttonShuffle.setSelected(AudioFacade.isShuffle());
        this.buttonShuffle.setImageDrawable(new RecoloredDrawable(ContextCompat.getDrawable(this, R.drawable.ic_shuffle_24dp), getResources().getColorStateList(R.color.highlightable_text)));
        this.buttonBroadcast = (ImageView) setOnClickListener(R.id.aplayer_broadcast);
        this.buttonBroadcast.setImageDrawable(new RecoloredDrawable(ContextCompat.getDrawable(this, R.drawable.ic_share_24dp), getResources().getColorStateList(R.color.highlightable_text)));
        this.buttonBroadcast.setSelected(AudioFacade.isBroadcast());
        this.buttonPlaylist = setOnClickListener(R.id.aplayer_playlist);
        this.buttonMenu = setOnClickListener(R.id.aplayer_menu);
        setOnClickListener(R.id.back);
        this.buttonAdd = (ImageView) setOnClickListener(R.id.aplayer_add);
        this.playIcon = ContextCompat.getDrawable(this, R.drawable.ic_play_48dp);
        this.pauseIcon = ContextCompat.getDrawable(this, R.drawable.ic_pause_48dp);
        this.pagerCover = (ViewPager) findViewById(R.id.aplayer_cover_pager);
        if (this.pagerCover != null) {
            this.coverPagerAdapter.notifyDataSetChanged();
            this.pagerCover.setAdapter(this.coverPagerAdapter);
            if (AudioFacade.getPlayerState() != PlayerState.IDLE) {
                this.pagerCover.setCurrentItem(AudioFacade.getActualTrackIndex() + 1, false);
            }
            this.pagerCover.addOnPageChangeListener(this);
            this.pagerCover.setPageTransformer(true, new DepthPageTransformer());
        }
        syncEnabled(this.lastTrackInfo);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        setVolumeControlStream(3);
        if (AudioFacade.getCurrentTrack() == null) {
            finish();
            return;
        }
        AudioFacade.addPlayerListener(this, true);
        AudioFacade.addSavedTracksListener(this, true);
    }

    @Override // com.vkontakte.android.VKActivity, android.support.v4.app.FragmentActivity, android.app.Activity
    public void onPause() {
        super.onPause();
        setVolumeControlStream(Integer.MIN_VALUE);
        AudioFacade.removePlayerListener(this);
        AudioFacade.removeSavedTracksListener(this);
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.audio, menu);
        return true;
    }

    @Override // android.app.Activity
    public boolean onPrepareOptionsMenu(Menu menu) {
        TrackInfo ti = AudioFacade.getCurrentTrackInfo();
        PlayerTrack f = AudioFacade.getCurrentTrack();
        if (f != null) {
            boolean cached = AudioFacade.isCached(f.getMid()) || AudioFacade.isDownloading(f.getMid());
            menu.findItem(R.id.audio_cache).setIcon(cached ? R.drawable.ic_aplayer_cache_active : R.drawable.ic_aplayer_cache_normal);
            menu.findItem(R.id.audio_cache).setChecked(cached);
            if (VKAccountManager.getCurrent().isMusicRestricted()) {
                menu.findItem(R.id.audio_cache).setEnabled(true);
                menu.findItem(R.id.audio_cache).setCheckable(false);
            } else {
                menu.findItem(R.id.audio_cache).setEnabled(AudioFacade.isAudioCacheEnable() || cached);
                menu.findItem(R.id.audio_cache).setCheckable(true);
            }
            if (VKAccountManager.isCurrentUser(f.oid)) {
                menu.findItem(R.id.audio_delete).setVisible(!f.fromAttachment);
            } else {
                menu.findItem(R.id.audio_delete).setVisible(false);
            }
            menu.findItem(R.id.audio_lyrics).setEnabled(haveLyrics(f));
        }
        if (ti != null && !ti.isContentMode()) {
            for (int i = 0; i < menu.size(); i++) {
                menu.getItem(i).setEnabled(false);
            }
        }
        return true;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.vkontakte.android.VKActivity, android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case 16908332:
                if (isTaskRoot()) {
                    startActivity(new MusicFragment.Builder().intent(this).addFlags(67108864));
                    finish();
                    return true;
                }
                break;
            case R.id.audio_cache /* 2131756506 */:
                if (VKAccountManager.getCurrent().isMusicRestricted()) {
                    this.boomHelper.loadTrack(this, AudioFacade.getCurrentTrack(), BoomHelper.From.player);
                    return true;
                }
                toggleCachedState();
                return true;
            case R.id.audio_lyrics /* 2131756507 */:
                showLyrics();
                return true;
            case R.id.audio_delete /* 2131756508 */:
                confirmAndDelete();
                return true;
            case R.id.audio_search_artist /* 2131756509 */:
                searchArtist();
                return true;
            case R.id.send_to_friend /* 2131756510 */:
                NewsEntry e = new NewsEntry();
                e.attachments = new ArrayList<>();
                e.attachments.add(new AudioAttachment(AudioFacade.getCurrentTrack()));
                e.type = -1;
                startActivity(new Intent(this, RepostActivity.class).putExtra(ArgKeys.POST, e).putExtra("msg", true));
                return true;
        }
        return super.onOptionsItemSelected(item);
    }

    private void updateAddButton(PlayerTrack track) {
        if (AudioFacade.getPlayerState() != PlayerState.IDLE && this.buttonAdd != null) {
            if (track != null && VKAccountManager.isCurrentUser(track.oid)) {
                setEnabledAddButton(true);
                this.buttonAdd.setImageDrawable(new RecoloredDrawable(ContextCompat.getDrawable(this, R.drawable.ic_check_24dp), getResources().getColorStateList(R.color.highlightable_text)));
                this.buttonAdd.setSelected(true);
                return;
            }
            this.buttonAdd.setImageDrawable(new RecoloredDrawable(ContextCompat.getDrawable(this, R.drawable.ic_add_24dp), getResources().getColorStateList(R.color.highlightable_text)));
            setEnabledAddButton(true);
            this.buttonAdd.setSelected(false);
        }
    }

    @Override // android.support.v7.app.AppCompatActivity, android.app.Activity
    public void invalidateOptionsMenu() {
        super.invalidateOptionsMenu();
        updateAddButton(AudioFacade.getCurrentTrack());
    }

    @Override // android.app.Activity
    public boolean onNavigateUp() {
        finish();
        return true;
    }

    private void toggleCachedState() {
        if (AudioFacade.toggleCurrentCachedState()) {
            invalidateOptionsMenu();
        }
    }

    private synchronized void addCurrent() {
        if (AudioFacade.getPlayerState() != PlayerState.IDLE && this.addRequest == null) {
            final PlayerTrack file = AudioFacade.getCurrentTrack();
            if (file != null && VKAccountManager.isCurrentUser(file.oid)) {
                deleteFile(file);
            } else if (file != null) {
                setEnabledAddButton(false);
                this.addRequest = new AudioAdd(file.oid, file.aid, 0).setCallback(new Callback<Integer>() { // from class: com.vkontakte.android.AudioPlayerActivity.3
                    {
                        AudioPlayerActivity.this = this;
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void success(Integer id) {
                        int newOid = VKAccountManager.getCurrent().getUid();
                        int newAid = id.intValue();
                        File cacheFile = AudioFacade.getTrackDownloadFile(file.oid, file.aid);
                        File newCacheFile = AudioFacade.getTrackDownloadFile(newOid, newAid);
                        if (cacheFile.exists()) {
                            cacheFile.renameTo(newCacheFile);
                        }
                        boolean cashedTrack = AudioFacade.isCached(file.getMid()) || AudioFacade.isAudioCacheEnable();
                        if (cashedTrack) {
                            AudioFacade.removeSavedTrack(file.getMid());
                        }
                        file.changeIds(newOid, newAid);
                        if (cashedTrack) {
                            AudioFacade.startDownloadTracks((MusicTrack) file, false);
                        }
                        Toast.makeText(AudioPlayerActivity.this, (int) R.string.audio_added, 0).show();
                        AudioFacade.sendUserAudioAdded(file);
                        AudioPlayerActivity.this.invalidateOptionsMenu();
                        AudioPlayerActivity.this.addRequest = null;
                        AudioPlayerActivity.this.setEnabledAddButton(true);
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        Toast.makeText(AudioPlayerActivity.this, (int) R.string.audio_add_error, 0).show();
                        AudioPlayerActivity.this.addRequest = null;
                        AudioPlayerActivity.this.setEnabledAddButton(true);
                    }
                }).exec((Context) this);
            }
        }
    }

    private void deleteFile(final PlayerTrack playerTrack) {
        if (this.deleteRequest == null) {
            setEnabledAddButton(false);
            this.deleteRequest = new AudioDelete(playerTrack).setCallback(new ResultlessCallback(this) { // from class: com.vkontakte.android.AudioPlayerActivity.4
                {
                    AudioPlayerActivity.this = this;
                }

                @Override // com.vkontakte.android.api.ResultlessCallback
                public void success() {
                    Toast.makeText(AudioPlayerActivity.this, (int) R.string.audio_deleted, 0).show();
                    boolean playerWasStoped = AudioFacade.deleteAudio(playerTrack);
                    AudioPlayerActivity.this.deleteRequest = null;
                    AudioPlayerActivity.this.setEnabledAddButton(true);
                    if (playerWasStoped) {
                        AudioPlayerActivity.this.finish();
                    }
                }

                @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
                public void fail(VKAPIRequest.VKErrorResponse error) {
                    super.fail(error);
                    AudioPlayerActivity.this.deleteRequest = null;
                    AudioPlayerActivity.this.setEnabledAddButton(true);
                }
            }).exec((Context) this);
        }
    }

    private void confirmAndDelete() {
        PlayerTrack playerTrack = AudioFacade.getCurrentTrack();
        if (playerTrack != null) {
            new VKAlertDialog.Builder(this).setTitle(R.string.confirm).setMessage(R.string.delete_audio_confirm_profile).setPositiveButton(R.string.yes, AudioPlayerActivity$$Lambda$1.lambdaFactory$(this, playerTrack)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
        }
    }

    public /* synthetic */ void lambda$confirmAndDelete$0(PlayerTrack playerTrack, DialogInterface dialog, int which) {
        deleteFile(playerTrack);
    }

    private void searchArtist() {
        MusicTrack musicTrack = AudioFacade.getCurrentTrack();
        if (musicTrack != null) {
            new SearchFragment.Builder().query(musicTrack.artist).openResults(true).openArtistPage(true).go(this);
        }
    }

    public void displayInfo(TrackInfo trackInfo) {
        if (this.seekProgress != null && this.textTime != null) {
            boolean isContentMode = trackInfo.isContentMode();
            ViewUtils.post(AudioPlayerActivity$$Lambda$2.lambdaFactory$(this, isContentMode));
            this.seekProgress.setProgress(trackInfo.getPositionPercent());
            long s = trackInfo.getPosition() / 1000;
            this.textTime.setText(String.format("%d:%02d", Long.valueOf(s / 60), Long.valueOf(s % 60)));
            this.seekProgress.setSecondaryProgress(trackInfo.getBufferingPercent());
        }
        this.lastTrackInfo = trackInfo;
        syncEnabled(trackInfo);
        if (TextUtils.isEmpty(this.textArtist.getText()) && TextUtils.isEmpty(this.textTitle.getText())) {
            this.textArtist.setText(trackInfo.getSubTitle());
            this.textTitle.setText(trackInfo.getTitle());
        } else {
            animateNewTextArtistAndTitle(trackInfo.getSubTitle(), trackInfo.getTitle());
        }
        updateAddButton(trackInfo.getTrack());
        long s2 = trackInfo.getDuration() / 1000;
        this.textDuration.setText(String.format("%d:%02d", Long.valueOf(s2 / 60), Long.valueOf(s2 % 60)));
        this.textArtist.setSelected(true);
        this.textTitle.setSelected(true);
    }

    public /* synthetic */ void lambda$displayInfo$1(boolean isContentMode) {
        if (isContentMode) {
            this.seekProgress.setProgressDrawable(ViewUtils.getDrawable(this.seekProgress.getContext(), R.drawable.progress_player));
        } else {
            this.seekProgress.setProgressDrawable(ViewUtils.getDrawable(this.seekProgress.getContext(), R.drawable.progress_player_ad));
        }
    }

    private void showBroadcastDialog() {
        ArrayList<Group> grps = new ArrayList<>();
        Groups.getAdminedGroups(grps);
        ArrayList<String> items = new ArrayList<>();
        ArrayList<Integer> ids = new ArrayList<>();
        ArrayList<Integer> targets = AudioFacade.getBroadcastTargets();
        items.add(getResources().getString(R.string.my_page));
        Iterator<Group> it = grps.iterator();
        while (it.hasNext()) {
            items.add(it.next().name);
        }
        boolean[] checked = new boolean[items.size()];
        checked[0] = targets.contains(Integer.valueOf(VKAccountManager.getCurrent().getUid()));
        ids.add(Integer.valueOf(VKAccountManager.getCurrent().getUid()));
        int i = 1;
        Iterator<Group> it2 = grps.iterator();
        while (it2.hasNext()) {
            Group g = it2.next();
            checked[i] = targets.contains(Integer.valueOf(-g.id));
            ids.add(Integer.valueOf(-g.id));
            i++;
        }
        new VKAlertDialog.Builder(this).setTitle(R.string.audio_broadcast).setMultiChoiceItems((CharSequence[]) items.toArray(new String[items.size()]), checked, AudioPlayerActivity$$Lambda$3.lambdaFactory$(checked)).setPositiveButton(R.string.ok, AudioPlayerActivity$$Lambda$4.lambdaFactory$(this, checked, ids)).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).show();
    }

    public static /* synthetic */ void lambda$showBroadcastDialog$2(boolean[] checked, DialogInterface dialog, int which, boolean isChecked) {
        checked[which] = isChecked;
    }

    public /* synthetic */ void lambda$showBroadcastDialog$3(boolean[] checked, ArrayList ids, DialogInterface dialog, int which) {
        ArrayList arrayList = new ArrayList();
        for (int i1 = 0; i1 < checked.length; i1++) {
            if (checked[i1]) {
                arrayList.add(ids.get(i1));
            }
        }
        AudioFacade.setBroadcast(arrayList);
        this.buttonBroadcast.setSelected(arrayList.size() > 0);
    }

    public boolean haveLyrics(PlayerTrack track) {
        return !TextUtils.isEmpty(track.lyricsText);
    }

    public void showLyrics() {
        ViewPager pagerCover = this.pagerCover;
        if (pagerCover != null) {
            for (int i = pagerCover.getChildCount() - 1; i >= 0; i--) {
                Holder holder = (Holder) pagerCover.getChildAt(i).getTag();
                PlayerTrack lastTrack = this.lastTrackInfo == null ? null : this.lastTrackInfo.getTrack();
                if (lastTrack != null && holder != null && lastTrack.equals(holder.lastTrack)) {
                    ScrollView sv = (ScrollView) holder.itemView;
                    if (sv.getScrollY() < sv.getHeight() / 2) {
                        sv.smoothScrollTo(0, sv.getHeight() / 2);
                        return;
                    }
                    return;
                }
            }
        }
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int pos) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int page, float offset, int offsetPx) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
        L.i("state changed " + state);
        this.pagerCoverScrollState = state;
        if (state == 0) {
            int pos = this.pagerCover.getCurrentItem();
            if (pos == 0) {
                this.pagerCover.setCurrentItem(this.pagerCover.mo1110getAdapter().getCount() - 2, false);
            }
            if (pos >= this.pagerCover.mo1110getAdapter().getCount() - 1) {
                this.pagerCover.setCurrentItem(1, false);
            }
            PlayerTrack realCurrentTrack = AudioFacade.getCurrentTrack();
            PlayerTrack currentTrack = this.coverPagerAdapter.getByPosition(pos);
            if (this.pagerCoverScrollStateDragIdle == 1 && currentTrack != null) {
                if (!TextUtils.equals(realCurrentTrack == null ? null : realCurrentTrack.uuid, currentTrack.uuid)) {
                    AudioFacade.playTrack(currentTrack.uuid);
                }
            }
            this.coverPagerAdapter.notifyDataSetChanged();
            int position = this.coverPagerAdapter.getPositionForTrack(realCurrentTrack);
            this.pagerCover.setAdapter(this.coverPagerAdapter);
            if (position >= 0) {
                this.pagerCover.setCurrentItem(position + 1, false);
            }
        }
        if (state == 1) {
            this.pagerCoverScrollStateDragIdle = 1;
        } else if (state == 0) {
            this.pagerCoverScrollStateDragIdle = 0;
        }
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStopTrackingTouch(SeekBar seekBar) {
        AudioFacade.seekTo(seekBar.getProgress());
        this.canUpdateProgress = true;
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onStartTrackingTouch(SeekBar seekBar) {
        this.canUpdateProgress = false;
    }

    @Override // android.widget.SeekBar.OnSeekBarChangeListener
    public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        View anchor;
        boolean z = true;
        switch (view.getId()) {
            case R.id.back /* 2131755557 */:
                finish();
                return;
            case R.id.disable_music_ad /* 2131755558 */:
                BuyMusicSubscriptionFragment.show(view.getContext());
                return;
            case R.id.audio_player_progress_wrap /* 2131755559 */:
            case R.id.aplayer_progress /* 2131755560 */:
            case R.id.aplayer_duration /* 2131755561 */:
            case R.id.aplayer_time /* 2131755562 */:
            case R.id.aplayer_artist /* 2131755563 */:
            case R.id.audio_player_buttons /* 2131755564 */:
            default:
                return;
            case R.id.aplayer_add /* 2131755565 */:
                addCurrent();
                return;
            case R.id.aplayer_prev /* 2131755566 */:
                if (this.pagerCoverScrollState == 0) {
                    AudioFacade.prev();
                    return;
                }
                return;
            case R.id.aplayer_play /* 2131755567 */:
                AudioFacade.toggleResumePause();
                return;
            case R.id.aplayer_next /* 2131755568 */:
                if (this.pagerCoverScrollState == 0) {
                    AudioFacade.next();
                    return;
                }
                return;
            case R.id.aplayer_playlist /* 2131755569 */:
                new AudioPlaylistFragment().show(getFragmentManager().beginTransaction().addToBackStack(null), "dialog");
                return;
            case R.id.aplayer_broadcast /* 2131755570 */:
                if (AudioFacade.getPlayerState() != PlayerState.IDLE) {
                    showBroadcastDialog();
                    return;
                }
                return;
            case R.id.aplayer_shuffle /* 2131755571 */:
                boolean isRandom = AudioFacade.isShuffle();
                AudioFacade.toggleShuffle();
                if (isRandom) {
                    z = false;
                }
                view.setSelected(z);
                return;
            case R.id.aplayer_repeat /* 2131755572 */:
                if (AudioFacade.getPlayerState() != PlayerState.IDLE) {
                    LoopMode loopMode = AudioFacade.getLoopMode();
                    if (loopMode != LoopMode.TRACK) {
                        AudioFacade.setRepeatMode(LoopMode.TRACK);
                    } else {
                        AudioFacade.setRepeatMode(LoopMode.NONE);
                    }
                    if (loopMode == LoopMode.TRACK) {
                        z = false;
                    }
                    view.setSelected(z);
                    return;
                }
                return;
            case R.id.aplayer_menu /* 2131755573 */:
                if (this.isTablet) {
                    View fakeView = new View(this);
                    fakeView.setLayoutParams(new FrameLayout.LayoutParams(view.getWidth(), view.getHeight()));
                    int[] pos = {0, 0};
                    view.getLocationInWindow(pos);
                    fakeView.setTranslationX(pos[0] - V.dp(80.0f));
                    fakeView.setTranslationY(pos[1]);
                    ((ViewGroup) getWindow().getDecorView()).addView(fakeView);
                    anchor = fakeView;
                } else {
                    anchor = view;
                }
                PopupMenu pm = new PopupMenu(this, anchor);
                onCreateOptionsMenu(pm.getMenu());
                onPrepareOptionsMenu(pm.getMenu());
                pm.setOnMenuItemClickListener(AudioPlayerActivity$$Lambda$5.lambdaFactory$(this));
                if (this.isTablet) {
                    pm.setOnDismissListener(AudioPlayerActivity$$Lambda$6.lambdaFactory$(this, anchor));
                }
                pm.show();
                return;
        }
    }

    public /* synthetic */ void lambda$onClick$4(View anchor, PopupMenu menu) {
        ((ViewGroup) getWindow().getDecorView()).removeView(anchor);
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
        if (trackInfo != null) {
            PlayerTrack lastTrack = this.lastTrackInfo == null ? null : this.lastTrackInfo.getTrack();
            int lastIndex = lastTrack == null ? -1 : this.coverPagerAdapter.indexOf(lastTrack) + 1;
            int index = this.coverPagerAdapter.indexOf(trackInfo.getTrack()) + 1;
            if (this.coverPagerAdapter.getCount() >= 3 && lastIndex != -1) {
                if (index == this.coverPagerAdapter.getCount() - 2) {
                    if (Math.abs(lastIndex - 0) < Math.abs(index - lastIndex)) {
                        index = 0;
                    }
                } else if (index == 1) {
                    int indexAlternative = this.coverPagerAdapter.getCount() - 1;
                    if (Math.abs(lastIndex - indexAlternative) < Math.abs(index - lastIndex)) {
                        index = indexAlternative;
                    }
                }
            }
            displayInfo(trackInfo);
            this.coverPagerAdapter.notifyDataSetChanged();
            if (this.pagerCover != null) {
                this.pagerCover.setCurrentItem(index, true);
            }
            this.buttonPlay.setImageDrawable(state.isPlayState() ? this.pauseIcon : this.playIcon);
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onTrackListChanged(List<PlayerTrack> list) {
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onProgress(TrackInfo trackInfo) {
        if (this.canUpdateProgress) {
            int progress = trackInfo.getPositionPercent();
            long ms = trackInfo.getPosition() / 1000;
            this.seekProgress.setProgress(progress);
            this.textTime.setText(String.format("%d:%02d", Long.valueOf(ms / 60), Long.valueOf(ms % 60)));
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onBufferingProgress(TrackInfo trackInfo) {
        this.seekProgress.setSecondaryProgress(trackInfo.getBufferingPercent());
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onParametersChanged(Player player) {
        this.coverPagerAdapter.notifyDataSetChanged();
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onSavedTracksChanged() {
        invalidateOptionsMenu();
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onSavedTracksSaved() {
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onDownloadStarted() {
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onDownloadFinished(boolean completed) {
    }

    private void animateNewTextArtistAndTitle(CharSequence artist, CharSequence title) {
        boolean isSaveMode = Build.VERSION.SDK_INT >= 21 && ((PowerManager) getSystemService("power")).isPowerSaveMode();
        if (isSaveMode) {
            this.textArtist.setText(artist);
            this.textTitle.setText(title);
        } else if (this.animatorArtistTitle == null || !TextUtils.equals(artist, (CharSequence) this.textArtist.getTag()) || !TextUtils.equals(title, (CharSequence) this.textTitle.getTag())) {
            this.textArtist.setTag(artist);
            this.textTitle.setTag(title);
            Animator animator = this.animatorArtistTitle;
            if (animator != null) {
                animator.cancel();
            }
            CharSequence curArtist = this.textArtist.getText();
            CharSequence curTitle = this.textTitle.getText();
            ArrayList<Animator> animators = new ArrayList<>();
            if (!TextUtils.equals(curArtist, artist)) {
                ObjectAnimator oa = ObjectAnimator.ofFloat(this.textArtist, "alpha", 1.0f, 0.0f).setDuration(200L);
                oa.setRepeatMode(2);
                oa.setRepeatCount(1);
                oa.addListener(this.animatorArtistTitleListener);
                animators.add(oa);
            }
            if (!TextUtils.equals(curTitle, title)) {
                ObjectAnimator oa2 = ObjectAnimator.ofFloat(this.textTitle, "alpha", 1.0f, 0.0f).setDuration(200L);
                oa2.setRepeatMode(2);
                oa2.setRepeatCount(1);
                if (TextUtils.equals(curArtist, artist)) {
                    oa2.addListener(this.animatorArtistTitleListener);
                }
                animators.add(oa2);
            }
            AnimatorSet set = new AnimatorSet();
            this.animatorArtistTitle = set;
            set.playTogether(animators);
            set.start();
        }
    }

    private <T extends View> T setOnClickListener(@IdRes int id) {
        T t = (T) findViewById(id);
        if (t != null) {
            t.setOnClickListener(this);
        }
        return t;
    }

    /* loaded from: classes2.dex */
    private static class CoverPagerAdapter extends PagerAdapter {
        private Activity activity;
        private List<PlayerTrack> playerTracks = Collections.emptyList();
        private final Drawable placeholder = new RecoloredDrawable(ContextCompat.getDrawable(VKApplication.context, R.drawable.aplayer_cover_placeholder), -11707541);

        public CoverPagerAdapter(Activity activity) {
            this.activity = activity;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void notifyDataSetChanged() {
            this.playerTracks = new ArrayList(AudioFacade.getActualTrackList());
            super.notifyDataSetChanged();
        }

        public int indexOf(PlayerTrack track) {
            for (int i = 0; i < this.playerTracks.size(); i++) {
                PlayerTrack playerTrack = this.playerTracks.get(i);
                String playerTrackMid = playerTrack == null ? null : playerTrack.getMid();
                String trackMid = track == null ? null : track.getMid();
                if (TextUtils.equals(playerTrackMid, trackMid)) {
                    return i;
                }
            }
            return 0;
        }

        @Override // android.support.v4.view.PagerAdapter
        public int getCount() {
            return this.playerTracks.size() <= 1 ? this.playerTracks.size() : this.playerTracks.size() + 2;
        }

        @Override // android.support.v4.view.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }

        PlayerTrack getByPosition(int position) {
            if (position <= 0) {
                return getPlayerTrack(this.playerTracks.size() - 1);
            }
            if (position >= getCount() - 1) {
                return getPlayerTrack(0);
            }
            return getPlayerTrack(position - 1);
        }

        @Nullable
        PlayerTrack getPlayerTrack(int position) {
            if (this.playerTracks == null || position < 0 || position >= this.playerTracks.size()) {
                return null;
            }
            return this.playerTracks.get(position);
        }

        int getPositionForTrack(PlayerTrack playerTrack) {
            for (int i = 0; i < this.playerTracks.size(); i++) {
                if (Utils.equals(playerTrack, this.playerTracks.get(i))) {
                    return i;
                }
            }
            return -1;
        }

        @Override // android.support.v4.view.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            View view = new Holder(this.activity, container, this.placeholder).fillPlayerTrack(getByPosition(position)).itemView;
            container.addView(view);
            return view;
        }

        @Override // android.support.v4.view.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView((View) object);
        }
    }

    /* loaded from: classes2.dex */
    public static class Holder {
        final Activity activity;
        final VKImageView coverView;
        final View itemView;
        PlayerTrack lastTrack;
        final TextView lyrics;

        Holder(Activity activity, ViewGroup container, Drawable defaultPlaceholder) {
            this.activity = activity;
            this.itemView = LayoutInflater.from(container.getContext()).inflate(R.layout.audio_player_cover_scroll, container, false);
            this.itemView.setTag(this);
            this.coverView = (VKImageView) this.itemView.findViewById(R.id.audio_player_cover);
            this.lyrics = (TextView) this.itemView.findViewById(R.id.audio_player_lyrics);
            this.coverView.setPlaceholderImage(defaultPlaceholder);
        }

        Holder fillPlayerTrack(final PlayerTrack track) {
            this.lastTrack = track;
            if (track != null) {
                if (track.getThumb() != null) {
                    int w = this.coverView.getContext().getResources().getConfiguration().screenWidthDp;
                    int h = this.coverView.getContext().getResources().getConfiguration().screenHeightDp;
                    this.coverView.load(track.getThumbUrl(Math.min(w, h)));
                } else {
                    this.coverView.clear();
                }
                if (track.lyricsID > 0) {
                    if (!TextUtils.isEmpty(track.lyricsText)) {
                        this.lyrics.setText(track.lyricsText);
                        ViewUtils.setEnabled(this.itemView, true);
                        this.activity.invalidateOptionsMenu();
                    } else {
                        ViewUtils.setEnabled(this.itemView, false);
                        new AudioGetLyrics(track.lyricsID).setCallback(new Callback<AudioGetLyrics.Result>() { // from class: com.vkontakte.android.AudioPlayerActivity.Holder.1
                            {
                                Holder.this = this;
                            }

                            @Override // com.vkontakte.android.api.Callback
                            public void success(AudioGetLyrics.Result res) {
                                track.lyricsText = res.text;
                                if (Holder.this.lastTrack != null && Holder.this.lastTrack.lyricsID == res.id) {
                                    Holder.this.lyrics.setText(res.text);
                                    ViewUtils.setEnabled(Holder.this.itemView, true);
                                    Holder.this.activity.invalidateOptionsMenu();
                                }
                            }

                            @Override // com.vkontakte.android.api.Callback
                            public void fail(VKAPIRequest.VKErrorResponse error) {
                            }
                        }).exec((Context) this.activity);
                    }
                } else {
                    ViewUtils.setEnabled(this.itemView, false);
                }
            } else {
                this.coverView.clear();
            }
            return this;
        }
    }
}
