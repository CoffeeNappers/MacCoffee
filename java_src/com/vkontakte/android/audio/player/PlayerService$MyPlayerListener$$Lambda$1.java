package com.vkontakte.android.audio.player;

import android.graphics.Bitmap;
import com.vkontakte.android.audio.player.PlayerService;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlayerService$MyPlayerListener$$Lambda$1 implements Consumer {
    private final PlayerService.MyPlayerListener arg$1;
    private final String arg$2;

    private PlayerService$MyPlayerListener$$Lambda$1(PlayerService.MyPlayerListener myPlayerListener, String str) {
        this.arg$1 = myPlayerListener;
        this.arg$2 = str;
    }

    public static Consumer lambdaFactory$(PlayerService.MyPlayerListener myPlayerListener, String str) {
        return new PlayerService$MyPlayerListener$$Lambda$1(myPlayerListener, str);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$onStateChanged$0(this.arg$2, (Bitmap) obj);
    }
}
