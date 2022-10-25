package com.my.target.core.async.commands;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.my.target.Tracer;
import com.my.target.nativeads.models.ImageData;
import com.my.target.nativeads.models.VideoData;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
/* compiled from: LoadMediaCommand.java */
/* loaded from: classes2.dex */
public final class f extends a<com.my.target.core.models.h> {
    @Override // com.my.target.core.async.commands.a, com.my.target.core.async.commands.b
    public final /* bridge */ /* synthetic */ String a() {
        return super.a();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public f(com.my.target.core.models.h hVar, Context context) {
        super(context);
        this.c = hVar;
    }

    @Override // com.my.target.core.async.commands.a
    protected final void c() {
        File b;
        HttpURLConnection httpURLConnection;
        HttpURLConnection a;
        HttpURLConnection httpURLConnection2 = null;
        if (this.c instanceof ImageData) {
            ImageData imageData = (ImageData) this.c;
            Bitmap data = imageData.getData();
            com.my.target.core.utils.e a2 = com.my.target.core.utils.e.a(this.b);
            if (data == null) {
                if (a2 != null) {
                    data = a2.a(imageData.getUrl());
                    if (data != null) {
                        imageData.setData(data);
                        return;
                    }
                } else {
                    Tracer.d("Unable to open disk cache and save image " + imageData.getUrl());
                }
                try {
                    Tracer.d("send image request: " + imageData.getUrl());
                    a = a(imageData.getUrl());
                } catch (Throwable th) {
                    th = th;
                    httpURLConnection = null;
                }
                try {
                    a.setReadTimeout(10000);
                    a.setConnectTimeout(10000);
                    a.setInstanceFollowRedirects(true);
                    a.setRequestProperty("connection", "close");
                    a.connect();
                    if (a.getResponseCode() == 200) {
                        InputStream inputStream = a.getInputStream();
                        if (a2 != null) {
                            File a3 = a2.a(inputStream, imageData.getUrl());
                            if (a3 != null) {
                                data = BitmapFactory.decodeFile(a3.getAbsolutePath());
                            }
                        } else {
                            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream, 8192);
                            data = BitmapFactory.decodeStream(bufferedInputStream);
                            try {
                                bufferedInputStream.close();
                            } catch (IOException e) {
                                Tracer.d(e.getMessage());
                            }
                        }
                        if (data != null) {
                            imageData.setData(data);
                            if (imageData.getHeight() == 0) {
                                imageData.setHeight(data.getHeight());
                            }
                            if (imageData.getWidth() == 0) {
                                imageData.setWidth(data.getWidth());
                            }
                        }
                    }
                    a.disconnect();
                    return;
                } catch (Throwable th2) {
                    th = th2;
                    httpURLConnection = a;
                    Tracer.d("Error: " + th.getMessage());
                    if (httpURLConnection != null) {
                        httpURLConnection.disconnect();
                        return;
                    }
                    return;
                }
            }
            Tracer.d("Getting image from memory cache " + imageData.getUrl());
        } else if (this.c instanceof VideoData) {
            VideoData videoData = (VideoData) this.c;
            com.my.target.core.utils.e a4 = com.my.target.core.utils.e.a(this.b);
            if (a4 == null) {
                Tracer.d("Unable to open disk cache and save video " + videoData.getUrl());
                return;
            }
            String a5 = a4.a(videoData.getUrl(), ".mp4");
            if (a5 != null) {
                videoData.setData(a5);
                Tracer.d("Getting video from cache " + videoData.getUrl());
                return;
            }
            try {
                Tracer.d("send video request: " + videoData.getUrl());
                httpURLConnection2 = a(videoData.getUrl());
                httpURLConnection2.setReadTimeout(10000);
                httpURLConnection2.setConnectTimeout(10000);
                httpURLConnection2.setInstanceFollowRedirects(true);
                httpURLConnection2.setRequestProperty("connection", "close");
                httpURLConnection2.connect();
                if (httpURLConnection2.getResponseCode() == 200 && (b = a4.b(httpURLConnection2.getInputStream(), videoData.getUrl())) != null) {
                    videoData.setData(b.getAbsolutePath());
                }
                httpURLConnection2.disconnect();
            } catch (Throwable th3) {
                Tracer.d("Error: " + th3.getMessage());
                if (httpURLConnection2 != null) {
                    httpURLConnection2.disconnect();
                }
            }
        }
    }

    private static HttpURLConnection a(String str) throws Exception {
        return (HttpURLConnection) new URL(str).openConnection();
    }
}
