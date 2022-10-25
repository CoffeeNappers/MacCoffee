package com.my.target.core.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.my.target.Tracer;
import com.vkontakte.android.TimeUtils;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Comparator;
/* compiled from: DiskMediaCache.java */
/* loaded from: classes2.dex */
public final class e {
    private static e a;
    private static final FilenameFilter b = new FilenameFilter() { // from class: com.my.target.core.utils.e.1
        @Override // java.io.FilenameFilter
        public final boolean accept(File file, String str) {
            return str.startsWith("mytrg_");
        }
    };
    private static final FilenameFilter c = new FilenameFilter() { // from class: com.my.target.core.utils.e.2
        @Override // java.io.FilenameFilter
        public final boolean accept(File file, String str) {
            return str.endsWith(".mp4");
        }
    };
    private File d;

    public static e a(Context context) {
        if (a != null) {
            return a;
        }
        File cacheDir = context.getCacheDir();
        if (cacheDir != null && !cacheDir.exists()) {
            cacheDir.mkdir();
        }
        File file = new File(cacheDir, "mytargetcache");
        if (!file.exists()) {
            file.mkdir();
        }
        if (file.isDirectory() && file.canWrite()) {
            e eVar = new e(file);
            a = eVar;
            return eVar;
        }
        return null;
    }

    private e(File file) {
        this.d = file;
    }

    private synchronized void a() {
        File[] listFiles;
        long currentTimeMillis = System.currentTimeMillis();
        try {
            if (this.d.lastModified() + TimeUtils.WEEK < currentTimeMillis) {
                for (File file : this.d.listFiles(b)) {
                    if (file.isFile() && file.lastModified() + TimeUtils.WEEK < currentTimeMillis) {
                        Tracer.d("remove expired file: " + file.getPath());
                        file.delete();
                    }
                }
                this.d.setLastModified(currentTimeMillis);
            }
            File[] listFiles2 = this.d.listFiles(c);
            if (listFiles2.length > 10) {
                Arrays.sort(listFiles2, new Comparator<File>() { // from class: com.my.target.core.utils.e.3
                    @Override // java.util.Comparator
                    public final /* synthetic */ int compare(File file2, File file3) {
                        return Long.valueOf(file3.lastModified()).compareTo(Long.valueOf(file2.lastModified()));
                    }
                });
                for (int length = listFiles2.length - 1; length >= 10; length--) {
                    Tracer.d("remove rendurant video: " + listFiles2[length].getPath());
                    listFiles2[length].delete();
                }
            }
        } catch (Exception e) {
            Tracer.i("DiskMediaCache exception: " + e);
        }
    }

    public final synchronized File a(InputStream inputStream, String str) {
        File b2;
        a();
        b2 = b(str, ".img");
        Tracer.d("Save image to disk cache: " + b2.getPath());
        try {
            a(inputStream, new FileOutputStream(b2));
        } catch (Exception e) {
            Tracer.i("DiskMediaCache exception: " + e);
            b2 = null;
        }
        return b2;
    }

    public final synchronized File b(InputStream inputStream, String str) {
        File b2;
        a();
        b2 = b(str, ".mp4");
        Tracer.d("Save video to disk cache: " + b2.getPath());
        try {
            a(inputStream, new FileOutputStream(b2));
        } catch (Exception e) {
            Tracer.i("DiskMediaCache exception: " + e);
            b2 = null;
        }
        return b2;
    }

    public final synchronized String a(String str, String str2) {
        String str3;
        a();
        File b2 = b(str, str2);
        if (b2.exists()) {
            Tracer.d("Get media from disk cache: " + b2.getPath());
            try {
                str3 = b2.getAbsolutePath();
            } catch (Exception e) {
                Tracer.i("DiskMediaCache exception: " + e);
            }
        }
        str3 = null;
        return str3;
    }

    public final synchronized Bitmap a(String str) {
        Bitmap bitmap;
        a();
        File b2 = b(str, ".img");
        if (b2.exists()) {
            Tracer.d("Get image from disk cache: " + b2.getPath());
            try {
                try {
                    bitmap = BitmapFactory.decodeFile(b2.getAbsolutePath());
                } catch (Exception e) {
                    Tracer.i("DiskMediaCache exception: " + e);
                }
            } catch (OutOfMemoryError e2) {
                System.gc();
                Tracer.i("DiskMediaCache OOME, trying once again");
                try {
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    options.inSampleSize = 2;
                    bitmap = BitmapFactory.decodeFile(b2.getAbsolutePath(), options);
                } catch (OutOfMemoryError e3) {
                    Tracer.i("DiskMediaCache OOME, called twice: " + e2);
                }
            }
        }
        bitmap = null;
        return bitmap;
    }

    private static int a(InputStream inputStream, OutputStream outputStream) throws Exception {
        int i = 0;
        byte[] bArr = new byte[8192];
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream, 8192);
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream, 8192);
        while (true) {
            try {
                int read = bufferedInputStream.read(bArr, 0, 8192);
                if (read == -1) {
                    break;
                }
                bufferedOutputStream.write(bArr, 0, read);
                i += read;
            } finally {
                try {
                    bufferedOutputStream.close();
                } catch (IOException e) {
                    Tracer.d(e.getMessage());
                }
                try {
                    bufferedInputStream.close();
                } catch (IOException e2) {
                    Tracer.d(e2.getMessage());
                }
            }
        }
        bufferedOutputStream.flush();
        return i;
    }

    private File b(String str, String str2) {
        return new File(this.d.getAbsolutePath() + File.separator + ("mytrg_" + f.a(str) + str2));
    }
}
