package com.vkontakte.android.audio.utils;

import android.app.AlarmManager;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.PowerManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.android.gms.gcm.Task;
import com.vkontakte.android.BuildConfig;
import com.vkontakte.android.LinkRedirActivity;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import com.vkontakte.android.functions.VoidF2;
import com.vkontakte.android.utils.L;
import io.reactivex.annotations.SchedulerSupport;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.security.InvalidParameterException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class Utils {
    private static final String DIR_ANDROID = "Android";
    private static final String DIR_DATA = "data";
    private static final String DIR_FILES = "files";

    public static int getMaxCoverSize() {
        int width = VKApplication.context.getResources().getDisplayMetrics().widthPixels;
        int height = VKApplication.context.getResources().getDisplayMetrics().heightPixels;
        return Math.min(width, height);
    }

    @Nullable
    public static Bitmap prepareBitmapForCover(@Nullable Bitmap bmp) {
        if (bmp == null) {
            return null;
        }
        int maxImageSize = getMaxCoverSize();
        if (bmp.getHeight() > maxImageSize || bmp.getWidth() > maxImageSize) {
            return Bitmap.createScaledBitmap(bmp, Math.min(maxImageSize, bmp.getWidth()), Math.min(maxImageSize, bmp.getHeight()), true);
        }
        return bmp;
    }

    public static NotificationManager getNotificationManager(Context context) {
        return (NotificationManager) context.getSystemService("notification");
    }

    public static AudioManager getAudioManager(Context context) {
        return (AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO);
    }

    public static TelephonyManager getTelephonyManager(Context context) {
        return (TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE);
    }

    public static ConnectivityManager getConnectivityManager(Context context) {
        return (ConnectivityManager) context.getSystemService("connectivity");
    }

    public static AlarmManager getAlarmManager(Context context) {
        return (AlarmManager) context.getSystemService("alarm");
    }

    public static PowerManager getPowerManager(Context context) {
        return (PowerManager) context.getSystemService("power");
    }

    public static boolean isNetworkAvailable(Context context) {
        NetworkInfo netInfo = getConnectivityManager(context).getActiveNetworkInfo();
        return netInfo != null && netInfo.isConnected();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <V> V checkedCast(Object value) {
        return value;
    }

    public static String formatExtra(Class<?> cls, String name) {
        return createExtra(BuildConfig.APPLICATION_ID, cls.getSimpleName(), name);
    }

    public static String formatAction(Class<?> cls, String name) {
        return createAction(BuildConfig.APPLICATION_ID, cls.getSimpleName(), name);
    }

    public static String createExtra(String packageName, String group, String name) {
        return packageName + "." + group + ".extra." + name;
    }

    public static String createAction(String packageName, String group, String name) {
        return packageName + "." + group + ".action." + name;
    }

    public static void closeCloseable(Closeable closeable) {
        try {
            closeable.close();
        } catch (IOException e) {
        } catch (IncompatibleClassChangeError e2) {
            try {
                closeable.getClass().getMethod("close", new Class[0]).invoke(closeable, new Object[0]);
            } catch (IllegalAccessException e3) {
                e2 = e3;
                throw new RuntimeException(e2);
            } catch (IllegalArgumentException e4) {
                e2 = e4;
                throw new RuntimeException(e2);
            } catch (NoSuchMethodException e5) {
                e2 = e5;
                throw new RuntimeException(e2);
            } catch (InvocationTargetException e6) {
            }
        }
    }

    public static String objectToString(Object object, Object... parameters) {
        if (parameters.length % 2 != 0) {
            throw new InvalidParameterException("Number of parameters must be even");
        }
        StringBuilder builder = new StringBuilder(object.getClass().getName());
        builder.append("[");
        for (int i = 0; i < parameters.length; i += 2) {
            builder.append(parameters[i]);
            builder.append('=');
            builder.append(parameters[i + 1]);
            if (i < parameters.length - 2) {
                builder.append(", ");
            }
        }
        builder.append("]");
        return builder.toString();
    }

    public static String[] concatStringArrays(String[]... arrays) {
        return (String[]) concatArrays_(new String[getArraysLength(arrays)], arrays);
    }

    private static int getArraysLength(Object[]... arrays) {
        int len = 0;
        for (Object[] array : arrays) {
            if (array != null) {
                len += array.length;
            }
        }
        return len;
    }

    private static Object concatArrays_(Object dst, Object[] arrays) {
        int i = 0;
        for (Object src : arrays) {
            if (src != null) {
                int length = Array.getLength(src);
                System.arraycopy(src, 0, dst, i, length);
                i += length;
            }
        }
        return dst;
    }

    public static int compareIntegers(int lhs, int rhs) {
        if (lhs < rhs) {
            return -1;
        }
        return lhs == rhs ? 0 : 1;
    }

    public static Rect calcDimensions(Rect areaRect, int pictureWidth, int pictureHeight, boolean clip, Rect outRect) {
        float w1 = areaRect.width();
        float h1 = areaRect.height();
        boolean isNarrow = ((float) pictureWidth) / ((float) pictureHeight) > w1 / h1;
        if ((isNarrow && clip) || (!isNarrow && !clip)) {
            outRect.top = areaRect.top;
            outRect.bottom = areaRect.bottom;
            float w = (h1 / pictureHeight) * pictureWidth;
            outRect.left = (int) (((areaRect.left + areaRect.right) - w) / 2.0f);
            outRect.right = (int) (outRect.left + w);
        } else {
            outRect.left = areaRect.left;
            outRect.right = areaRect.right;
            float h = (w1 / pictureWidth) * pictureHeight;
            outRect.top = (int) (((areaRect.top + areaRect.bottom) - h) / 2.0f);
            outRect.bottom = (int) (outRect.top + h);
        }
        return outRect;
    }

    public static Drawable getDrawable(Context context, int resId) {
        return Build.VERSION.SDK_INT >= 21 ? context.getDrawable(resId) : context.getResources().getDrawable(resId);
    }

    public static String stringToFileName(String str) {
        if (str == null) {
            return null;
        }
        try {
            return byteArrayToHex(encryptSHA(str));
        } catch (NoSuchAlgorithmException e) {
            return Integer.toString(str.hashCode());
        }
    }

    public static String byteArrayToHex(byte[] data) {
        char[] chars = new char[data.length * 2];
        for (int i = 0; i < data.length; i++) {
            int b = data[i];
            int b1 = (b >>> 4) & 15;
            int b2 = b & 15;
            chars[i * 2] = (char) (b1 < 10 ? b1 + 48 : (b1 - 10) + 97);
            chars[(i * 2) + 1] = (char) (b2 < 10 ? b2 + 48 : (b2 - 10) + 97);
        }
        return new String(chars);
    }

    public static byte[] encryptSHA(String data) throws NoSuchAlgorithmException {
        return MessageDigest.getInstance("SHA").digest(data.getBytes());
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x002a -> B:5:0x000f). Please submit an issue!!! */
    public static boolean isSdCardPath(@NonNull String path) {
        try {
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        if (Build.VERSION.SDK_INT >= 21) {
            return Environment.isExternalStorageRemovable(new File(path));
        }
        if (path.startsWith(Environment.getExternalStorageDirectory().getAbsolutePath())) {
            return Environment.isExternalStorageRemovable();
        }
        return path.toUpperCase().contains("SD");
    }

    public static boolean isSdCardPath(File file) {
        return isSdCardPath(file.getAbsolutePath());
    }

    public static boolean equalsStringsIgnoreCase(String str1, String str2) {
        return str1 == null ? str2 == null : str1.equalsIgnoreCase(str2);
    }

    public static void moveItemInList(List<?> list, int indexFrom, int indexTo) {
        if (indexTo > indexFrom) {
            for (int index = indexFrom; index < indexTo; index++) {
                Collections.swap(list, index, index + 1);
            }
        } else if (indexTo < indexFrom) {
            for (int index2 = indexFrom; index2 > indexTo; index2--) {
                Collections.swap(list, index2, index2 - 1);
            }
        }
    }

    public static void doXor(byte[] buff, int len, long pos) {
        doXor(buff, 0, len, pos);
    }

    public static void doXor(byte[] buff, int offset, int len, long pos) {
        int i = offset;
        while (true) {
            long pos2 = pos;
            if (i < len + offset) {
                pos = pos2 + 1;
                buff[i] = (byte) (buff[i] ^ ((13 + (17 * pos2)) & 255));
                i++;
            } else {
                return;
            }
        }
    }

    public static void replaceFile(File from, File to, boolean useXor) throws IOException {
        replaceFile(from, to, useXor, null);
    }

    public static void replaceFile(File from, File to, boolean useXor, @Nullable VoidF2<Long, Long> progressFunc) throws IOException {
        to.createNewFile();
        L.i("vk", from.getAbsolutePath(), "->", to.getAbsolutePath());
        byte[] buf = new byte[Task.EXTRAS_LIMIT_BYTES];
        FileInputStream in = new FileInputStream(from);
        FileOutputStream out = new FileOutputStream(to);
        long fileSize = from.length();
        if (progressFunc != null) {
            progressFunc.f(0L, Long.valueOf(fileSize));
        }
        long pos = 0;
        while (true) {
            int read = in.read(buf);
            if (read <= 0) {
                break;
            }
            if (useXor) {
                doXor(buf, read, pos);
            }
            pos += read;
            out.write(buf, 0, read);
            if (progressFunc != null) {
                progressFunc.f(Long.valueOf(pos), Long.valueOf(fileSize));
            }
        }
        if (progressFunc != null) {
            progressFunc.f(Long.valueOf(fileSize), Long.valueOf(fileSize));
        }
        in.close();
        out.close();
        from.delete();
    }

    public static File[] getExternalFilesDirs(Context context, String type) {
        File single;
        if (Build.VERSION.SDK_INT >= 19) {
            return context.getExternalFilesDirs(type);
        }
        File[] files = getExternalFilesDirsOld();
        if (files.length > 1) {
            for (int i = 0; i < files.length; i++) {
                files[i] = buildPath(true, files[i], DIR_ANDROID, "data", context.getPackageName(), DIR_FILES, type);
            }
            return files;
        }
        if (Build.VERSION.SDK_INT >= 8) {
            single = context.getExternalFilesDir(type);
        } else {
            single = buildPath(true, Environment.getExternalStorageDirectory(), DIR_ANDROID, "data", context.getPackageName(), DIR_FILES, type);
        }
        return new File[]{single};
    }

    public static File[] getExternalFilesDirsOld() {
        ArrayList<String> storagePaths = new ArrayList<>();
        String extStorage = Environment.getExternalStorageDirectory().getAbsolutePath();
        storagePaths.add(extStorage);
        try {
            BufferedReader reader = new BufferedReader(new FileReader("/proc/mounts"));
            HashMap<String, ArrayList<String>> aliases = new HashMap<>();
            ArrayList<String> result = new ArrayList<>();
            String extDevice = null;
            while (true) {
                String line = reader.readLine();
                if (line == null) {
                    break;
                } else if (line.contains("/mnt") || line.contains("/storage") || line.contains("/sdcard")) {
                    if (!line.contains("asec") && !line.contains("tmpfs") && !line.contains(SchedulerSupport.NONE)) {
                        String[] info = line.split(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
                        if (!aliases.containsKey(info[0])) {
                            aliases.put(info[0], new ArrayList<>());
                        }
                        aliases.get(info[0]).add(info[1]);
                        if (info[1].equals(extStorage)) {
                            extDevice = info[0];
                        }
                        result.add(info[1]);
                    }
                }
            }
            reader.close();
            if (extDevice != null) {
                result.removeAll(aliases.get(extDevice));
                Iterator<String> it = result.iterator();
                while (it.hasNext()) {
                    String path = it.next();
                    File f = new File(path);
                    if (f.canWrite()) {
                        storagePaths.add(path);
                    }
                }
            }
            File[] files = new File[storagePaths.size()];
            for (int i = 0; i < files.length; i++) {
                files[i] = new File(storagePaths.get(i));
            }
            return files;
        } catch (Exception x) {
            L.w(x, new Object[0]);
            return new File[0];
        }
    }

    private static File buildPath(boolean mkdirs, File base, String... segments) {
        File cur;
        int length = segments.length;
        int i = 0;
        File cur2 = base;
        while (i < length) {
            String segment = segments[i];
            if (cur2 == null) {
                cur = new File(segment);
            } else {
                cur = segment != null ? new File(cur2, segment) : cur2;
            }
            i++;
            cur2 = cur;
        }
        if (mkdirs && cur2 != null && !cur2.exists()) {
            cur2.mkdirs();
        }
        return cur2;
    }

    public static void openLink(Context context, String url) {
        if (!TextUtils.isEmpty(url)) {
            Intent intent = new Intent(context, LinkRedirActivity.class);
            intent.setData(Uri.parse(url));
            context.startActivity(intent);
        }
    }
}
