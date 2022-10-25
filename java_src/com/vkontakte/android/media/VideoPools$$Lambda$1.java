package com.vkontakte.android.media;

import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.media.VideoPools;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class VideoPools$$Lambda$1 implements Runnable {
    private final VideoFile arg$1;
    private final int arg$2;
    private final String arg$3;
    private final int arg$4;
    private final boolean arg$5;
    private final boolean arg$6;
    private final String arg$7;
    private final VideoPools.PlayerContext arg$8;

    private VideoPools$$Lambda$1(VideoFile videoFile, int i, String str, int i2, boolean z, boolean z2, String str2, VideoPools.PlayerContext playerContext) {
        this.arg$1 = videoFile;
        this.arg$2 = i;
        this.arg$3 = str;
        this.arg$4 = i2;
        this.arg$5 = z;
        this.arg$6 = z2;
        this.arg$7 = str2;
        this.arg$8 = playerContext;
    }

    public static Runnable lambdaFactory$(VideoFile videoFile, int i, String str, int i2, boolean z, boolean z2, String str2, VideoPools.PlayerContext playerContext) {
        return new VideoPools$$Lambda$1(videoFile, i, str, i2, z, z2, str2, playerContext);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        VideoPools.lambda$obtainAndAttachPlayer$1(this.arg$1, this.arg$2, this.arg$3, this.arg$4, this.arg$5, this.arg$6, this.arg$7, this.arg$8);
    }
}
