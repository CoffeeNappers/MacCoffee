package com.vk.music.fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.View;
/* loaded from: classes2.dex */
public abstract class FragmentDelegate {
    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public abstract View createView();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void destroy();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void destroyView();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void restoreInstanceState(@NonNull Bundle bundle);

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public abstract Bundle saveInstanceState();

    /* JADX INFO: Access modifiers changed from: package-private */
    public void resume() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void pause() {
    }
}
