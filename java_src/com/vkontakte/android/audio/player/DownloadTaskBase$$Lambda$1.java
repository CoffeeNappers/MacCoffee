package com.vkontakte.android.audio.player;

import com.vkontakte.android.audio.http.downloadfile.DownloadFileListener;
import com.vkontakte.android.functions.VoidF2;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DownloadTaskBase$$Lambda$1 implements VoidF2 {
    private final DownloadFileListener arg$1;

    private DownloadTaskBase$$Lambda$1(DownloadFileListener downloadFileListener) {
        this.arg$1 = downloadFileListener;
    }

    public static VoidF2 lambdaFactory$(DownloadFileListener downloadFileListener) {
        return new DownloadTaskBase$$Lambda$1(downloadFileListener);
    }

    @Override // com.vkontakte.android.functions.VoidF2
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2) {
        DownloadTaskBase.lambda$downloadTracks$0(this.arg$1, (Long) obj, (Long) obj2);
    }
}
