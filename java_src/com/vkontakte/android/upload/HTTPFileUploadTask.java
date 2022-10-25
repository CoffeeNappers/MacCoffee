package com.vkontakte.android.upload;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.common.util.UriUtil;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.APIController;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLConnection;
import java.util.Locale;
import okhttp3.Call;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import okio.BufferedSink;
/* loaded from: classes3.dex */
public abstract class HTTPFileUploadTask<S extends Parcelable> extends UploadTask<S> implements Parcelable {
    protected Call currentRequest;
    protected String file;
    protected String server;

    protected abstract String getPostFieldName();

    protected abstract String statsGetMethodNameForUploadUrl();

    public HTTPFileUploadTask(Context context, String fileName) {
        super(context);
        this.file = fileName;
    }

    protected String preProcessFile() {
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:75:? A[RETURN, SYNTHETIC] */
    @Override // com.vkontakte.android.upload.UploadTask
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void doUpload() throws com.vkontakte.android.upload.UploadException {
        /*
            Method dump skipped, instructions count: 468
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.upload.HTTPFileUploadTask.doUpload():void");
    }

    protected void extractArgsForSaveFromUploadResponse(String response) throws UploadException {
    }

    protected void trackSuccessfulUpload(int totalTime, long byteSize) {
    }

    protected void trackErrorApiUpload(int totalTime) {
    }

    protected void trackFailureUpload() {
    }

    protected String getFileName(Uri uri) {
        return uri.getScheme().equals(UriUtil.LOCAL_CONTENT_SCHEME) ? UploadUtils.resolveName(uri) : uri.getLastPathSegment();
    }

    protected long getFileSize(Uri uri) {
        long j = -1;
        AssetFileDescriptor afd = null;
        try {
            try {
                AssetFileDescriptor afd2 = this.context.getContentResolver().openAssetFileDescriptor(uri, "r");
                if (afd2 != null) {
                    j = afd2.getLength();
                }
                if (afd2 != null) {
                    try {
                        afd2.close();
                    } catch (IOException e) {
                    }
                }
            } catch (FileNotFoundException ex) {
                Log.w("vk", ex);
                if (0 != 0) {
                    try {
                        afd.close();
                    } catch (IOException e2) {
                    }
                }
            }
            return j;
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    afd.close();
                } catch (IOException e3) {
                }
            }
            throw th;
        }
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void cancel() {
        super.cancel();
        if (this.currentRequest != null) {
            new Thread(new Runnable() { // from class: com.vkontakte.android.upload.HTTPFileUploadTask.1
                @Override // java.lang.Runnable
                public void run() {
                    if (HTTPFileUploadTask.this.currentRequest != null) {
                        HTTPFileUploadTask.this.currentRequest.cancel();
                        HTTPFileUploadTask.this.currentRequest = null;
                    }
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public class UploadEntity extends RequestBody {
        String field;
        String file;
        byte[] header;
        int offset = 0;
        final String fileHeaderTemplate = "\r\n--VK-FILE-UPLOAD-BOUNDARY\r\nContent-Disposition: form-data; name=\"%s\"; filename=\"%s\"\r\nContent-Type: %s\r\n\r\n";
        byte[] footer = "\r\n--VK-FILE-UPLOAD-BOUNDARY--\r\n".getBytes();

        public UploadEntity(String _file, String _field) {
            this.header = null;
            try {
                this.file = _file;
                this.field = _field;
                if (this.file.startsWith(CameraUtilsEffects.FILE_DELIM)) {
                    this.file = new Uri.Builder().scheme(UriUtil.LOCAL_FILE_SCHEME).path(this.file).build().toString();
                }
                this.header = String.format(Locale.US, "\r\n--VK-FILE-UPLOAD-BOUNDARY\r\nContent-Disposition: form-data; name=\"%s\"; filename=\"%s\"\r\nContent-Type: %s\r\n\r\n", this.field, HTTPFileUploadTask.this.getFileName(Uri.parse(this.file)), URLConnection.guessContentTypeFromName(this.file)).getBytes("UTF-8");
                if (APIController.API_DEBUG) {
                    Log.d("vk", "Will upload " + this.file);
                }
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }

        @Override // okhttp3.RequestBody
        public MediaType contentType() {
            return MediaType.parse("multipart/form-data; boundary=VK-FILE-UPLOAD-BOUNDARY");
        }

        @Override // okhttp3.RequestBody
        public void writeTo(BufferedSink bufferedSink) throws IOException {
            int nread;
            FileInputStream is = null;
            AssetFileDescriptor f = null;
            OutputStream os = bufferedSink.outputStream();
            try {
                try {
                    f = HTTPFileUploadTask.this.context.getContentResolver().openAssetFileDescriptor(Uri.parse(this.file), "r");
                    int total = (int) Math.ceil(f.getLength() / 1024.0d);
                    int loaded = 0;
                    long last = 0;
                    byte[] buffer = new byte[1024];
                    os.write(this.header);
                    is = f.createInputStream();
                    while (is.available() > 0 && (nread = is.read(buffer)) != -1) {
                        os.write(buffer, 0, nread);
                        os.flush();
                        if (System.currentTimeMillis() - last >= 150) {
                            int _loaded = loaded;
                            HTTPFileUploadTask.this.onProgress(_loaded, total, false);
                            last = System.currentTimeMillis();
                        }
                        this.offset += 1024;
                        loaded++;
                    }
                    HTTPFileUploadTask.this.onProgress(10, 10, true);
                    os.write(this.footer);
                    if (is != null) {
                        try {
                            is.close();
                        } catch (Exception e) {
                        }
                    }
                    if (f != null) {
                        f.close();
                    }
                } catch (Throwable th) {
                    if (is != null) {
                        try {
                            is.close();
                        } catch (Exception e2) {
                        }
                    }
                    if (f != null) {
                        f.close();
                    }
                    throw th;
                }
            } catch (IOException x) {
                Log.w("vk", x);
                throw x;
            } catch (Exception x2) {
                Log.w("vk", x2);
                if (is != null) {
                    try {
                        is.close();
                    } catch (Exception e3) {
                    }
                }
                if (f != null) {
                    f.close();
                }
            }
        }

        @Override // okhttp3.RequestBody
        public long contentLength() {
            try {
                AssetFileDescriptor f = HTTPFileUploadTask.this.context.getContentResolver().openAssetFileDescriptor(Uri.parse(this.file), "r");
                long l = this.header.length + this.footer.length + f.getLength();
                f.close();
                return l;
            } catch (Exception e) {
                return 0L;
            }
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
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public HTTPFileUploadTask(Parcel in) {
        super(in);
        this.file = in.readString();
        this.server = in.readString();
        this.id = in.readInt();
    }
}
