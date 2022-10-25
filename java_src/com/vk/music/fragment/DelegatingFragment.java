package com.vk.music.fragment;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.vkontakte.android.ui.ActivityResulter;
import com.vkontakte.android.ui.ResulterProvider;
/* loaded from: classes2.dex */
public abstract class DelegatingFragment extends Fragment implements ActivityResulter {
    private FragmentDelegate delegate;

    @NonNull
    protected abstract FragmentDelegate createDelegate();

    @Override // android.app.Fragment
    public void onSaveInstanceState(Bundle outState) {
        outState.putBundle("state", this.delegate.saveInstanceState());
        super.onSaveInstanceState(outState);
    }

    @Override // android.app.Fragment
    public void onCreate(@Nullable Bundle b) {
        Bundle state;
        super.onCreate(b);
        if (this.delegate == null) {
            this.delegate = createDelegate();
        }
        if (b != null && (state = b.getBundle("state")) != null) {
            this.delegate.restoreInstanceState(state);
        }
        setRetainInstance(true);
    }

    @Override // android.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return this.delegate.createView();
    }

    @Override // android.app.Fragment
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ((ResulterProvider) getActivity()).registerActivityResult(this);
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.delegate.resume();
    }

    @Override // android.app.Fragment
    public void onPause() {
        this.delegate.pause();
        super.onPause();
    }

    @Override // android.app.Fragment
    public void onDestroyView() {
        ((ResulterProvider) getActivity()).unregisterActivityResult(this);
        this.delegate.destroyView();
        super.onDestroyView();
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        this.delegate.destroy();
        this.delegate = null;
        super.onDestroy();
    }
}
