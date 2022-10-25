package com.vkontakte.android;

import android.content.Context;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.TypefaceSpan;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.ui.Font;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.grishka.appkit.utils.V;
import me.grishka.appkit.views.DisableableViewPager;
import me.zhanghai.android.materialprogressbar.IndeterminateHorizontalProgressDrawable;
/* loaded from: classes2.dex */
public class AudioAttachView extends ViewGroup implements View.OnClickListener, View.OnLongClickListener, PlayerListener {
    String artist;
    private boolean canUpdateProgress;
    int duration;
    int id;
    boolean isPlaying;
    int oid;
    private ImageView playButton;
    public ArrayList<MusicTrack> playlist;
    public int playlistPos;
    private PostInteract postInteract;
    private String refer;
    private SeekBar seekbar;
    private TextView text1;
    private TextView text2;
    private TextView text3;
    private TextView timeText;
    String title;

    public void setReferData(String refer, PostInteract postInteract) {
        this.refer = refer;
        this.postInteract = postInteract;
    }

    public AudioAttachView(Context context) {
        super(context);
        this.isPlaying = false;
        this.playlist = null;
        this.playlistPos = 0;
        this.canUpdateProgress = true;
        this.refer = "";
        init();
    }

    public AudioAttachView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.isPlaying = false;
        this.playlist = null;
        this.playlistPos = 0;
        this.canUpdateProgress = true;
        this.refer = "";
        init();
    }

    private void init() {
        setClipChildren(false);
        this.text1 = new TextView(getContext());
        this.text1.setEllipsize(TextUtils.TruncateAt.END);
        this.text1.setSingleLine();
        this.text1.setTextColor(getResources().getColor(R.color.almost_black));
        this.text1.setTextSize(1, 15.0f);
        this.text1.setLines(1);
        this.text1.setTypeface(Font.Medium.typeface);
        addView(this.text1);
        this.text2 = new TextView(getContext());
        this.text2.setEllipsize(TextUtils.TruncateAt.END);
        this.text2.setSingleLine();
        this.text2.setTextColor(-2063597051);
        this.text2.setTextSize(1, 14.0f);
        this.text2.setLines(1);
        addView(this.text2);
        this.text3 = new TextView(getContext());
        this.text3.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        this.text3.setHorizontalFadingEdgeEnabled(true);
        this.text3.setFadingEdgeLength(V.dp(10.0f));
        this.text3.setSingleLine();
        this.text3.setTextColor(getResources().getColor(R.color.almost_black));
        this.text3.setTextSize(1, 15.0f);
        this.text3.setLines(1);
        this.text3.setTypeface(Font.Medium.typeface);
        this.text3.setVisibility(8);
        addView(this.text3);
        this.timeText = new TextView(getContext());
        this.timeText.setTextColor(-8881798);
        this.timeText.setTextSize(1, 12.0f);
        this.timeText.setSingleLine();
        addView(this.timeText);
        this.playButton = new ImageView(getContext());
        this.playButton.setImageResource(R.drawable.ic_attach_audio_play);
        addView(this.playButton);
        this.seekbar = new SeekBar(getContext()) { // from class: com.vkontakte.android.AudioAttachView.1
            @Override // android.widget.AbsSeekBar, android.view.View
            public boolean onTouchEvent(MotionEvent event) {
                switch (event.getAction()) {
                    case 0:
                        AudioAttachView.this.lockInterceptTouchEvent();
                        break;
                    case 1:
                    case 3:
                        AudioAttachView.this.unlockInterceptTouchEvent();
                        break;
                }
                return super.onTouchEvent(event);
            }
        };
        this.seekbar.setLayerType(1, null);
        this.seekbar.setMax(100);
        this.seekbar.setProgressDrawable(getResources().getDrawable(R.drawable.progress_audio_attach));
        this.seekbar.setThumb(getResources().getDrawable(R.drawable.audio_slider));
        this.seekbar.setPadding(Global.scale(11.0f), 0, Global.scale(11.0f), 0);
        this.seekbar.setMinimumHeight(Global.scale(5.0f));
        this.seekbar.setThumbOffset(Global.scale(11.0f));
        if (Build.VERSION.SDK_INT >= 21) {
            this.seekbar.setClipToOutline(false);
        }
        try {
            Field fld = ProgressBar.class.getDeclaredField("mMaxHeight");
            fld.setAccessible(true);
            fld.set(this.seekbar, Integer.valueOf(Global.scale(4.0f)));
            Field fld2 = ProgressBar.class.getDeclaredField("mMinHeight");
            fld2.setAccessible(true);
            fld2.set(this.seekbar, Integer.valueOf(Global.scale(4.0f)));
        } catch (Exception x) {
            Log.w("vk", x);
        }
        addView(this.seekbar);
        LayerDrawable layer = new AnimatableLayerDrawable(new Drawable[]{new IndeterminateHorizontalProgressDrawable(getContext())});
        layer.setLayerInset(0, 0, V.dp(6.0f), 0, V.dp(6.0f));
        this.seekbar.setIndeterminateDrawable(layer);
        this.seekbar.setVisibility(4);
        this.timeText.setGravity(85);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        AudioFacade.addPlayerListener(this, true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        AudioFacade.removePlayerListener(this);
    }

    @Override // android.view.View
    public void onMeasure(int w, int h) {
        setMeasuredDimension(View.MeasureSpec.getSize(w), Global.scale(56.0f));
    }

    public void setData(String artist, String title, int _oid, int _aid, int duration) {
        this.text1.setText(artist);
        this.text2.setText(title);
        SpannableStringBuilder ssb = new SpannableStringBuilder(artist);
        Spannable ss = Spannable.Factory.getInstance().newSpannable(" — " + title);
        ss.setSpan(new ForegroundColorSpan(-2063597051), 0, ss.length(), 0);
        ss.setSpan(new AbsoluteSizeSpan(14, true), 0, ss.length(), 0);
        ss.setSpan(new TypefaceSpan("sans-serif"), 0, ss.length(), 0);
        ssb.append((CharSequence) ss);
        this.text3.setText(ssb);
        this.text1.setVisibility(0);
        this.text2.setVisibility(0);
        this.text3.setVisibility(8);
        this.text3.setSelected(false);
        this.timeText.setText(String.format("%d:%02d", Integer.valueOf(duration / 60), Integer.valueOf(duration % 60)));
        this.seekbar.setVisibility(4);
        setOnClickListener(this);
        setOnLongClickListener(this);
        this.oid = _oid;
        this.id = _aid;
        this.artist = artist;
        this.title = title;
        this.duration = duration;
        if (AudioFacade.isCurrentTrack(this.oid, this.id)) {
            if (AudioFacade.getPlayerState().isPlayState()) {
                this.isPlaying = true;
                replaceIcon(R.drawable.ic_attach_audio_pause);
            }
            this.text1.setVisibility(8);
            this.text2.setVisibility(8);
            this.text3.setVisibility(0);
            this.text3.setSelected(true);
            this.seekbar.setVisibility(0);
            this.seekbar.setFocusable(false);
            this.seekbar.setFocusableInTouchMode(false);
        } else {
            this.isPlaying = false;
            replaceIcon(R.drawable.ic_attach_audio_play);
        }
        this.seekbar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() { // from class: com.vkontakte.android.AudioAttachView.2
            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStopTrackingTouch(SeekBar seekBar) {
                AudioFacade.seekTo(seekBar.getProgress());
                AudioAttachView.this.canUpdateProgress = true;
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onStartTrackingTouch(SeekBar seekBar) {
                AudioAttachView.this.canUpdateProgress = false;
            }

            @Override // android.widget.SeekBar.OnSeekBarChangeListener
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lockInterceptTouchEvent() {
        if ("fave".equals(this.refer)) {
            ViewParent parent = this;
            do {
                parent = parent.getParent();
                if (parent == null) {
                    return;
                }
            } while (!(parent instanceof DisableableViewPager));
            ((DisableableViewPager) parent).setSwipeEnabled(false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void unlockInterceptTouchEvent() {
        if ("fave".equals(this.refer)) {
            ViewParent parent = this;
            do {
                parent = parent.getParent();
                if (parent == null) {
                    return;
                }
            } while (!(parent instanceof DisableableViewPager));
            ((DisableableViewPager) parent).setSwipeEnabled(true);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (AudioFacade.isCurrentTrack(this.oid, this.id)) {
            AudioFacade.toggleResumePause();
        } else if (VKAuth.ensureLoggedIn(getContext())) {
            if (!AudioFacade.isCurrentTrack(this.oid, this.id) || AudioFacade.getPlayerState() == PlayerState.IDLE) {
                if (this.playlist == null) {
                    MusicTrack af = new MusicTrack(this.id, this.oid, this.artist, this.title, this.duration, null);
                    AudioFacade.playTrack(af, PlayerRefer.parse(this.refer), true);
                } else {
                    Iterator<MusicTrack> it = this.playlist.iterator();
                    while (it.hasNext()) {
                        MusicTrack file = it.next();
                        file.fromAttachment = true;
                    }
                    AudioFacade.playTracks(this.playlist, this.playlistPos, PlayerRefer.parse(this.refer), true);
                }
                if (this.postInteract != null) {
                    this.postInteract.commit(PostInteract.Type.audio_start);
                }
            }
        }
    }

    private void replaceIcon(int resID) {
        this.playButton.setImageResource(resID);
    }

    public void setPlaying(boolean p) {
        if (getParent() != null) {
            this.isPlaying = p;
            replaceIcon(this.isPlaying ? R.drawable.ic_attach_audio_pause : R.drawable.ic_attach_audio_play);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        int pad = getPaddingLeft();
        this.playButton.layout(pad, V.dp(8.0f), Global.scale(40.0f) + pad, Global.scale(48.0f));
        this.text1.layout(Global.scale(52.0f) + pad, V.dp(8.0f), (r - l) - pad, Global.scale(31.0f));
        this.text3.layout(Global.scale(52.0f) + pad, V.dp(8.0f), (r - l) - pad, Global.scale(31.0f));
        this.text2.layout(Global.scale(52.0f) + pad, Global.scale(31.0f), ((r - l) - Global.scale(50.0f)) - pad, Global.scale(53.0f));
        this.timeText.measure(View.MeasureSpec.makeMeasureSpec(Global.scale(40.0f), 1073741824), View.MeasureSpec.makeMeasureSpec(Global.scale(22.0f), 1073741824));
        this.timeText.layout(((r - l) - pad) - Global.scale(40.0f), (b - t) - V.dp(30.0f), (r - l) - pad, (b - t) - V.dp(8.0f));
        this.seekbar.layout(Global.scale(41.0f) + pad, (b - t) - Global.scale(26.0f), ((r - l) + Global.scale(-39.0f)) - pad, (b - t) - V.dp(4.0f));
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View v) {
        MusicTrack af = new MusicTrack(this.id, this.oid, this.artist, this.title, this.duration, null);
        boolean res = AudioFacade.enqueue(af);
        if (!res) {
            return false;
        }
        Toast.makeText(getContext(), (int) R.string.audio_added_to_queue, 0).show();
        return true;
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
        boolean z = true;
        PlayerTrack track = trackInfo.getTrack();
        if (track != null && track.oid == this.oid && track.aid == this.id) {
            setPlaying(state == PlayerState.PLAYING);
            V.setVisibilityAnimated(this.seekbar, 0);
            V.setVisibilityAnimated(this.text3, 0);
            V.setVisibilityAnimated(this.text2, 8);
            V.setVisibilityAnimated(this.text1, 8);
            this.text3.setSelected(true);
            this.seekbar.setIndeterminate(trackInfo.getDuration() == 0 && (state == PlayerState.PLAYING || state == PlayerState.PAUSED));
            SeekBar seekBar = this.seekbar;
            if (trackInfo.getDuration() == 0 || (state != PlayerState.PLAYING && state != PlayerState.PAUSED)) {
                z = false;
            }
            seekBar.setEnabled(z);
            this.seekbar.setFocusable(false);
            this.seekbar.setFocusableInTouchMode(false);
            if (state != PlayerState.PLAYING && state != PlayerState.PAUSED) {
                this.seekbar.setProgress(0);
                this.seekbar.setSecondaryProgress(0);
            }
        } else if (this.seekbar.getVisibility() == 0) {
            V.setVisibilityAnimated(this.seekbar, 8);
            V.setVisibilityAnimated(this.text3, 8);
            V.setVisibilityAnimated(this.text2, 0);
            V.setVisibilityAnimated(this.text1, 0);
            this.text3.setSelected(false);
            this.timeText.setText(String.format("%d:%02d", Integer.valueOf(this.duration / 60), Integer.valueOf(this.duration % 60)));
            setPlaying(false);
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onTrackListChanged(List<PlayerTrack> list) {
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onProgress(TrackInfo trackInfo) {
        PlayerTrack track = trackInfo.getTrack();
        if (track != null && track.oid == this.oid && track.aid == this.id) {
            if (!this.seekbar.isEnabled()) {
                this.seekbar.setIndeterminate(trackInfo.getDuration() == 0);
                this.seekbar.setEnabled(trackInfo.getDuration() != 0);
            }
            if (this.canUpdateProgress) {
                this.seekbar.setProgress(trackInfo.getPositionPercent());
            }
            if (trackInfo.getDuration() > 0) {
                int left = (trackInfo.getDuration() - trackInfo.getPosition()) / 1000;
                this.timeText.setText(String.format("-%d:%02d", Integer.valueOf(left / 60), Integer.valueOf(left % 60)));
            }
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onBufferingProgress(TrackInfo trackInfo) {
        boolean z = true;
        PlayerTrack track = trackInfo.getTrack();
        if (track != null && track.oid == this.oid && track.aid == this.id) {
            if (!this.seekbar.isEnabled()) {
                this.seekbar.setIndeterminate(trackInfo.getDuration() == 0);
                SeekBar seekBar = this.seekbar;
                if (trackInfo.getDuration() == 0) {
                    z = false;
                }
                seekBar.setEnabled(z);
            }
            this.seekbar.setSecondaryProgress(trackInfo.getBufferingPercent());
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onParametersChanged(Player player) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class AnimatableLayerDrawable extends LayerDrawable implements Animatable {
        public AnimatableLayerDrawable(Drawable[] layers) {
            super(layers);
        }

        @Override // android.graphics.drawable.Animatable
        public void start() {
            ((Animatable) getDrawable(0)).start();
        }

        @Override // android.graphics.drawable.Animatable
        public void stop() {
            ((Animatable) getDrawable(0)).stop();
        }

        @Override // android.graphics.drawable.Animatable
        public boolean isRunning() {
            return ((Animatable) getDrawable(0)).isRunning();
        }
    }
}
