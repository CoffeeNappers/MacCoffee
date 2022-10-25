package com.vkontakte.android.api;

import android.app.Fragment;
import android.content.Context;
/* loaded from: classes2.dex */
public abstract class ResultlessCallback extends SimpleCallback<Boolean> {
    public abstract void success();

    public ResultlessCallback(Context context) {
        super(context);
    }

    public ResultlessCallback(Fragment fragment) {
        super(fragment);
    }

    public ResultlessCallback() {
    }

    @Override // com.vkontakte.android.api.Callback
    public final void success(Boolean result) {
        success();
    }
}
