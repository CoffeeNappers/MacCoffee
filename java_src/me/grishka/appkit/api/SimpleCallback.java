package me.grishka.appkit.api;

import android.app.Fragment;
import me.grishka.appkit.fragments.LoaderFragment;
/* loaded from: classes3.dex */
public abstract class SimpleCallback<T> implements Callback<T> {
    private Fragment fragment;

    public SimpleCallback(Fragment f) {
        this.fragment = f;
    }

    @Override // me.grishka.appkit.api.Callback
    public void onError(ErrorResponse error) {
        if (this.fragment instanceof LoaderFragment) {
            ((LoaderFragment) this.fragment).onError(error);
        }
    }
}
