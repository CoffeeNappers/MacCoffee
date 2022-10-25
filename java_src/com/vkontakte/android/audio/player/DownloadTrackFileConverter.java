package com.vkontakte.android.audio.player;

import com.vkontakte.android.audio.http.downloadfile.DownloadFileConverter;
import com.vkontakte.android.audio.http.downloadfile.DownloadFileConverterListener;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes2.dex */
public class DownloadTrackFileConverter implements DownloadFileConverter {
    @Override // com.vkontakte.android.audio.http.downloadfile.DownloadFileConverter
    public void convert(InputStream in, OutputStream out, DownloadFileConverterListener listener) throws IOException {
        byte[] buff = new byte[65536];
        int pos = 0;
        while (true) {
            int count = in.read(buff);
            if (count >= 0) {
                checkPause();
                int i = 0;
                int pos2 = pos;
                while (i < count) {
                    buff[i] = (byte) (buff[i] ^ (((pos2 * 17) + 13) & 255));
                    i++;
                    pos2++;
                }
                out.write(buff, 0, count);
                if (!listener.isCancelled()) {
                    listener.onRead(count);
                    pos = pos2;
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    public void checkPause() {
    }
}
