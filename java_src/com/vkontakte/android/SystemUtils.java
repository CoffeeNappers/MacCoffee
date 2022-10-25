package com.vkontakte.android;

import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.vkontakte.android.utils.Serializer;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class SystemUtils {
    public static final boolean IS_ART_RUNTIME;

    static {
        IS_ART_RUNTIME = Build.VERSION.SDK_INT >= 21 || isArt();
    }

    private static boolean isArt() {
        String ver = System.getProperty("java.vm.version");
        if (ver == null) {
            return false;
        }
        try {
            int version = Integer.parseInt(ver.split("\\.")[0]);
            return version >= 2;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static void writeParcelableList(Parcel out, List<? extends Parcelable> list) {
        out.writeInt(list.size());
        for (Parcelable p : list) {
            out.writeParcelable(p, 0);
        }
    }

    public static void writeSerializerSerializableList(Serializer out, List<? extends Serializer.Serializable> list) {
        out.writeInt(list.size());
        for (Serializer.Serializable p : list) {
            out.writeSerializable(p);
        }
    }

    public static <T extends Parcelable> void readParcelableList(Parcel in, List<T> list, Class<T> cls) {
        int len = in.readInt();
        for (int i = 0; i < len; i++) {
            list.add(cls.cast(in.readParcelable(cls.getClassLoader())));
        }
    }

    public static <T extends Parcelable> void readSerializerSerializableList(Serializer in, List<T> list, Class<T> cls) {
        int len = in.readInt();
        for (int i = 0; i < len; i++) {
            list.add(cls.cast(in.readSerializable(cls.getClassLoader())));
        }
    }

    public static void deserializeBundle(String xtra, Bundle bundle) {
        if (xtra != null && xtra.length() > 0) {
            try {
                JSONObject obj = new JSONObject(xtra);
                Iterator<String> keys = obj.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    Object o = obj.get(k);
                    if (o instanceof Integer) {
                        bundle.putInt(k, ((Integer) o).intValue());
                    } else if (o instanceof Boolean) {
                        bundle.putBoolean(k, ((Boolean) o).booleanValue());
                    } else {
                        bundle.putString(k, (String) o);
                    }
                }
            } catch (JSONException x) {
                Log.w("vk", x);
            }
        }
    }

    public static String serializeBundle(Bundle extra) {
        if (extra == null || extra.size() == 0) {
            return "";
        }
        try {
            JSONObject obj = new JSONObject();
            Set<String> keys = extra.keySet();
            for (String k : keys) {
                obj.put(k, extra.get(k));
            }
            return obj.toString();
        } catch (JSONException x) {
            Log.w("vk", x);
            return "";
        }
    }

    @Nullable
    public static int[] asIntArray(@Nullable List<Integer> source) {
        if (source != null) {
            int[] result = new int[source.size()];
            for (int i = 0; i < result.length; i++) {
                result[i] = source.get(i).intValue();
            }
            return result;
        }
        return null;
    }
}
