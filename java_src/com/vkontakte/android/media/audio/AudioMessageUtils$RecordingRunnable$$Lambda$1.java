package com.vkontakte.android.media.audio;

import com.vkontakte.android.media.audio.AudioMessageUtils;
import java.lang.invoke.LambdaForm;
import java.nio.ByteBuffer;
/* loaded from: classes.dex */
final /* synthetic */ class AudioMessageUtils$RecordingRunnable$$Lambda$1 implements Runnable {
    private final AudioMessageUtils.RecordingRunnable arg$1;
    private final ByteBuffer arg$2;
    private final boolean arg$3;

    private AudioMessageUtils$RecordingRunnable$$Lambda$1(AudioMessageUtils.RecordingRunnable recordingRunnable, ByteBuffer byteBuffer, boolean z) {
        this.arg$1 = recordingRunnable;
        this.arg$2 = byteBuffer;
        this.arg$3 = z;
    }

    public static Runnable lambdaFactory$(AudioMessageUtils.RecordingRunnable recordingRunnable, ByteBuffer byteBuffer, boolean z) {
        return new AudioMessageUtils$RecordingRunnable$$Lambda$1(recordingRunnable, byteBuffer, z);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$encode$1(this.arg$2, this.arg$3);
    }
}
