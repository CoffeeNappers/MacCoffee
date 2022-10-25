package com.squareup.picasso;

import android.graphics.Bitmap;
import com.squareup.picasso.Picasso;
/* loaded from: classes2.dex */
class FetchAction extends Action<Object> {
    private Callback callback;
    private final Object target;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FetchAction(Picasso picasso, Request data, int memoryPolicy, int networkPolicy, Object tag, String key, Callback callback) {
        super(picasso, null, data, memoryPolicy, networkPolicy, 0, null, key, tag, false);
        this.target = new Object();
        this.callback = callback;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.squareup.picasso.Action
    public void complete(Bitmap result, Picasso.LoadedFrom from) {
        if (this.callback != null) {
            this.callback.onSuccess();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.squareup.picasso.Action
    public void error() {
        if (this.callback != null) {
            this.callback.onError();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.squareup.picasso.Action
    public void cancel() {
        super.cancel();
        this.callback = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.squareup.picasso.Action
    /* renamed from: getTarget */
    public Object mo443getTarget() {
        return this.target;
    }
}
