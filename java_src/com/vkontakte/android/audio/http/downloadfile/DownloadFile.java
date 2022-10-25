package com.vkontakte.android.audio.http.downloadfile;

import android.content.Context;
import java.io.File;
/* loaded from: classes2.dex */
public final class DownloadFile {
    private DownloadFile() {
    }

    public static boolean downloadFile(Context context, String url, File file, boolean checkLastModified, DownloadFileListener listener, DownloadFileConverter converter) throws Exception {
        return DownloadThread.execute(context, url, file, checkLastModified, listener, converter);
    }
}
