package com.vkontakte.android;

import com.vk.core.util.FileUtils;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;
import java.util.Locale;
/* loaded from: classes.dex */
public class Log {
    private static final String LOG_DIR = "Logs";
    private static final String LOG_FILENAME = "VK.log";
    public static File logFile;
    private static FileOutputStream os;

    public static void v(String tag, String msg) {
        android.util.Log.d(tag, msg);
        lf("V", tag, msg);
    }

    public static void d(String tag, String msg) {
        android.util.Log.d(tag, msg);
        lf("D", tag, msg);
    }

    public static void i(String tag, String msg) {
        android.util.Log.i(tag, msg);
        lf("I", tag, msg);
    }

    public static void w(String tag, String msg) {
        android.util.Log.w(tag, msg);
        lf("W", tag, msg);
    }

    public static void w(String tag, String msg, Throwable x) {
        android.util.Log.w(tag, msg, x);
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        x.printStackTrace(pw);
        lf("W", tag, (msg + "\n" + x.getClass() + ": " + x.getMessage() + "\n") + sw.toString());
    }

    public static void w(String tag, Throwable x) {
        android.util.Log.w(tag, x);
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        x.printStackTrace(pw);
        String msg = "" + x.getClass() + ": " + x.getMessage() + "\n";
        lf("W", tag, msg + sw.toString());
    }

    public static void e(String tag, String msg) {
        android.util.Log.e(tag, msg);
        lf("E", tag, msg);
    }

    public static void e(String tag, String msg, Throwable x) {
        android.util.Log.e(tag, msg, x);
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        x.printStackTrace(pw);
        lf("E", tag, (msg + "\n" + x.getClass() + ": " + x.getMessage() + "\n") + sw.toString());
    }

    public static void captureStart() {
        FileUtils.checkFolder(new File(getLogDir()));
        logFile = new File(getLogPath());
        L.getInstance().captureStart();
    }

    public static String getLogPath() {
        return getLogDir() + File.separator + LOG_FILENAME;
    }

    public static String getLogDir() {
        return FileUtils.getVKDir().getAbsolutePath() + File.separator + LOG_DIR;
    }

    private static void lf(String lvl, String tag, String msg) {
        if (logFile != null) {
            try {
                if (os == null) {
                    logFile.createNewFile();
                    os = new FileOutputStream(logFile);
                }
                long t = System.currentTimeMillis();
                Date d = new Date(t);
                String[] lines = msg.split("\n");
                for (String line : lines) {
                    String l = String.format(Locale.US, "%d:%02d:%02d.%03d\t%s\t%s\t%s\n", Integer.valueOf(d.getHours()), Integer.valueOf(d.getMinutes()), Integer.valueOf(d.getSeconds()), Long.valueOf(t % 1000), lvl, tag, line);
                    os.write(l.getBytes("UTF-8"));
                    os.flush();
                }
            } catch (Exception e) {
            }
        }
    }
}
