package com.vkontakte.android.audio.player.exo;

import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.exoplayer2.upstream.DataSpec;
import com.vk.analytics.Analytics;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.player.CacheUtils;
import com.vkontakte.android.audio.player.proxy.FileInfo;
import com.vkontakte.android.audio.player.proxy.LockFile;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.utils.L;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.util.Arrays;
/* loaded from: classes2.dex */
public class AudioCacheHelper {
    private static final String PARAM_MID = "mid";
    private static final String PARAM_URL = "url";
    private BufferedOutputStream bufferedOutputStream;
    private FileInfo fileInfo;
    private long length;
    @Nullable
    private LockFile lockFile;
    private long currentPosition = 0;
    private boolean active = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String getPlayedUrlFromUrl(Uri uri) {
        return uri.getQueryParameter("url");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String getMidFromUrl(Uri uri) {
        return uri.getQueryParameter(PARAM_MID);
    }

    public static String createUrlFile(String mid, String url) {
        Uri.Builder builder = Uri.parse("afile://audio").buildUpon();
        builder.appendQueryParameter(PARAM_MID, mid);
        if (!TextUtils.isEmpty(url)) {
            builder.appendQueryParameter("url", url);
        }
        return builder.toString();
    }

    public static String createUrlHttp(String mid, String url) {
        Uri.Builder builder = Uri.parse("ahttp://audio").buildUpon();
        builder.appendQueryParameter(PARAM_MID, mid);
        if (!TextUtils.isEmpty(url)) {
            builder.appendQueryParameter("url", url);
        }
        return builder.toString();
    }

    public synchronized void open(DataSpec dataSpec, long length) {
        String midStr = getMidFromUrl(dataSpec.uri);
        if (midStr == null || "null".equals(midStr)) {
            this.active = false;
        } else {
            this.active = true;
            this.length = length;
            this.currentPosition = dataSpec.position;
            File file = AudioFacade.getTrackTmpFile(midStr);
            this.lockFile = LockFile.lock(file);
            this.fileInfo = initializeCache(file, length);
            try {
                RandomAccessFile randomAccessFile = new RandomAccessFile(file, "rws");
                randomAccessFile.seek(this.currentPosition);
                this.bufferedOutputStream = new BufferedOutputStream(new OutputStreamRandomAccessFile(randomAccessFile), 131072);
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        }
    }

    public void read(byte[] buffer, int offset, int readLength) {
        if (this.active) {
            try {
                if (this.fileInfo != null) {
                    byte[] xoredBuff = Arrays.copyOfRange(buffer, offset, offset + readLength);
                    Utils.doXor(xoredBuff, readLength, this.currentPosition);
                    this.bufferedOutputStream.write(xoredBuff, 0, readLength);
                    this.fileInfo.addRange(this.currentPosition, (this.currentPosition + readLength) - 1);
                    if (this.currentPosition + readLength == this.length) {
                        this.bufferedOutputStream.flush();
                        this.fileInfo.save();
                    }
                }
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
            this.currentPosition += readLength;
        }
    }

    public synchronized void close() {
        if (this.active) {
            com.vkontakte.android.utils.Utils.closeSilently(this.bufferedOutputStream);
            this.bufferedOutputStream = null;
            try {
                if (this.fileInfo != null) {
                    this.fileInfo.save();
                }
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
            if (this.lockFile != null) {
                this.lockFile.unlock();
                this.lockFile = null;
            }
            this.active = false;
        }
    }

    @Nullable
    private static FileInfo initializeCache(File file, long contentLength) {
        file.getParentFile().mkdirs();
        if (file.exists()) {
            return loadFileInfo(file);
        }
        if (prepareFile(file, contentLength)) {
            try {
                FileInfo fileInfo = new FileInfo(file);
                fileInfo.setContentLength(contentLength);
                fileInfo.setContentType("");
                fileInfo.save();
                return fileInfo;
            } catch (Exception e) {
                Analytics.logException(e);
                L.e(e, new Object[0]);
            }
        }
        return null;
    }

    @Nullable
    private static FileInfo loadFileInfo(File file) {
        FileInfo fileInfo = new FileInfo(file);
        boolean fileExists = file.exists();
        if (fileExists) {
            try {
                fileInfo.load();
            } catch (IOException e) {
                file.delete();
                fileExists = false;
            }
        } else {
            fileInfo.delete();
            fileExists = false;
        }
        if (fileExists) {
            return fileInfo;
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v2 */
    private static boolean prepareFile(File file, long contentLength) {
        int i = 0;
        try {
            CacheUtils.clearOldCache(file.getParentFile());
            long freeSpace = file.getParentFile().getUsableSpace();
            if (freeSpace < Math.max(contentLength, (long) CacheUtils.MIN_FREE_SPACE)) {
                CacheUtils.clearCache(file.getParentFile());
                long freeSpace2 = file.getParentFile().getUsableSpace();
                if (freeSpace2 < Math.max(contentLength, (long) CacheUtils.MIN_FREE_SPACE)) {
                    return false;
                }
            }
            FileOutputStream out = new FileOutputStream(file);
            byte[] buff = new byte[131072];
            long elapsed = contentLength;
            while (elapsed > 0) {
                int count = (int) Math.min(elapsed, buff.length);
                out.write(buff, 0, count);
                elapsed -= count;
            }
            out.flush();
            Utils.closeCloseable(out);
            i = 1;
            return true;
        } catch (Exception e) {
            L.e(e, new Object[i]);
            Analytics.logException(e);
            return i;
        }
    }

    /* loaded from: classes2.dex */
    private static class OutputStreamRandomAccessFile extends OutputStream {
        final RandomAccessFile randomAccessFile;

        OutputStreamRandomAccessFile(RandomAccessFile randomAccessFile) {
            this.randomAccessFile = randomAccessFile;
        }

        @Override // java.io.OutputStream
        public void write(@NonNull byte[] b) throws IOException {
            this.randomAccessFile.write(b);
        }

        @Override // java.io.OutputStream
        public void write(@NonNull byte[] b, int off, int len) throws IOException {
            this.randomAccessFile.write(b, off, len);
        }

        @Override // java.io.OutputStream, java.io.Flushable
        public void flush() throws IOException {
            this.randomAccessFile.getFD().sync();
        }

        @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.randomAccessFile.getFD().sync();
            this.randomAccessFile.close();
        }

        @Override // java.io.OutputStream
        public void write(int b) throws IOException {
            this.randomAccessFile.write(b);
        }
    }
}
