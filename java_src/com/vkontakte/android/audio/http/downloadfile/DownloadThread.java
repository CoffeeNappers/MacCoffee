package com.vkontakte.android.audio.http.downloadfile;

import android.content.Context;
import com.vkontakte.android.audio.http.HttpExecutor;
import com.vkontakte.android.audio.http.HttpResponseHandler;
import com.vkontakte.android.audio.http.ResponseException;
import com.vkontakte.android.audio.net.HashCodeUtils;
import com.vkontakte.android.audio.net.HttpUtils;
import com.vkontakte.android.audio.utils.Utils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;
import okhttp3.Request;
import okhttp3.Response;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class DownloadThread extends Thread {
    private static final Map<String, DownloadThread> THREADS = new HashMap();
    private long count;
    public Exception exception;
    public boolean finished;
    private final boolean mCheckLastModified;
    private final Context mContext;
    private final DownloadFileConverter mConverter;
    private final File mFile;
    private boolean notModified;
    private int progress;
    private int progressHashCode;
    public final Request request;
    private long totalCount;
    private int waitCount;

    private DownloadThread(Context context, String url, File file, boolean checkLastModified, DownloadFileConverter converter) {
        this.mContext = context == null ? null : context.getApplicationContext();
        this.request = new Request.Builder().url(url).get().build();
        this.mFile = file;
        this.mCheckLastModified = checkLastModified;
        this.mConverter = converter == null ? new DefaultDownloadFileConverter() : converter;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0036, code lost:
        if (r9 != r0.progressHashCode) goto L19;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static synchronized boolean execute(android.content.Context r12, java.lang.String r13, java.io.File r14, boolean r15, com.vkontakte.android.audio.http.downloadfile.DownloadFileListener r16, com.vkontakte.android.audio.http.downloadfile.DownloadFileConverter r17) throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 215
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.audio.http.downloadfile.DownloadThread.execute(android.content.Context, java.lang.String, java.io.File, boolean, com.vkontakte.android.audio.http.downloadfile.DownloadFileListener, com.vkontakte.android.audio.http.downloadfile.DownloadFileConverter):boolean");
    }

    public static boolean execute(Context context, String url, File file, DownloadFileListener listener, DownloadFileConverter converter) throws Exception {
        return execute(context, url, file, false, listener, converter);
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        try {
            if (isCancelled()) {
                return;
            }
            try {
            } catch (Exception e) {
                this.exception = e;
            }
            if (!this.mCheckLastModified && this.mFile.exists() && !this.mFile.delete()) {
                throw new RuntimeException("Can't delete file " + this.mFile.getAbsolutePath());
            }
            File tempFile = new File(this.mFile.getParentFile(), this.mFile.getName() + ".tmp");
            try {
                if (tempFile.exists() && !tempFile.delete()) {
                    throw new RuntimeException("Can't delete temp file " + tempFile.getAbsolutePath());
                }
                Result result = (Result) HttpExecutor.execute(this.mContext, this.request, new MyResponseHandler(tempFile));
                if (result == null) {
                    return;
                }
                if (result.notModified && this.mFile.exists()) {
                    this.notModified = true;
                } else if (this.mFile.exists() && !this.mFile.delete()) {
                    throw new RuntimeException("Can't delete file " + this.mFile.getAbsolutePath());
                } else {
                    if (!tempFile.renameTo(this.mFile)) {
                        throw new RuntimeException("Can't rename mFile " + tempFile.getAbsolutePath() + " to " + this.mFile.getAbsolutePath());
                    }
                }
                if (result.lastModified > 0) {
                    this.mFile.setLastModified(result.lastModified);
                }
            } finally {
                tempFile.delete();
            }
        } finally {
            notifyFinished();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean notifyProgress(long count, long totalCount) {
        boolean z = true;
        synchronized (DownloadThread.class) {
            if (isCancelled()) {
                z = false;
            } else if (totalCount > 0 && count <= totalCount) {
                this.count = count;
                this.totalCount = totalCount;
                this.progress = (int) ((100 * count) / totalCount);
                this.progressHashCode = HashCodeUtils.add(1, count);
                this.progressHashCode = HashCodeUtils.add(this.progressHashCode, totalCount);
                this.progressHashCode = HashCodeUtils.add(this.progressHashCode, this.progress);
                DownloadThread.class.notifyAll();
            }
        }
        return z;
    }

    private void notifyFinished() {
        synchronized (DownloadThread.class) {
            this.finished = true;
            DownloadThread.class.notifyAll();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isCancelled() {
        boolean z;
        synchronized (DownloadThread.class) {
            z = this.waitCount == 0;
        }
        return z;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Result {
        final long lastModified;
        final boolean notModified;

        private Result(boolean notModified, long lastModified) {
            this.notModified = notModified;
            this.lastModified = lastModified;
        }
    }

    /* loaded from: classes2.dex */
    private class MyResponseHandler implements HttpResponseHandler<Result> {
        private final File mTempFile;

        MyResponseHandler(File tempFile) {
            this.mTempFile = tempFile;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vkontakte.android.audio.http.HttpResponseHandler
        /* renamed from: handleResponse */
        public Result mo941handleResponse(Context context, Response response) throws Exception {
            Result result;
            int statusCode = response.code();
            if ((statusCode < 200 || statusCode >= 300) && (!DownloadThread.this.mCheckLastModified || statusCode != 304)) {
                throw new ResponseException("Invalid status code: " + statusCode, statusCode);
            }
            long lastModified = 0;
            String header = response.headers().get("Last-Modified");
            if (header != null) {
                try {
                    lastModified = HttpUtils.parseDate(header).getTime();
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
            if (statusCode != 304) {
                if (DownloadThread.this.isCancelled()) {
                    return null;
                }
                final long totalCount = response.body().contentLength();
                InputStream input = response.body().byteStream();
                try {
                    OutputStream output = new FileOutputStream(this.mTempFile);
                    DownloadFileConverterListener listener = new DownloadFileConverterListener() { // from class: com.vkontakte.android.audio.http.downloadfile.DownloadThread.MyResponseHandler.1
                        private long downloadedCount = 0;

                        @Override // com.vkontakte.android.audio.http.downloadfile.DownloadFileConverterListener
                        public void onRead(long count) {
                            this.downloadedCount += count;
                            DownloadThread.this.notifyProgress(this.downloadedCount, totalCount);
                        }

                        @Override // com.vkontakte.android.audio.http.downloadfile.DownloadFileConverterListener
                        public boolean isCancelled() {
                            return DownloadThread.this.isCancelled();
                        }
                    };
                    DownloadThread.this.mConverter.convert(input, output, listener);
                    if (DownloadThread.this.isCancelled()) {
                        result = null;
                        Utils.closeCloseable(output);
                    } else {
                        output.flush();
                        Utils.closeCloseable(output);
                        Utils.closeCloseable(input);
                        result = DownloadThread.this.isCancelled() ? null : new Result(false, lastModified);
                    }
                    return result;
                } finally {
                    Utils.closeCloseable(input);
                }
            }
            return new Result(true, lastModified);
        }
    }
}
