package com.vkontakte.android;

import android.os.Environment;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.lang.Thread;
/* loaded from: classes2.dex */
public class EpicFailHandler implements Thread.UncaughtExceptionHandler {
    Thread.UncaughtExceptionHandler defHandler = Thread.getDefaultUncaughtExceptionHandler();

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable throwable) {
        try {
            String filename = "VK_fail_" + System.currentTimeMillis() + ".txt";
            File sdDir = Environment.getExternalStorageDirectory();
            File f = new File(sdDir, filename);
            Writer result = new StringWriter();
            PrintWriter printWriter = new PrintWriter(result);
            throwable.printStackTrace(printWriter);
            String stacktrace = result.toString();
            printWriter.close();
            f.createNewFile();
            FileOutputStream os = new FileOutputStream(f);
            os.write(stacktrace.getBytes("UTF-8"));
            os.flush();
            os.close();
        } catch (Exception x) {
            Log.w("vk", x);
        } finally {
            this.defHandler.uncaughtException(thread, throwable);
        }
    }
}
