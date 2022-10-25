package com.google.android.gms.internal;

import android.content.ContentResolver;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Pattern;
/* loaded from: classes.dex */
public class zzagp {
    static HashMap<String, String> aVk;
    private static Object aVl;
    private static boolean aVm;
    public static final Uri CONTENT_URI = Uri.parse("content://com.google.android.gsf.gservices");
    public static final Uri aVg = Uri.parse("content://com.google.android.gsf.gservices/prefix");
    public static final Pattern aVh = Pattern.compile("^(1|true|t|on|yes|y)$", 2);
    public static final Pattern aVi = Pattern.compile("^(0|false|f|off|no|n)$", 2);
    private static final AtomicBoolean aVj = new AtomicBoolean();
    static String[] aVn = new String[0];

    public static long getLong(ContentResolver contentResolver, String str, long j) {
        String string = getString(contentResolver, str);
        if (string != null) {
            try {
                return Long.parseLong(string);
            } catch (NumberFormatException e) {
                return j;
            }
        }
        return j;
    }

    @Deprecated
    public static String getString(ContentResolver contentResolver, String str) {
        return zza(contentResolver, str, (String) null);
    }

    public static String zza(ContentResolver contentResolver, String str, String str2) {
        synchronized (zzagp.class) {
            zza(contentResolver);
            Object obj = aVl;
            if (aVk.containsKey(str)) {
                String str3 = aVk.get(str);
                if (str3 != null) {
                    str2 = str3;
                }
            } else {
                String[] strArr = aVn;
                int length = strArr.length;
                int i = 0;
                while (true) {
                    if (i >= length) {
                        Cursor query = contentResolver.query(CONTENT_URI, null, null, new String[]{str}, null);
                        if (query != null) {
                            try {
                                if (query.moveToFirst()) {
                                    String string = query.getString(1);
                                    if (string != null && string.equals(str2)) {
                                        string = str2;
                                    }
                                    zza(obj, str, string);
                                    if (string != null) {
                                        str2 = string;
                                    }
                                    if (query != null) {
                                        query.close();
                                    }
                                }
                            } catch (Throwable th) {
                                if (query != null) {
                                    query.close();
                                }
                                throw th;
                            }
                        }
                        zza(obj, str, (String) null);
                        if (query != null) {
                            query.close();
                        }
                    } else if (!str.startsWith(strArr[i])) {
                        i++;
                    } else if (!aVm || aVk.isEmpty()) {
                        zzc(contentResolver, aVn);
                        if (aVk.containsKey(str)) {
                            String str4 = aVk.get(str);
                            if (str4 != null) {
                                str2 = str4;
                            }
                        }
                    }
                }
            }
        }
        return str2;
    }

    public static Map<String, String> zza(ContentResolver contentResolver, String... strArr) {
        Cursor query = contentResolver.query(aVg, null, null, strArr, null);
        TreeMap treeMap = new TreeMap();
        if (query != null) {
            while (query.moveToNext()) {
                try {
                    treeMap.put(query.getString(0), query.getString(1));
                } finally {
                    query.close();
                }
            }
        }
        return treeMap;
    }

    private static void zza(ContentResolver contentResolver) {
        if (aVk == null) {
            aVj.set(false);
            aVk = new HashMap<>();
            aVl = new Object();
            aVm = false;
            contentResolver.registerContentObserver(CONTENT_URI, true, new ContentObserver(new Handler(Looper.getMainLooper())) { // from class: com.google.android.gms.internal.zzagp.1
                @Override // android.database.ContentObserver
                public void onChange(boolean z) {
                    zzagp.aVj.set(true);
                }
            });
        } else if (!aVj.getAndSet(false)) {
        } else {
            aVk.clear();
            aVl = new Object();
            aVm = false;
        }
    }

    private static void zza(Object obj, String str, String str2) {
        synchronized (zzagp.class) {
            if (obj == aVl) {
                aVk.put(str, str2);
            }
        }
    }

    public static void zzb(ContentResolver contentResolver, String... strArr) {
        if (strArr.length == 0) {
            return;
        }
        synchronized (zzagp.class) {
            zza(contentResolver);
            String[] zzk = zzk(strArr);
            if (!aVm || aVk.isEmpty()) {
                zzc(contentResolver, aVn);
            } else if (zzk.length != 0) {
                zzc(contentResolver, zzk);
            }
        }
    }

    private static void zzc(ContentResolver contentResolver, String[] strArr) {
        aVk.putAll(zza(contentResolver, strArr));
        aVm = true;
    }

    private static String[] zzk(String[] strArr) {
        HashSet hashSet = new HashSet((((aVn.length + strArr.length) * 4) / 3) + 1);
        hashSet.addAll(Arrays.asList(aVn));
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            if (hashSet.add(str)) {
                arrayList.add(str);
            }
        }
        if (arrayList.isEmpty()) {
            return new String[0];
        }
        aVn = (String[]) hashSet.toArray(new String[hashSet.size()]);
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }
}
