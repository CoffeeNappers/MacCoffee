package com.vkontakte.android.media;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.support.v4.util.Pair;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.SparseArray;
import android.widget.AbsListView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.auth.configs.VideoConfig;
import com.vkontakte.android.cache.Gifs;
import com.vkontakte.android.cache.Videos;
import com.vkontakte.android.media.AutoPlay;
import com.vkontakte.android.utils.L;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
/* loaded from: classes3.dex */
public class VideoRecyclerViewHelper implements AbsListView.OnScrollListener, AutoPlay.Listener {
    private static final int BEYOND_ITEMS_TO_PRELOAD = 30;
    public static final float CAN_PLAY_IDLE_STATE = 0.5f;
    public static final float CAN_PLAY_SLOW_STATE = 0.2f;
    private static final String TAG = "VideoRecyclerViewHelper";
    private Context context;
    private boolean gifAutoPlay;
    private int lastVisibleCount;
    private AutoPlay playingNow;
    private final int preloadByDirection;
    private AutoPlayProvider provider;
    private int scrollState;
    private boolean videoAutoPlay;
    private final SparseArray<AutoPlay> queue = new SparseArray<>();
    private final SparseArray<AutoPlay> toRemove = new SparseArray<>();
    private final SparseArray<AutoPlay> candidates = new SparseArray<>();
    private final TreeMap<Integer, AutoPlay> videosShift = new TreeMap<>();
    private final Map<AutoPlay, Integer> videosPos = new HashMap();
    private int lastFirstVisible = -1;

    public VideoRecyclerViewHelper(Context context) {
        this.context = context;
        int size = -1;
        VideoConfig config = VideoConfig.getInstance();
        size = config != null ? config.getPoolSize() : size;
        if (size == -1) {
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            int memClass = activityManager.getMemoryClass();
            if (memClass >= 192) {
                size = 2;
            } else {
                size = memClass > 64 ? 1 : 0;
            }
        }
        this.preloadByDirection = size;
        checkAutoPlayPreferences();
    }

    private void checkAutoPlayPreferences() {
        this.videoAutoPlay = Videos.allowAutoPlayVideo();
        this.gifAutoPlay = Gifs.allowAutoPlay();
    }

    public void setProvider(AutoPlayProvider provider) {
        this.provider = provider;
    }

    public void onDestroy() {
        clear();
        this.context = null;
        this.provider = null;
    }

    public void onUpdate(RecyclerView recyclerView) {
        clear();
        RecyclerView.LayoutManager lm = recyclerView.getLayoutManager();
        if (lm instanceof LinearLayoutManager) {
            LinearLayoutManager layoutManager = (LinearLayoutManager) lm;
            int firstVisible = layoutManager.findFirstVisibleItemPosition();
            int visibleCount = Math.abs(firstVisible - layoutManager.findLastVisibleItemPosition());
            int itemCount = recyclerView.mo1204getAdapter().getItemCount();
            this.lastFirstVisible = -1;
            onScroll(null, firstVisible, visibleCount, itemCount);
        }
    }

    private void clear() {
        cancelAll();
        this.playingNow = null;
    }

    public void onListUpdate() {
        L.d(TAG, "onListUpdate");
        for (int i = 0; i < this.queue.size(); i++) {
            this.queue.valueAt(i).detachSurface();
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay.Listener
    public void onPause(Activity activity) {
        AutoPlay now = this.playingNow;
        if (now != null && activity == this.context) {
            now.pause();
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay.Listener
    public void onResume(Activity activity) {
        checkAutoPlayPreferences();
        AutoPlay now = this.playingNow;
        if (now != null && activity == this.context) {
            if (canPlayByType(now.getType())) {
                if (!now.isComplete()) {
                    now.play(true);
                    return;
                }
                return;
            }
            cancel(now);
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay.Listener
    public void onError(AutoPlay autoPlay) {
        L.d(TAG, "Error on " + autoPlay);
        cancel(autoPlay);
    }

    @Override // com.vkontakte.android.media.AutoPlay.Listener
    public void playPrepared(AutoPlay autoPlay) {
        L.d(TAG, "playPrepared " + autoPlay.toString());
        if (autoPlay.isPrepared()) {
            AutoPlay now = this.playingNow;
            if (now != null && now.isPlaying()) {
                now.pause();
            }
            this.playingNow = autoPlay;
            autoPlay.play(false);
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay.Listener
    public AutoPlay getPlayingNow() {
        return this.playingNow;
    }

    @Override // com.vkontakte.android.media.AutoPlay.Listener
    public void onReady(AutoPlay autoPlay) {
        L.d(TAG, "onReady " + autoPlay.toString());
        AutoPlay now = this.playingNow;
        if (now == null || !now.isPlaying()) {
            float percentage = autoPlay.getPercentageOnScreen();
            boolean goodVisible = this.scrollState == 3 ? percentage >= 0.2f : percentage >= 0.5f;
            if (goodVisible && !autoPlay.isComplete()) {
                this.playingNow = autoPlay;
                autoPlay.play(false);
                L.d(TAG, "onReady 0.2f/0.5f " + autoPlay.toString());
                return;
            }
            if (!autoPlay.isPlaying()) {
                autoPlay.waiting();
            }
            L.d(TAG, "onReady nothing play now " + percentage + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + autoPlay.toString());
            return;
        }
        int dist = autoPlay.getScreenCenterDistance();
        if (dist != -1 && dist < now.getScreenCenterDistance()) {
            now.pause();
            autoPlay.play(false);
            this.playingNow = autoPlay;
            L.d(TAG, "onReady screenCenterDistance " + autoPlay.toString());
        } else if (now.getPercentageOnScreen() <= 0.2f) {
            autoPlay.pause();
            this.playingNow = null;
            L.d(TAG, "onReady 0.2f " + autoPlay.toString());
        } else {
            if (!autoPlay.isPlaying()) {
                autoPlay.waiting();
            }
            L.d(TAG, "onReady nothing changes " + autoPlay.toString());
        }
    }

    @Override // com.vkontakte.android.media.AutoPlay.Listener
    public void onComplete(AutoPlay autoPlay) {
        autoPlay.pause();
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
        if ((this.scrollState == 0 || scrollState != 1) && this.provider != null && scrollState != 2) {
            tryToPlayVideo(this.lastFirstVisible, this.lastVisibleCount);
        }
        this.scrollState = scrollState;
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisible, int visibleCount, int totalCount) {
        if (this.provider != null && this.scrollState != 2) {
            if (this.scrollState != 1) {
                if (firstVisible > this.lastFirstVisible) {
                    preload(firstVisible, visibleCount, totalCount, true);
                } else if (firstVisible < this.lastFirstVisible) {
                    preload(firstVisible, visibleCount, totalCount, false);
                }
            }
            tryToPlayVideo(firstVisible, visibleCount);
        }
        this.lastFirstVisible = firstVisible;
        this.lastVisibleCount = visibleCount;
    }

    private void tryToPlayVideo(int firstVisible, int visibleCount) {
        Pair<Integer, AutoPlay> video = getVideoToPlay(firstVisible, visibleCount);
        int position = video.first.intValue();
        AutoPlay autoPlay = video.second;
        AutoPlay playingNow = this.playingNow;
        float percentOnScreen = playingNow == null ? 0.0f : playingNow.getPercentageOnScreen();
        if (playingNow != null && (percentOnScreen <= 0.2f || autoPlay != playingNow)) {
            L.d(TAG, "On scroll pause 0.2f " + playingNow);
            playingNow.pause();
            this.playingNow = null;
        }
        if (autoPlay != null && !autoPlay.isPlaying()) {
            if (autoPlay.isPrepared() && canPlayByType(autoPlay.getType())) {
                L.d(TAG, "On scroll is prepared " + autoPlay);
                onReady(autoPlay);
            } else if (this.queue.get(position) == null) {
                L.d(TAG, "On scroll is new to prepare " + autoPlay);
                add(autoPlay, position);
            } else {
                L.d(TAG, "On scroll is in queue " + autoPlay);
            }
        }
    }

    private Pair<Integer, AutoPlay> getVideoToPlay(int firstVisible, int visibleCount) {
        int shift;
        this.videosPos.clear();
        this.videosShift.clear();
        for (int i = firstVisible; i <= firstVisible + visibleCount; i++) {
            AutoPlay item = this.provider.getItem(i);
            if (item != null && ((canPlayByType(item.getType()) || item.isPlaying()) && (shift = item.getScreenCenterDistance()) >= 0)) {
                this.videosPos.put(item, Integer.valueOf(i));
                this.videosShift.put(Integer.valueOf(shift), item);
            }
        }
        if (this.videosShift.isEmpty()) {
            return new Pair<>(-1, null);
        }
        AutoPlay autoPlay = this.videosShift.firstEntry().getValue();
        int position = this.videosPos.get(autoPlay).intValue();
        return new Pair<>(Integer.valueOf(position), autoPlay);
    }

    private boolean canPlayByType(AutoPlay.Type type) {
        return (type == AutoPlay.Type.VIDEO && this.videoAutoPlay) || (type == AutoPlay.Type.GIF && this.gifAutoPlay);
    }

    private void preload(int start, int visibleCount, int totalCount, boolean increasing) {
        int lookUpCountUp = 30;
        int center = start + (visibleCount / 2);
        int lookUpCountDown = Math.min(30, totalCount - start);
        if (start < 30) {
            lookUpCountUp = (center - start) + 1;
        }
        this.candidates.clear();
        findCandidates(center, lookUpCountDown, true);
        findCandidates(center, lookUpCountUp, false);
        trimCandidates(increasing);
        cancelFurther();
        preloadCandidates();
    }

    private void findCandidates(int start, int lookUpCount, boolean increasing) {
        int found = 0;
        int counter = 0;
        int index = start;
        while (true) {
            int counter2 = counter;
            counter = counter2 + 1;
            if (counter2 < lookUpCount && found <= this.preloadByDirection && index >= 0) {
                AutoPlay item = this.provider.getItem(index);
                if (item != null) {
                    this.candidates.put(index, item);
                    L.d(TAG, "Candidate at " + index + " : " + item);
                    found++;
                }
                index += increasing ? 1 : -1;
            } else {
                return;
            }
        }
    }

    private void trimCandidates(boolean increasing) {
        if (this.preloadByDirection == 0 && this.candidates.size() == 2) {
            AutoPlay first = this.candidates.valueAt(0);
            AutoPlay second = this.candidates.valueAt(1);
            if (first.getScreenCenterDistance() < second.getScreenCenterDistance()) {
                L.d(TAG, "Trimmed last at 1");
                this.candidates.removeAt(1);
                return;
            }
            L.d(TAG, "Trimmed first at 0");
            this.candidates.removeAt(0);
            return;
        }
        while (this.candidates.size() > (this.preloadByDirection * 2) + 1) {
            if (increasing) {
                int firstKey = this.candidates.keyAt(0);
                L.d(TAG, "Trimmed first at " + firstKey);
                this.candidates.remove(firstKey);
            } else {
                int lastKey = this.candidates.keyAt(this.candidates.size() - 1);
                L.d(TAG, "Trimmed last at " + lastKey);
                this.candidates.remove(lastKey);
            }
        }
    }

    private void cancelFurther() {
        int size = this.candidates.size();
        if (size > 0) {
            int firstKey = this.candidates.keyAt(0);
            int lastKey = this.candidates.keyAt(size - 1);
            for (int i = 0; i < size && size > ((this.preloadByDirection * 2) + 1) - this.queue.size(); i++) {
                for (int j = 0; j < this.queue.size(); j++) {
                    int key = this.queue.keyAt(j);
                    if (this.toRemove.get(key) == null && (key < firstKey || key > lastKey)) {
                        this.toRemove.put(key, this.queue.valueAt(j));
                        break;
                    }
                }
            }
            for (int i2 = 0; i2 < this.toRemove.size(); i2++) {
                cancel(this.toRemove.keyAt(i2));
            }
            this.toRemove.clear();
        }
    }

    private void preloadCandidates() {
        for (int i = 0; i < this.candidates.size(); i++) {
            int key = this.candidates.keyAt(i);
            AutoPlay val = this.candidates.valueAt(i);
            if (val.isPrepared()) {
                L.d(TAG, "Preload candidate is prepared (inc) at " + key + " : " + val);
            } else if (this.queue.get(key) == null) {
                add(val, key);
            } else {
                L.d(TAG, "Preload candidate is in queue (inc) at " + key + " : " + val);
            }
        }
    }

    private void add(AutoPlay autoPlay, int key) {
        if (autoPlay != null) {
            if (this.queue.get(key) == null) {
                autoPlay.setListener(this);
                if (canPlayByType(autoPlay.getType())) {
                    autoPlay.prepare();
                }
                this.queue.put(key, autoPlay);
                L.d(TAG, "Video add at " + key + " : " + autoPlay);
                return;
            }
            L.e(TAG, "Video at " + key + " : " + autoPlay + " is already added");
        }
    }

    private void cancelAll() {
        for (int i = 0; i < this.queue.size(); i++) {
            this.toRemove.put(this.queue.keyAt(i), this.queue.valueAt(i));
        }
        for (int i2 = 0; i2 < this.toRemove.size(); i2++) {
            cancel(this.toRemove.keyAt(i2));
        }
        L.d(TAG, "Canceled " + this.toRemove.size() + " videos");
        this.toRemove.clear();
    }

    private void cancel(int key) {
        AutoPlay autoPlay = this.queue.get(key);
        if (autoPlay != null) {
            autoPlay.stop();
            autoPlay.removeListener(this);
            this.queue.remove(key);
            L.d(TAG, "Video cancel at " + key + " : " + autoPlay);
        }
    }

    private void cancel(AutoPlay autoPlay) {
        for (int i = 0; i < this.queue.size(); i++) {
            if (this.queue.valueAt(i) == autoPlay) {
                cancel(this.queue.keyAt(i));
                return;
            }
        }
    }
}
