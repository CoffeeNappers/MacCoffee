package com.vkontakte.android.audio.player;
/* loaded from: classes2.dex */
public enum PlayerState {
    STOPPED(false),
    PLAYING(true),
    PAUSED(false),
    IDLE(false);
    
    private boolean mIsPlayState;

    PlayerState(boolean isPlayState) {
        this.mIsPlayState = isPlayState;
    }

    public boolean isPlayState() {
        return this.mIsPlayState;
    }
}
