package com.vkontakte.android.audio.http.downloadfile;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes2.dex */
public interface DownloadFileConverter {
    void convert(InputStream inputStream, OutputStream outputStream, DownloadFileConverterListener downloadFileConverterListener) throws IOException;
}
