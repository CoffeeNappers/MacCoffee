package com.vkontakte.android.audio.player;

import com.vkontakte.android.audio.PlayerAction;
import com.vkontakte.android.utils.Utils;
import java.util.Arrays;
/* loaded from: classes2.dex */
public class TrackInfo {
    private int currentIndex;
    private int hash;
    private int[] mBufferingPercent;
    private int[] mDuration;
    private int[] mPosition;
    private PlayerTrack mTrack;
    private final int size;
    private final TrackInfoProvider trackInfoProvider;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface TrackInfoProvider {
        PlayerAction[] getActions(TrackInfo trackInfo, int i);

        String getSubtitle(TrackInfo trackInfo, int i);

        String getTitle(TrackInfo trackInfo, int i);

        boolean isContentMode(TrackInfo trackInfo, int i);
    }

    public TrackInfo(TrackInfo info) {
        int[] iArr = null;
        this.hash = 0;
        this.currentIndex = 0;
        this.mTrack = info.mTrack;
        this.mDuration = info.mDuration == null ? null : Arrays.copyOf(info.mDuration, info.mDuration.length);
        this.mPosition = info.mPosition == null ? null : Arrays.copyOf(info.mPosition, info.mPosition.length);
        this.mBufferingPercent = info.mBufferingPercent != null ? Arrays.copyOf(info.mBufferingPercent, info.mBufferingPercent.length) : iArr;
        this.size = info.size;
        this.trackInfoProvider = info.trackInfoProvider;
        this.currentIndex = info.currentIndex;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TrackInfo(int size, TrackInfoProvider trackInfoProvider) {
        this.hash = 0;
        this.currentIndex = 0;
        this.size = size;
        this.trackInfoProvider = trackInfoProvider;
        clear(false);
    }

    public PlayerTrack getTrack() {
        return this.mTrack;
    }

    public boolean isContentMode() {
        return this.trackInfoProvider.isContentMode(this, this.currentIndex);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setCurrentIndex(int currentIndex) {
        this.currentIndex = currentIndex;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTrack(PlayerTrack track) {
        this.mTrack = track;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clear(boolean preserveProgress) {
        this.mTrack = null;
        if (!preserveProgress) {
            this.mDuration = new int[this.size];
            this.mPosition = new int[this.size];
        }
        this.mBufferingPercent = new int[this.size];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clearBuffering() {
        this.mBufferingPercent = new int[this.size];
    }

    public boolean hasTrack() {
        return this.mTrack != null;
    }

    public int getDuration() {
        return this.mDuration[this.currentIndex];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getDuration(int index) {
        return this.mDuration[index];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setDuration(int index, int duration) {
        this.mDuration[index] = duration;
    }

    public int getPosition() {
        return this.mPosition[this.currentIndex];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getPosition(int index) {
        return this.mPosition[index];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setPosition(int index, int position) {
        this.mPosition[index] = position;
    }

    public int getPositionPercent() {
        if (this.mDuration[this.currentIndex] > 0) {
            return (int) ((this.mPosition[this.currentIndex] * 100) / this.mDuration[this.currentIndex]);
        }
        return 0;
    }

    public int getBufferingPercent() {
        return this.mBufferingPercent[this.currentIndex];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setBufferingPercent(int index, int percent) {
        this.mBufferingPercent[index] = percent;
    }

    public String getTitle() {
        return this.trackInfoProvider.getTitle(this, this.currentIndex);
    }

    public String getSubTitle() {
        return this.trackInfoProvider.getSubtitle(this, this.currentIndex);
    }

    public boolean hasAction(PlayerAction... action) {
        PlayerAction[] actions = this.trackInfoProvider.getActions(this, this.currentIndex);
        if (actions != null) {
            for (PlayerAction action1 : actions) {
                for (PlayerAction action2 : action) {
                    if (action1 == action2) {
                        return true;
                    }
                }
            }
        }
        return actions == null;
    }

    public boolean equals(Object obj) {
        if (obj instanceof TrackInfo) {
            TrackInfo info = (TrackInfo) obj;
            return Utils.equals(info.mTrack, this.mTrack) && info.currentIndex == this.currentIndex;
        }
        return false;
    }

    public int hashCode() {
        if (this.hash == 0) {
            this.hash = this.mTrack == null ? 0 : this.mTrack.hashCode();
        }
        return this.hash;
    }
}
