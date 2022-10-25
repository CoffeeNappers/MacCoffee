package com.vkontakte.android;
/* loaded from: classes2.dex */
public interface ProgressCallback {
    void onFinished();

    void onProgressUpdated(int i);

    void onSetMaxValue(int i);
}
