package ru.mail.libverify.utils.json;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public final class a {
    private static final ConcurrentHashMap<Object, Boolean> a = new ConcurrentHashMap<>();

    public static <T> T a(@NonNull String str, @NonNull Class<T> cls) {
        if (a((Class<?>) cls)) {
            try {
                return (T) b(new JSONObject(str), cls);
            } catch (JSONException e) {
                throw new JsonParseException(e);
            }
        } else if (!cls.isArray() || !a(cls.getComponentType())) {
            throw new IllegalArgumentException("Type deserialization is not supported " + cls.getName());
        } else {
            try {
                return (T) b(new JSONArray(str), cls);
            } catch (JSONException e2) {
                throw new JsonParseException(e2);
            }
        }
    }

    public static String a(@NonNull Object obj) {
        if (f(obj)) {
            return b(obj).toString();
        }
        if (obj.getClass().isArray()) {
            return e(obj).toString();
        }
        if (obj instanceof Map) {
            return c(obj).toString();
        }
        if (!(obj instanceof List) && !(obj instanceof Set)) {
            throw new IllegalArgumentException("Type serialization is not supported");
        }
        return d(obj).toString();
    }

    private static Collection a(@NonNull JSONObject jSONObject, Field field, String str, Class<?> cls) {
        JSONArray jSONArray = jSONObject.getJSONArray(str);
        AbstractCollection hashSet = cls == Set.class ? new HashSet() : new ArrayList();
        Type genericType = field.getGenericType();
        Class cls2 = null;
        if (genericType instanceof ParameterizedType) {
            Type[] actualTypeArguments = ((ParameterizedType) genericType).getActualTypeArguments();
            if (actualTypeArguments.length != 1) {
                throw new IllegalArgumentException();
            }
            cls2 = (Class) actualTypeArguments[0];
        }
        if (cls2 == null) {
            throw new IllegalArgumentException();
        }
        for (int i = 0; i < jSONArray.length(); i++) {
            if (cls2.isEnum()) {
                hashSet.add(d(jSONArray.getString(i), cls2));
            } else if (a((Class<?>) cls2)) {
                hashSet.add(b(jSONArray.getJSONObject(i), cls2));
            } else {
                hashSet.add(jSONArray.get(i));
            }
        }
        return hashSet;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static <T> HashMap<String, T> a(@NonNull JSONObject jSONObject, @NonNull Class<T> cls) {
        try {
            HashMap<String, T> hashMap = (HashMap<String, T>) new HashMap();
            Iterator<String> keys = jSONObject.keys();
            if (a((Class<?>) cls)) {
                while (keys.hasNext()) {
                    String next = keys.next();
                    hashMap.put(next, b((JSONObject) jSONObject.get(next), cls));
                }
            } else {
                while (keys.hasNext()) {
                    String next2 = keys.next();
                    hashMap.put(next2, jSONObject.get(next2));
                }
            }
            return hashMap;
        } catch (Throwable th) {
            jSONObject.toString();
            throw new JsonParseException(th);
        }
    }

    private static <T> List<T> a(@NonNull JSONArray jSONArray, @NonNull Class<T> cls) {
        try {
            return Arrays.asList((Object[]) c(jSONArray, (Class<?>) cls));
        } catch (Throwable th) {
            jSONArray.toString();
            throw new JsonParseException(th);
        }
    }

    private static Map a(@NonNull JSONObject jSONObject, Field field) {
        Class cls;
        Class cls2 = null;
        HashMap hashMap = new HashMap();
        Type genericType = field.getGenericType();
        if (genericType instanceof ParameterizedType) {
            Type[] actualTypeArguments = ((ParameterizedType) genericType).getActualTypeArguments();
            if (actualTypeArguments.length != 2) {
                throw new IllegalArgumentException();
            }
            cls = (Class) actualTypeArguments[0];
            cls2 = (Class) actualTypeArguments[1];
        } else {
            cls = null;
        }
        if (cls == null || cls2 == null) {
            throw new IllegalArgumentException();
        }
        Iterator<String> keys = jSONObject.keys();
        while (keys.hasNext()) {
            String next = keys.next();
            if (cls2.isEnum()) {
                hashMap.put(next, d(jSONObject.getString(next), cls2));
            } else if (a((Class<?>) cls2)) {
                hashMap.put(next, b(jSONObject.getJSONObject(next), cls2));
            } else {
                hashMap.put(next, jSONObject.getString(next));
            }
        }
        return hashMap;
    }

    private static boolean a(@Nullable Class<?> cls) {
        if (cls == null) {
            return false;
        }
        if (cls.isPrimitive() || cls.isEnum() || cls.isArray() || cls == String.class || cls == Map.class || cls == List.class || cls == Set.class) {
            return false;
        }
        if (a.containsKey(cls)) {
            return true;
        }
        for (Class<?> cls2 = cls; cls2.getSuperclass() != null; cls2 = cls2.getSuperclass()) {
            for (Class<?> cls3 : cls2.getInterfaces()) {
                if (cls3 == Gsonable.class) {
                    a.put(cls, true);
                    return true;
                }
            }
        }
        return false;
    }

    private static <T> T b(@NonNull JSONArray jSONArray, @NonNull Class<T> cls) {
        try {
            return (T) c(jSONArray, (Class<?>) cls);
        } catch (Throwable th) {
            jSONArray.toString();
            throw new JsonParseException(th);
        }
    }

    private static <T> T b(@NonNull JSONObject jSONObject, @NonNull Class<T> cls) {
        Field[] declaredFields;
        try {
            Constructor<T> declaredConstructor = cls.getDeclaredConstructor(new Class[0]);
            declaredConstructor.setAccessible(true);
            T newInstance = declaredConstructor.newInstance(new Object[0]);
            LinkedList<Field> linkedList = new LinkedList();
            while (cls.getSuperclass() != null) {
                for (Field field : cls.getDeclaredFields()) {
                    if (!Modifier.isStatic(field.getModifiers()) && !Modifier.isTransient(field.getModifiers())) {
                        linkedList.add(field);
                    }
                }
                cls = cls.getSuperclass();
            }
            for (Field field2 : linkedList) {
                String name = field2.getName();
                if (jSONObject.has(name)) {
                    field2.setAccessible(true);
                    Class<?> type = field2.getType();
                    if (!type.isPrimitive()) {
                        if (type != String.class) {
                            if (type.isArray()) {
                                field2.set(newInstance, c(jSONObject.getJSONArray(name), type));
                            } else if (type == Map.class) {
                                field2.set(newInstance, a(jSONObject, field2));
                            } else if (type == Set.class || type == List.class) {
                                field2.set(newInstance, a(jSONObject, field2, name, type));
                            } else if (a(type)) {
                                field2.set(newInstance, b(jSONObject.getJSONObject(name), type));
                            } else if (type.isEnum()) {
                                field2.set(newInstance, d(jSONObject.getString(name), type));
                            }
                        }
                        field2.set(newInstance, jSONObject.get(name));
                    } else if (type == Integer.TYPE || type == Integer.class) {
                        field2.set(newInstance, Integer.valueOf(jSONObject.getInt(name)));
                    } else if (type == Long.TYPE || type == Long.class) {
                        field2.set(newInstance, Long.valueOf(jSONObject.getLong(name)));
                    } else if (type == Double.TYPE || type == Double.class) {
                        field2.set(newInstance, Long.valueOf(jSONObject.getLong(name)));
                    } else {
                        field2.set(newInstance, jSONObject.get(name));
                    }
                }
            }
            return newInstance;
        } catch (Throwable th) {
            jSONObject.toString();
            throw new JsonParseException(th);
        }
    }

    public static <T> List<T> b(@NonNull String str, @NonNull Class<T> cls) {
        try {
            return a(new JSONArray(str), cls);
        } catch (JSONException e) {
            throw new JsonParseException(e);
        }
    }

    private static JSONObject b(@NonNull Object obj) {
        try {
            JSONObject jSONObject = new JSONObject();
            ArrayList<Field> arrayList = new ArrayList();
            for (Class<?> cls = obj.getClass(); cls.getSuperclass() != null; cls = cls.getSuperclass()) {
                arrayList.addAll(Arrays.asList(cls.getDeclaredFields()));
            }
            for (Field field : arrayList) {
                if (!Modifier.isStatic(field.getModifiers()) && !Modifier.isTransient(field.getModifiers())) {
                    String name = field.getName();
                    field.setAccessible(true);
                    Object obj2 = field.get(obj);
                    if (obj2 != null) {
                        Class<?> type = field.getType();
                        if (type.isArray()) {
                            jSONObject.put(name, e(obj2));
                        } else if (type == Map.class) {
                            jSONObject.put(name, c(obj2));
                        } else if (type == Set.class || type == List.class) {
                            jSONObject.put(name, d(obj2));
                        } else if (a(type)) {
                            jSONObject.put(name, b(obj2));
                        } else {
                            jSONObject.put(name, obj2);
                        }
                    }
                }
            }
            return jSONObject;
        } catch (Throwable th) {
            obj.toString();
            throw new JsonParseException(th);
        }
    }

    private static Object c(@NonNull JSONArray jSONArray, Class<?> cls) {
        int i = 0;
        Class<?> componentType = cls.getComponentType();
        if (componentType == null) {
            componentType = cls;
        }
        Object newInstance = Array.newInstance(componentType, jSONArray.length());
        if (a(componentType)) {
            while (i < jSONArray.length()) {
                Array.set(newInstance, i, b(jSONArray.getJSONObject(i), componentType));
                i++;
            }
        } else if (componentType.isEnum()) {
            while (i < jSONArray.length()) {
                Array.set(newInstance, i, d(jSONArray.getString(i), componentType));
                i++;
            }
        } else if (cls == Integer.TYPE || cls == Integer.class) {
            while (i < jSONArray.length()) {
                Array.set(newInstance, i, Integer.valueOf(jSONArray.getInt(i)));
                i++;
            }
        } else if (cls == Long.TYPE || cls == Long.class) {
            while (i < jSONArray.length()) {
                Array.set(newInstance, i, Long.valueOf(jSONArray.getLong(i)));
                i++;
            }
        } else if (cls == Double.TYPE || cls == Double.class) {
            while (i < jSONArray.length()) {
                Array.set(newInstance, i, Double.valueOf(jSONArray.getDouble(i)));
                i++;
            }
        } else {
            while (i < jSONArray.length()) {
                Array.set(newInstance, i, jSONArray.get(i));
                i++;
            }
        }
        return newInstance;
    }

    public static <T> HashMap<String, T> c(@NonNull String str, @NonNull Class<T> cls) {
        try {
            return a(new JSONObject(str), cls);
        } catch (JSONException e) {
            throw new JsonParseException(e);
        }
    }

    private static JSONObject c(@NonNull Object obj) {
        try {
            JSONObject jSONObject = new JSONObject();
            Map map = (Map) obj;
            for (Object obj2 : map.keySet()) {
                String str = (String) obj2;
                Object obj3 = map.get(obj2);
                if (f(obj3)) {
                    jSONObject.put(str, b(obj3));
                } else {
                    jSONObject.put(str, obj3);
                }
            }
            return jSONObject;
        } catch (Throwable th) {
            obj.toString();
            throw new JsonParseException(th);
        }
    }

    private static Object d(String str, Class<?> cls) {
        Field[] fields;
        if (str == null || cls == null) {
            return null;
        }
        for (Field field : cls.getFields()) {
            if (field.isAnnotationPresent(b.class) && TextUtils.equals(((b) field.getAnnotation(b.class)).a(), str)) {
                str = field.getName();
                break;
            }
        }
        try {
            return Enum.valueOf(cls, str);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    private static JSONArray d(@NonNull Object obj) {
        try {
            JSONArray jSONArray = new JSONArray();
            for (Object obj2 : (Collection) obj) {
                if (f(obj2)) {
                    jSONArray.put(b(obj2));
                } else {
                    jSONArray.put(obj2);
                }
            }
            return jSONArray;
        } catch (Throwable th) {
            obj.toString();
            throw new JsonParseException(th);
        }
    }

    private static JSONArray e(@NonNull Object obj) {
        try {
            JSONArray jSONArray = new JSONArray();
            for (int i = 0; i < Array.getLength(obj); i++) {
                Object obj2 = Array.get(obj, i);
                if (f(obj2)) {
                    jSONArray.put(b(obj2));
                } else {
                    jSONArray.put(obj2);
                }
            }
            return jSONArray;
        } catch (Throwable th) {
            obj.toString();
            throw new JsonParseException(th);
        }
    }

    private static boolean f(@Nullable Object obj) {
        if (obj != null && !(obj instanceof Map) && !(obj instanceof List) && !(obj instanceof Set) && !(obj instanceof String)) {
            return a(obj.getClass());
        }
        return false;
    }
}
