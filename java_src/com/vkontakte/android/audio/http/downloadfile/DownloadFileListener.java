package com.vkontakte.android.audio.http.downloadfile;
/* loaded from: classes2.dex */
public interface DownloadFileListener {
    boolean isCancelled();

    void onProgress(long j, long j2, int i);
}
