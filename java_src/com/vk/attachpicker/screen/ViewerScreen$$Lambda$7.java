package com.vk.attachpicker.screen;

import com.vk.attachpicker.mediastore.MediaStoreEntry;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ViewerScreen$$Lambda$7 implements Runnable {
    private final ViewerScreen arg$1;
    private final MediaStoreEntry arg$2;

    private ViewerScreen$$Lambda$7(ViewerScreen viewerScreen, MediaStoreEntry mediaStoreEntry) {
        this.arg$1 = viewerScreen;
        this.arg$2 = mediaStoreEntry;
    }

    public static Runnable lambdaFactory$(ViewerScreen viewerScreen, MediaStoreEntry mediaStoreEntry) {
        return new ViewerScreen$$Lambda$7(viewerScreen, mediaStoreEntry);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$10(this.arg$2);
    }
}
