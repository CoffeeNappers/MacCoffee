package com.vkontakte.android.audio.player;

import java.io.File;
import java.io.FilenameFilter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SavedTracks$$Lambda$1 implements FilenameFilter {
    private static final SavedTracks$$Lambda$1 instance = new SavedTracks$$Lambda$1();

    private SavedTracks$$Lambda$1() {
    }

    @Override // java.io.FilenameFilter
    @LambdaForm.Hidden
    public boolean accept(File file, String str) {
        return SavedTracks.lambda$getFiles$0(file, str);
    }
}
