package com.vkontakte.android.media.audio;

import com.vkontakte.android.media.audio.AudioMessageUtils;
import java.lang.invoke.LambdaForm;
import java.nio.ByteBuffer;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AudioMessageUtils$RecordingRunnable$$Lambda$2 implements Runnable {
    private final AudioMessageUtils.RecordingRunnable arg$1;
    private final ByteBuffer arg$2;

    private AudioMessageUtils$RecordingRunnable$$Lambda$2(AudioMessageUtils.RecordingRunnable recordingRunnable, ByteBuffer byteBuffer) {
        this.arg$1 = recordingRunnable;
        this.arg$2 = byteBuffer;
    }

    public static Runnable lambdaFactory$(AudioMessageUtils.RecordingRunnable recordingRunnable, ByteBuffer byteBuffer) {
        return new AudioMessageUtils$RecordingRunnable$$Lambda$2(recordingRunnable, byteBuffer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
