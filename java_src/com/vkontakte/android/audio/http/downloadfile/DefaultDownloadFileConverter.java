package com.vkontakte.android.audio.http.downloadfile;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes2.dex */
public class DefaultDownloadFileConverter implements DownloadFileConverter {
    @Override // com.vkontakte.android.audio.http.downloadfile.DownloadFileConverter
    public void convert(InputStream in, OutputStream out, DownloadFileConverterListener listener) throws IOException {
        byte[] buff = new byte[65536];
        while (true) {
            int count = in.read(buff);
            if (count >= 0) {
                out.write(buff, 0, count);
                if (!listener.isCancelled()) {
                    listener.onRead(count);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }
}
