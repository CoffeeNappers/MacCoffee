package com.vkontakte.android.api;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.fragments.LoaderFragment;
/* loaded from: classes2.dex */
public abstract class SimpleCallback<T> implements Callback<T> {
    private Context context;
    protected Fragment fragment;

    public SimpleCallback(Context context) {
        this.context = context;
    }

    public SimpleCallback(Fragment fragment) {
        this.fragment = fragment;
    }

    public SimpleCallback() {
    }

    @Override // com.vkontakte.android.api.Callback
    public void fail(VKAPIRequest.VKErrorResponse error) {
        if (this.fragment instanceof LoaderFragment) {
            ((LoaderFragment) this.fragment).onError(error);
        } else if (this.fragment instanceof me.grishka.appkit.fragments.LoaderFragment) {
            ((me.grishka.appkit.fragments.LoaderFragment) this.fragment).onError(error);
        } else {
            if (this.context == null) {
                if (this.fragment == null) {
                    return;
                }
                Activity activity = this.fragment.getActivity();
                this.context = activity;
                if (activity == null) {
                    return;
                }
            }
            APIUtils.showErrorToast(this.context, error.getCode(), error.message);
        }
    }
}
