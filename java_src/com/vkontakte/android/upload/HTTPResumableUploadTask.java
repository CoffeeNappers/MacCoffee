package com.vkontakte.android.upload;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import com.facebook.common.util.UriUtil;
import com.vk.core.network.Network;
import com.vk.core.network.NetworkUserAgent;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import okhttp3.Call;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import okio.BufferedSink;
/* loaded from: classes3.dex */
public abstract class HTTPResumableUploadTask<S extends Parcelable> extends UploadTask<S> implements Parcelable {
    private static final int DEFAULT_BUFFER_SIZE = 16384;
    private static final int DEFAULT_CHUNK_SIZE = 1048576;
    private static final int HTTP_RESPONSE_CODE_OK = 200;
    private static final String INTERVAL_PATTERN = "\\d*-\\d*\\/(\\d*|\\*)(,\\d*-\\d*\\/(\\d*|\\*))*$";
    private static final boolean LOG_ENABLED = true;
    private static final int MAX_ATTEMPTS = 5;
    private static final String PREFERENCE_ATTEMPT = ".attempt";
    private static final String PREFERENCE_KEY = "http.resumable.upload.task.";
    private static final String PREFERENCE_PRE_PROCESS_FILE = ".preprocess";
    private static final String PREFERENCE_RANGE = ".range";
    private static final String PREFERENCE_SESSION = ".session";
    private static final int PROGRESS_UPDATE_DELAY = 150;
    private static final String TAG = "HTTPResumableUploadTask";
    private int attempt;
    private Call currentRequest;
    protected final String file;
    private boolean fileWriteFinished;
    private String preProcessFilePath;
    private final SharedPreferences preferences;
    private String ranges;
    protected String server;
    private String sessionID;
    private final Object waitLock;
    private long writtenFileBytesCount;

    protected abstract long skipNFirstBytesUntilFileIsReady();

    protected abstract String statsGetMethodNameForUploadUrl();

    public HTTPResumableUploadTask(Context context, String fileName) {
        super(context);
        this.waitLock = new Object();
        this.fileWriteFinished = true;
        this.file = fileName;
        this.preferences = PreferenceManager.getDefaultSharedPreferences(context);
        init();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public HTTPResumableUploadTask(Parcel in) {
        super(in);
        boolean z = true;
        this.waitLock = new Object();
        this.fileWriteFinished = true;
        this.file = in.readString();
        this.server = in.readString();
        this.id = in.readInt();
        setFileWriteFinished(in.readInt() != 1 ? false : z);
        this.preferences = PreferenceManager.getDefaultSharedPreferences(this.context);
        init();
        if (!isFileWriteFinished()) {
            setWrittenFileBytesCount(0L);
            dropState();
            cleanPreferences();
        }
    }

    private void init() {
        this.sessionID = this.preferences.getString(getPreferenceFullKey(this.id, PREFERENCE_SESSION), UUID.randomUUID().toString());
        this.preProcessFilePath = this.preferences.getString(getPreferenceFullKey(this.id, PREFERENCE_PRE_PROCESS_FILE), null);
        this.ranges = this.preferences.getString(getPreferenceFullKey(this.id, PREFERENCE_RANGE), null);
        this.attempt = this.preferences.getInt(getPreferenceFullKey(this.id, PREFERENCE_ATTEMPT), 0);
    }

    protected synchronized boolean isFileWriteFinished() {
        return this.fileWriteFinished;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public synchronized void setFileWriteFinished(boolean fileWriteFinished) {
        this.fileWriteFinished = fileWriteFinished;
    }

    protected synchronized long getWrittenFileBytesCount() {
        return this.writtenFileBytesCount;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public synchronized void setWrittenFileBytesCount(long writtenFileBytesCount) {
        this.writtenFileBytesCount = writtenFileBytesCount;
        notifyNewBytesWritten();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void waitNewBytesWritten(long fileLength) throws Exception {
        long actualWrittenFileLength = getWrittenFileBytesCount();
        if (actualWrittenFileLength == fileLength) {
            synchronized (this.waitLock) {
                this.waitLock.wait(3000L);
            }
        }
    }

    protected void notifyNewBytesWritten() {
        synchronized (this.waitLock) {
            this.waitLock.notifyAll();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String preProcessFile() {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getPreProcessFilePath() {
        return this.preProcessFilePath;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setPreProcessFilePath(String path) {
        this.preProcessFilePath = path;
        saveToPreferences();
    }

    /* JADX WARN: Code restructure failed: missing block: B:102:0x03f8, code lost:
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0353, code lost:
        if (r30.attempt < 5) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x035d, code lost:
        throw new com.vkontakte.android.upload.UploadException("can't upload: max attempts reached");
     */
    @Override // com.vkontakte.android.upload.UploadTask
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void doUpload() throws com.vkontakte.android.upload.UploadException {
        /*
            Method dump skipped, instructions count: 1017
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.upload.HTTPResumableUploadTask.doUpload():void");
    }

    protected void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
    }

    private String getFileName(Uri uri) {
        String name;
        if (UriUtil.LOCAL_CONTENT_SCHEME.equals(uri.getScheme())) {
            name = UploadUtils.resolveName(uri);
        } else {
            name = uri.getLastPathSegment();
        }
        if (!TextUtils.isEmpty(name)) {
            Network.getInstance().getUserAgent();
            return NetworkUserAgent.toHumanReadableAscii(name);
        }
        return "video.mp4";
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        super.afterUpload();
        cleanPreferences();
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void cancel() {
        super.cancel();
        if (this.currentRequest != null) {
            new Thread(new Runnable() { // from class: com.vkontakte.android.upload.HTTPResumableUploadTask.1
                @Override // java.lang.Runnable
                public void run() {
                    if (HTTPResumableUploadTask.this.currentRequest != null) {
                        HTTPResumableUploadTask.this.currentRequest.cancel();
                        HTTPResumableUploadTask.this.currentRequest = null;
                        HTTPResumableUploadTask.this.cleanPreferences();
                    }
                }
            }).start();
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this.file);
        dest.writeString(this.server);
        dest.writeInt(this.id);
        dest.writeInt(isFileWriteFinished() ? 1 : 0);
    }

    private void saveToPreferences() {
        this.preferences.edit().putString(getPreferenceFullKey(this.id, PREFERENCE_PRE_PROCESS_FILE), this.preProcessFilePath).putString(getPreferenceFullKey(this.id, PREFERENCE_SESSION), this.sessionID).putString(getPreferenceFullKey(this.id, PREFERENCE_RANGE), this.ranges).putInt(getPreferenceFullKey(this.id, PREFERENCE_ATTEMPT), this.attempt).apply();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cleanPreferences() {
        this.preferences.edit().remove(getPreferenceFullKey(this.id, PREFERENCE_PRE_PROCESS_FILE)).remove(getPreferenceFullKey(this.id, PREFERENCE_SESSION)).remove(getPreferenceFullKey(this.id, PREFERENCE_RANGE)).remove(getPreferenceFullKey(this.id, PREFERENCE_ATTEMPT)).apply();
    }

    private static String getPreferenceFullKey(int taskId, String key) {
        return PREFERENCE_KEY + taskId + key;
    }

    private static long getUploadedLength(List<Range> ranges) {
        long upload = 0;
        for (Range range : ranges) {
            upload += range.length;
        }
        return upload;
    }

    private static List<Range> getUploadedRanges(String intervals, long fileLength, boolean fileLengthFinal) {
        if (intervals == null || !intervals.matches(INTERVAL_PATTERN)) {
            return Collections.emptyList();
        }
        List<Range> uploadedRanges = new ArrayList<>();
        String[] split = intervals.split(",");
        int length = split.length;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < length) {
                String interval = split[i2];
                int dash = interval.indexOf("-");
                int slash = interval.indexOf(CameraUtilsEffects.FILE_DELIM);
                String start = interval.substring(0, dash);
                int i3 = dash + 1;
                if (slash <= 0) {
                    slash = interval.length();
                }
                String end = interval.substring(i3, slash);
                uploadedRanges.add(new Range(Long.parseLong(start), Long.parseLong(end), fileLength, fileLengthFinal));
                i = i2 + 1;
            } else {
                return Range.merge(uploadedRanges, fileLengthFinal);
            }
        }
    }

    private static Range getNextRange(List<Range> ranges, long fileLength, boolean fileLengthFinal, long skipNFirstBytesUntilFileIsReady) throws UploadException {
        if (ranges.isEmpty()) {
            if (fileLengthFinal) {
                return getRange(0L, fileLength, fileLengthFinal);
            }
            return getRange(skipNFirstBytesUntilFileIsReady, fileLength, fileLengthFinal);
        } else if (ranges.size() == 1) {
            Range first = ranges.get(0);
            if (first.end == fileLength - 1) {
                return new Range(Math.max(first.start - 1048576, 0L), first.start - 1, fileLength, fileLengthFinal);
            }
            return getRange(first.end, fileLength, fileLengthFinal);
        } else {
            Range first2 = ranges.get(0);
            Range second = ranges.get(1);
            if (second.start - first2.end <= 1048576) {
                return new Range(first2.end + 1, second.start - 1, fileLength, fileLengthFinal);
            }
            return getRange(first2.end, fileLength, fileLengthFinal);
        }
    }

    private static Range getRange(long offset, long fileLength, boolean fileLengthFinal) {
        long chunk = Math.min(fileLength - offset, 1048576L);
        long end = (offset + chunk) - 1;
        return new Range(offset, end, fileLength, fileLengthFinal);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class UploadEntity extends RequestBody {
        private String file;
        private Range range;
        private long uploadedLength;

        public UploadEntity(String file) {
            this.file = file;
            if (this.file.startsWith(CameraUtilsEffects.FILE_DELIM)) {
                this.file = new Uri.Builder().scheme(UriUtil.LOCAL_FILE_SCHEME).path(file).build().toString();
            }
        }

        public void setUploadedLength(long uploadedLength) {
            this.uploadedLength = uploadedLength;
        }

        public void setRange(Range range) {
            this.range = range;
        }

        @Override // okhttp3.RequestBody
        public MediaType contentType() {
            return MediaType.parse("application/octet-stream");
        }

        @Override // okhttp3.RequestBody
        public void writeTo(BufferedSink bufferedSink) throws IOException {
            FileInputStream input = null;
            AssetFileDescriptor descriptor = null;
            OutputStream output = bufferedSink.outputStream();
            try {
                try {
                    descriptor = HTTPResumableUploadTask.this.context.getContentResolver().openAssetFileDescriptor(Uri.parse(this.file), "r");
                    input = descriptor.createInputStream();
                    UploadTask progressCallback = HTTPResumableUploadTask.this;
                    this.range.copy(input, output, this.uploadedLength, progressCallback);
                } finally {
                    if (input != null) {
                        try {
                            input.close();
                        } catch (Exception e) {
                            Log.w("vk", e);
                        }
                    }
                    if (descriptor != null) {
                        descriptor.close();
                    }
                }
            } catch (IOException e2) {
                Log.w("vk", e2);
                throw e2;
            }
        }

        @Override // okhttp3.RequestBody
        public long contentLength() {
            return this.range.length;
        }

        public long getFileLength() {
            try {
                AssetFileDescriptor f = HTTPResumableUploadTask.this.context.getContentResolver().openAssetFileDescriptor(Uri.parse(this.file), "r");
                long fileLength = f.getLength();
                f.close();
                if (fileLength == 0) {
                    return new File(this.file).length();
                }
                return fileLength;
            } catch (Exception e) {
                return 0L;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class Range implements Comparable<Range> {
        private long currentTotal;
        private long end;
        private boolean fileLengthFinal;
        private long lastUpdate;
        private long length;
        private long start;

        public Range(long start, long end, long currentTotal, boolean fileLengthFinal) {
            this.start = start;
            this.end = end;
            this.length = (end - start) + 1;
            this.currentTotal = currentTotal;
            this.fileLengthFinal = fileLengthFinal;
        }

        public void copy(InputStream input, OutputStream output, long totalUploaded, UploadTask task) throws IOException {
            byte[] buffer = new byte[16384];
            long sent = 0;
            if (this.currentTotal != this.length || !this.fileLengthFinal) {
                input.skip(this.start);
                long toRead = this.length;
                while (true) {
                    int read = input.read(buffer);
                    if (read > 0) {
                        toRead -= read;
                        if (toRead > 0) {
                            output.write(buffer, 0, read);
                            output.flush();
                            sent += read;
                            updateProgress(task, sent, totalUploaded);
                        } else {
                            output.write(buffer, 0, ((int) toRead) + read);
                            output.flush();
                            return;
                        }
                    } else {
                        return;
                    }
                }
            } else {
                while (true) {
                    int read2 = input.read(buffer);
                    if (read2 > 0) {
                        output.write(buffer, 0, read2);
                        output.flush();
                        sent += read2;
                        updateProgress(task, sent, totalUploaded);
                    } else {
                        return;
                    }
                }
            }
        }

        private void updateProgress(UploadTask task, long sent, long totalUploaded) {
            if (System.currentTimeMillis() - this.lastUpdate >= 150) {
                int percentage = (int) ((((float) (totalUploaded + sent)) / ((float) this.currentTotal)) * 100.0f);
                task.onProgress(percentage, 100, false);
                this.lastUpdate = System.currentTimeMillis();
            }
        }

        @Override // java.lang.Comparable
        public int compareTo(@NonNull Range another) {
            return (int) (this.start - another.start);
        }

        public String toString() {
            return "Range{start=" + this.start + ", end=" + this.end + ", length=" + this.length + ", currentTotal=" + this.currentTotal + ", lastUpdate=" + this.lastUpdate + '}';
        }

        public static List<Range> merge(List<Range> intervals, boolean fileLengthFinal) {
            if (intervals.size() >= 2) {
                Collections.sort(intervals);
                Range first = intervals.get(0);
                long total = first.currentTotal;
                long start = first.start;
                long end = first.end;
                List<Range> result = new ArrayList<>();
                for (int i = 1; i < intervals.size(); i++) {
                    Range current = intervals.get(i);
                    if (current.start <= end) {
                        end = Math.max(current.end, end);
                    } else {
                        result.add(new Range(start, end, total, fileLengthFinal));
                        start = current.start;
                        end = current.end;
                    }
                }
                result.add(new Range(start, end, total, fileLengthFinal));
                return result;
            }
            return intervals;
        }
    }
}
