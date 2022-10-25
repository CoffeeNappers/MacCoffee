package com.vkontakte.android.orm;

import android.content.Context;
import android.content.pm.PackageManager;
import android.text.TextUtils;
import dalvik.system.DexFile;
import java.io.IOException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class ClassLoader {
    private static final Map<Class, ClassMetaData> sCache = new HashMap();
    static boolean sClassesLoaded = false;

    private ClassLoader() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static <T> ClassMetaData<T> get(Class<T> clazz) {
        ClassMetaData<T> result = sCache.get(clazz);
        if (result == null) {
            try {
                Map<Class, ClassMetaData> map = sCache;
                ClassMetaData<T> result2 = load(clazz);
                map.put(clazz, result2);
                return result2;
            } catch (IllegalClassException e) {
                throw new IllegalArgumentException(e);
            }
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void loadClasses(Class... classes) {
        if (classes != null) {
            for (Class clazz : classes) {
                try {
                    load(clazz);
                } catch (IllegalClassException e) {
                    ORM.logE(e);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void loadClasses(Context context, String subpackageName) {
        long start = System.currentTimeMillis();
        int count = 0;
        try {
            String str = context.getPackageManager().getApplicationInfo(context.getPackageName(), 0).sourceDir;
            String packageName = context.getPackageName();
            if (!TextUtils.isEmpty(subpackageName)) {
                ORM.logI("Detected specific package name for classes : " + subpackageName);
                if (subpackageName.startsWith(".")) {
                    subpackageName = packageName + subpackageName;
                }
            } else {
                subpackageName = packageName;
            }
            ORM.logI("Searching for the classes in: " + subpackageName);
            DexFile dexfile = new DexFile(context.getPackageCodePath());
            Enumeration<String> entries = dexfile.entries();
            while (entries.hasMoreElements()) {
                String name = entries.nextElement();
                if (name != null && name.startsWith(subpackageName)) {
                    try {
                        Class clazz = Class.forName(name, true, context.getClass().getClassLoader());
                        if (clazz != null) {
                            sCache.put(clazz, load(clazz));
                            count++;
                        }
                    } catch (IllegalClassException e) {
                    } catch (ClassNotFoundException e2) {
                    }
                }
            }
        } catch (PackageManager.NameNotFoundException | IOException e3) {
            ORM.logE("VK-ORM", e3);
        }
        ORM.logI(String.format("Found %s classes in %s ms", Integer.valueOf(count), Long.valueOf(System.currentTimeMillis() - start)));
    }

    static void loadClassesFromCatalog(Context context) {
        Iterator<String> it = EntitiesCatalog.entities.iterator();
        while (it.hasNext()) {
            String className = it.next();
            try {
                Class clazz = Class.forName(className, true, context.getClass().getClassLoader());
                if (clazz != null) {
                    sCache.put(clazz, load(clazz));
                }
            } catch (IllegalClassException | ClassNotFoundException e) {
                ORM.logE(e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void loadClasses(Context context) {
        if (!sClassesLoaded) {
            loadClassesFromCatalog(context);
            sClassesLoaded = true;
        }
    }

    static Set<Map.Entry<Class, ClassMetaData>> earch() {
        return sCache.entrySet();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Collection<ClassMetaData> values() {
        return sCache.values();
    }

    private static <T> ClassMetaData<T> load(Class<T> clazz) throws IllegalClassException {
        return new ClassMetaData<>(clazz);
    }
}
