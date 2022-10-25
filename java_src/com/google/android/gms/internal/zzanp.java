package com.google.android.gms.internal;

import android.util.Log;
import com.google.firebase.database.DatabaseException;
import com.google.firebase.database.Exclude;
import com.google.firebase.database.GenericTypeIndicator;
import com.google.firebase.database.IgnoreExtraProperties;
import com.google.firebase.database.PropertyName;
import com.google.firebase.database.ThrowOnExtraProperties;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
/* loaded from: classes2.dex */
public class zzanp {
    private static final ConcurrentMap<Class<?>, zza<?>> bko = new ConcurrentHashMap();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zza<T> {
        private final Class<T> bkp;
        private final Constructor<T> bkq;
        private final boolean bkr;
        private final boolean bks;
        private final Map<String, String> bkt;
        private final Map<String, Method> bku;
        private final Map<String, Method> bkv;
        private final Map<String, Field> bkw;

        public zza(Class<T> cls) {
            Constructor<T> constructor;
            Method[] methods;
            Field[] fields;
            Method[] declaredMethods;
            Field[] declaredFields;
            this.bkp = cls;
            this.bkr = cls.isAnnotationPresent(ThrowOnExtraProperties.class);
            this.bks = !cls.isAnnotationPresent(IgnoreExtraProperties.class);
            this.bkt = new HashMap();
            this.bkv = new HashMap();
            this.bku = new HashMap();
            this.bkw = new HashMap();
            try {
                constructor = cls.getDeclaredConstructor(new Class[0]);
                constructor.setAccessible(true);
            } catch (NoSuchMethodException e) {
                constructor = null;
            }
            this.bkq = constructor;
            for (Method method : cls.getMethods()) {
                if (zza(method)) {
                    String zzc = zzc(method);
                    zzto(zzc);
                    method.setAccessible(true);
                    if (this.bku.containsKey(zzc)) {
                        String valueOf = String.valueOf(method.getName());
                        throw new DatabaseException(valueOf.length() != 0 ? "Found conflicting getters for name: ".concat(valueOf) : new String("Found conflicting getters for name: "));
                    }
                    this.bku.put(zzc, method);
                }
            }
            for (Field field : cls.getFields()) {
                if (zza(field)) {
                    zzto(zzb(field));
                }
            }
            Class<T> cls2 = cls;
            while (true) {
                for (Method method2 : cls2.getDeclaredMethods()) {
                    if (zzb(method2)) {
                        String zzc2 = zzc(method2);
                        String str = this.bkt.get(zzc2.toLowerCase());
                        if (str == null) {
                            continue;
                        } else if (!str.equals(zzc2)) {
                            String valueOf2 = String.valueOf(method2.getName());
                            throw new DatabaseException(valueOf2.length() != 0 ? "Found setter with invalid case-sensitive name: ".concat(valueOf2) : new String("Found setter with invalid case-sensitive name: "));
                        } else {
                            Method method3 = this.bkv.get(zzc2);
                            if (method3 == null) {
                                method2.setAccessible(true);
                                this.bkv.put(zzc2, method2);
                            } else if (!zza(method2, method3)) {
                                String valueOf3 = String.valueOf(method2.getName());
                                String valueOf4 = String.valueOf(method3.getName());
                                String valueOf5 = String.valueOf(method3.getDeclaringClass().getName());
                                throw new DatabaseException(new StringBuilder(String.valueOf(valueOf3).length() + 69 + String.valueOf(valueOf4).length() + String.valueOf(valueOf5).length()).append("Found a conflicting setters with name: ").append(valueOf3).append(" (conflicts with ").append(valueOf4).append(" defined on ").append(valueOf5).append(")").toString());
                            }
                        }
                    }
                }
                for (Field field2 : cls2.getDeclaredFields()) {
                    String zzb = zzb(field2);
                    if (this.bkt.containsKey(zzb.toLowerCase()) && !this.bkw.containsKey(zzb)) {
                        field2.setAccessible(true);
                        this.bkw.put(zzb, field2);
                    }
                }
                Class<T> superclass = cls2.getSuperclass();
                if (superclass == null || superclass.equals(Object.class)) {
                    break;
                }
                cls2 = superclass;
            }
            if (this.bkt.isEmpty()) {
                String valueOf6 = String.valueOf(cls.getName());
                throw new DatabaseException(valueOf6.length() != 0 ? "No properties to serialize found on class ".concat(valueOf6) : new String("No properties to serialize found on class "));
            }
        }

        private static String zza(AccessibleObject accessibleObject) {
            if (accessibleObject.isAnnotationPresent(PropertyName.class)) {
                return ((PropertyName) accessibleObject.getAnnotation(PropertyName.class)).value();
            }
            return null;
        }

        private Type zza(Type type, Map<TypeVariable<Class<T>>, Type> map) {
            if (type instanceof TypeVariable) {
                Type type2 = map.get(type);
                if (type2 != null) {
                    return type2;
                }
                String valueOf = String.valueOf(type);
                throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 23).append("Could not resolve type ").append(valueOf).toString());
            }
            return type;
        }

        private static boolean zza(Field field) {
            return !field.getDeclaringClass().equals(Object.class) && Modifier.isPublic(field.getModifiers()) && !Modifier.isStatic(field.getModifiers()) && !Modifier.isTransient(field.getModifiers()) && !field.isAnnotationPresent(Exclude.class);
        }

        private static boolean zza(Method method) {
            return (method.getName().startsWith("get") || method.getName().startsWith("is")) && !method.getDeclaringClass().equals(Object.class) && Modifier.isPublic(method.getModifiers()) && !Modifier.isStatic(method.getModifiers()) && !method.getReturnType().equals(Void.TYPE) && method.getParameterTypes().length == 0 && !method.isAnnotationPresent(Exclude.class);
        }

        private static boolean zza(Method method, Method method2) {
            zzann.zzb(method.getDeclaringClass().isAssignableFrom(method2.getDeclaringClass()), "Expected override from a base class");
            zzann.zzb(method.getReturnType().equals(Void.TYPE), "Expected void return type");
            zzann.zzb(method2.getReturnType().equals(Void.TYPE), "Expected void return type");
            Class<?>[] parameterTypes = method.getParameterTypes();
            Class<?>[] parameterTypes2 = method2.getParameterTypes();
            zzann.zzb(parameterTypes.length == 1, "Expected exactly one parameter");
            zzann.zzb(parameterTypes2.length == 1, "Expected exactly one parameter");
            return method.getName().equals(method2.getName()) && parameterTypes[0].equals(parameterTypes2[0]);
        }

        private static String zzb(Field field) {
            String zza = zza((AccessibleObject) field);
            return zza != null ? zza : field.getName();
        }

        private static boolean zzb(Method method) {
            return method.getName().startsWith("set") && !method.getDeclaringClass().equals(Object.class) && !Modifier.isStatic(method.getModifiers()) && method.getReturnType().equals(Void.TYPE) && method.getParameterTypes().length == 1 && !method.isAnnotationPresent(Exclude.class);
        }

        private static String zzc(Method method) {
            String zza = zza((AccessibleObject) method);
            return zza != null ? zza : zztp(method.getName());
        }

        private void zzto(String str) {
            String put = this.bkt.put(str.toLowerCase(), str);
            if (put == null || str.equals(put)) {
                return;
            }
            String valueOf = String.valueOf(str.toLowerCase());
            throw new DatabaseException(valueOf.length() != 0 ? "Found two getters or fields with conflicting case sensitivity for property: ".concat(valueOf) : new String("Found two getters or fields with conflicting case sensitivity for property: "));
        }

        private static String zztp(String str) {
            String[] strArr = {"get", "set", "is"};
            String str2 = null;
            int i = 0;
            while (i < 3) {
                String str3 = strArr[i];
                if (!str.startsWith(str3)) {
                    str3 = str2;
                }
                i++;
                str2 = str3;
            }
            if (str2 == null) {
                String valueOf = String.valueOf(str);
                throw new IllegalArgumentException(valueOf.length() != 0 ? "Unknown Bean prefix for method: ".concat(valueOf) : new String("Unknown Bean prefix for method: "));
            }
            char[] charArray = str.substring(str2.length()).toCharArray();
            for (int i2 = 0; i2 < charArray.length && Character.isUpperCase(charArray[i2]); i2++) {
                charArray[i2] = Character.toLowerCase(charArray[i2]);
            }
            return new String(charArray);
        }

        public T zzcg(Map<String, Object> map) {
            return zze(map, Collections.emptyMap());
        }

        public Map<String, Object> zzch(T t) {
            Object obj;
            if (!this.bkp.isAssignableFrom(t.getClass())) {
                String valueOf = String.valueOf(t.getClass());
                String valueOf2 = String.valueOf(this.bkp);
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 59 + String.valueOf(valueOf2).length()).append("Can't serialize object of class ").append(valueOf).append(" with BeanMapper for class ").append(valueOf2).toString());
            }
            HashMap hashMap = new HashMap();
            for (String str : this.bkt.values()) {
                if (this.bku.containsKey(str)) {
                    try {
                        obj = this.bku.get(str).invoke(t, new Object[0]);
                    } catch (IllegalAccessException e) {
                        throw new RuntimeException(e);
                    } catch (InvocationTargetException e2) {
                        throw new RuntimeException(e2);
                    }
                } else {
                    Field field = this.bkw.get(str);
                    if (field == null) {
                        String valueOf3 = String.valueOf(str);
                        throw new IllegalStateException(valueOf3.length() != 0 ? "Bean property without field or getter:".concat(valueOf3) : new String("Bean property without field or getter:"));
                    }
                    try {
                        obj = field.get(t);
                    } catch (IllegalAccessException e3) {
                        throw new RuntimeException(e3);
                    }
                }
                hashMap.put(str, zzanp.zzbz(obj));
            }
            return hashMap;
        }

        public T zze(Map<String, Object> map, Map<TypeVariable<Class<T>>, Type> map2) {
            if (this.bkq == null) {
                String valueOf = String.valueOf(this.bkp.getName());
                throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 49).append("Class ").append(valueOf).append(" is missing a constructor with no arguments").toString());
            }
            try {
                T newInstance = this.bkq.newInstance(new Object[0]);
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    String key = entry.getKey();
                    if (this.bkv.containsKey(key)) {
                        Method method = this.bkv.get(key);
                        Type[] genericParameterTypes = method.getGenericParameterTypes();
                        if (genericParameterTypes.length != 1) {
                            throw new IllegalStateException("Setter does not have exactly one parameter");
                        }
                        try {
                            method.invoke(newInstance, zzanp.zza(entry.getValue(), zza(genericParameterTypes[0], map2)));
                        } catch (IllegalAccessException e) {
                            throw new RuntimeException(e);
                        } catch (InvocationTargetException e2) {
                            throw new RuntimeException(e2);
                        }
                    } else if (this.bkw.containsKey(key)) {
                        Field field = this.bkw.get(key);
                        try {
                            field.set(newInstance, zzanp.zza(entry.getValue(), zza(field.getGenericType(), map2)));
                        } catch (IllegalAccessException e3) {
                            throw new RuntimeException(e3);
                        }
                    } else {
                        String valueOf2 = String.valueOf(this.bkp.getName());
                        String sb = new StringBuilder(String.valueOf(key).length() + 36 + String.valueOf(valueOf2).length()).append("No setter/field for ").append(key).append(" found on class ").append(valueOf2).toString();
                        if (this.bkt.containsKey(key.toLowerCase())) {
                            sb = String.valueOf(sb).concat(" (fields/setters are case sensitive!)");
                        }
                        if (this.bkr) {
                            throw new DatabaseException(sb);
                        }
                        if (this.bks) {
                            Log.w("ClassMapper", sb);
                        }
                    }
                }
                return newInstance;
            } catch (IllegalAccessException e4) {
                throw new RuntimeException(e4);
            } catch (InstantiationException e5) {
                throw new RuntimeException(e5);
            } catch (InvocationTargetException e6) {
                throw new RuntimeException(e6);
            }
        }
    }

    public static <T> T zza(Object obj, GenericTypeIndicator<T> genericTypeIndicator) {
        Type genericSuperclass = genericTypeIndicator.getClass().getGenericSuperclass();
        if (!(genericSuperclass instanceof ParameterizedType)) {
            String valueOf = String.valueOf(genericSuperclass);
            throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 47).append("Not a direct subclass of GenericTypeIndicator: ").append(valueOf).toString());
        }
        ParameterizedType parameterizedType = (ParameterizedType) genericSuperclass;
        if (parameterizedType.getRawType().equals(GenericTypeIndicator.class)) {
            return (T) zza(obj, parameterizedType.getActualTypeArguments()[0]);
        }
        String valueOf2 = String.valueOf(genericSuperclass);
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf2).length() + 47).append("Not a direct subclass of GenericTypeIndicator: ").append(valueOf2).toString());
    }

    public static <T> T zza(Object obj, Class<T> cls) {
        return (T) zzb(obj, (Class<Object>) cls);
    }

    /* JADX WARN: Type inference failed for: r0v26, types: [java.util.List, T, java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r2v8, types: [T, java.util.HashMap] */
    private static <T> T zza(Object obj, ParameterizedType parameterizedType) {
        Class cls = (Class) parameterizedType.getRawType();
        if (List.class.isAssignableFrom(cls)) {
            Type type = parameterizedType.getActualTypeArguments()[0];
            if (!(obj instanceof List)) {
                String valueOf = String.valueOf(obj.getClass());
                throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 47).append("Expected a List while deserializing, but got a ").append(valueOf).toString());
            }
            List<Object> list = (List) obj;
            ?? r0 = (T) new ArrayList(list.size());
            for (Object obj2 : list) {
                r0.add(zza(obj2, type));
            }
            return r0;
        } else if (Map.class.isAssignableFrom(cls)) {
            Type type2 = parameterizedType.getActualTypeArguments()[0];
            Type type3 = parameterizedType.getActualTypeArguments()[1];
            if (!type2.equals(String.class)) {
                String valueOf2 = String.valueOf(type2);
                throw new DatabaseException(new StringBuilder(String.valueOf(valueOf2).length() + 70).append("Only Maps with string keys are supported, but found Map with key type ").append(valueOf2).toString());
            }
            Map<String, Object> zzca = zzca(obj);
            ?? r2 = (T) new HashMap();
            for (Map.Entry<String, Object> entry : zzca.entrySet()) {
                r2.put(entry.getKey(), zza(entry.getValue(), type3));
            }
            return r2;
        } else if (Collection.class.isAssignableFrom(cls)) {
            throw new DatabaseException("Collections are not supported, please use Lists instead");
        } else {
            Map<String, Object> zzca2 = zzca(obj);
            zza zzj = zzj(cls);
            HashMap hashMap = new HashMap();
            TypeVariable<Class<T>>[] typeParameters = zzj.bkp.getTypeParameters();
            Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
            if (actualTypeArguments.length != typeParameters.length) {
                throw new IllegalStateException("Mismatched lengths for type variables and actual types");
            }
            for (int i = 0; i < typeParameters.length; i++) {
                hashMap.put(typeParameters[i], actualTypeArguments[i]);
            }
            return (T) zzj.zze(zzca2, hashMap);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <T> T zza(Object obj, Type type) {
        if (obj == null) {
            return null;
        }
        if (type instanceof ParameterizedType) {
            return (T) zza(obj, (ParameterizedType) type);
        }
        if (type instanceof Class) {
            return (T) zzb(obj, (Class<Object>) type);
        }
        if (type instanceof WildcardType) {
            throw new DatabaseException("Generic wildcard types are not supported");
        }
        if (type instanceof GenericArrayType) {
            throw new DatabaseException("Generic Arrays are not supported, please use Lists instead");
        }
        String valueOf = String.valueOf(type);
        throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 26).append("Unknown type encountered: ").append(valueOf).toString());
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static <T> T zzb(Object obj, Class<T> cls) {
        if (obj == 0) {
            return null;
        }
        if (cls.isPrimitive() || Number.class.isAssignableFrom(cls) || Boolean.class.isAssignableFrom(cls) || Character.class.isAssignableFrom(cls)) {
            return (T) zzc(obj, cls);
        }
        if (String.class.isAssignableFrom(cls)) {
            return (T) zzcf(obj);
        }
        if (cls.isArray()) {
            throw new DatabaseException("Converting to Arrays is not supported, please use Listsinstead");
        }
        if (cls.getTypeParameters().length <= 0) {
            return !cls.equals(Object.class) ? cls.isEnum() ? (T) zzd(obj, cls) : (T) zze(obj, cls) : obj;
        }
        String valueOf = String.valueOf(cls.getName());
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 75).append("Class ").append(valueOf).append(" has generic type parameters, please use GenericTypeIndicator instead").toString());
    }

    public static Object zzby(Object obj) {
        return zzbz(obj);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <T> Object zzbz(T t) {
        if (t == null) {
            return null;
        }
        if (t instanceof Number) {
            if (t instanceof Float) {
                return Double.valueOf(((Float) t).doubleValue());
            }
            if (t instanceof Short) {
                throw new DatabaseException("Shorts are not supported, please use int or long");
            }
            if (!(t instanceof Byte)) {
                return t;
            }
            throw new DatabaseException("Bytes are not supported, please use int or long");
        } else if ((t instanceof String) || (t instanceof Boolean)) {
            return t;
        } else {
            if (t instanceof Character) {
                throw new DatabaseException("Characters are not supported, please strings");
            }
            if (t instanceof Map) {
                HashMap hashMap = new HashMap();
                for (Map.Entry entry : ((Map) t).entrySet()) {
                    Object key = entry.getKey();
                    if (!(key instanceof String)) {
                        throw new DatabaseException("Maps with non-string keys are not supported");
                    }
                    hashMap.put((String) key, zzbz(entry.getValue()));
                }
                return hashMap;
            } else if (!(t instanceof Collection)) {
                if (t.getClass().isArray()) {
                    throw new DatabaseException("Serializing Arrays is not supported, please use Lists instead");
                }
                return t instanceof Enum ? ((Enum) t).name() : zzj(t.getClass()).zzch(t);
            } else if (!(t instanceof List)) {
                throw new DatabaseException("Serializing Collections is not supported, please use Lists instead");
            } else {
                List<Object> list = (List) t;
                ArrayList arrayList = new ArrayList(list.size());
                for (Object obj : list) {
                    arrayList.add(zzbz(obj));
                }
                return arrayList;
            }
        }
    }

    private static <T> T zzc(Object obj, Class<T> cls) {
        if (Integer.class.isAssignableFrom(cls) || Integer.TYPE.isAssignableFrom(cls)) {
            return (T) zzcb(obj);
        }
        if (Boolean.class.isAssignableFrom(cls) || Boolean.TYPE.isAssignableFrom(cls)) {
            return (T) zzce(obj);
        }
        if (Double.class.isAssignableFrom(cls) || Double.TYPE.isAssignableFrom(cls)) {
            return (T) zzcd(obj);
        }
        if (Long.class.isAssignableFrom(cls) || Long.TYPE.isAssignableFrom(cls)) {
            return (T) zzcc(obj);
        }
        if (Float.class.isAssignableFrom(cls) || Float.TYPE.isAssignableFrom(cls)) {
            return (T) Float.valueOf(zzcd(obj).floatValue());
        }
        if (Short.class.isAssignableFrom(cls) || Short.TYPE.isAssignableFrom(cls)) {
            throw new DatabaseException("Deserializing to shorts is not supported");
        }
        if (Byte.class.isAssignableFrom(cls) || Byte.TYPE.isAssignableFrom(cls)) {
            throw new DatabaseException("Deserializing to bytes is not supported");
        }
        if (Character.class.isAssignableFrom(cls) || Character.TYPE.isAssignableFrom(cls)) {
            throw new DatabaseException("Deserializing to char is not supported");
        }
        String valueOf = String.valueOf(cls);
        throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 24).append("Unknown primitive type: ").append(valueOf).toString());
    }

    private static Map<String, Object> zzca(Object obj) {
        if (obj instanceof Map) {
            return (Map) obj;
        }
        String valueOf = String.valueOf(obj.getClass());
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 46).append("Expected a Map while deserializing, but got a ").append(valueOf).toString());
    }

    private static Integer zzcb(Object obj) {
        if (obj instanceof Integer) {
            return (Integer) obj;
        }
        if (!(obj instanceof Long) && !(obj instanceof Double)) {
            String valueOf = String.valueOf(obj.getClass().getName());
            throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 41).append("Failed to convert a value of type ").append(valueOf).append(" to int").toString());
        }
        double doubleValue = ((Number) obj).doubleValue();
        if (doubleValue >= -2.147483648E9d && doubleValue <= 2.147483647E9d) {
            return Integer.valueOf(((Number) obj).intValue());
        }
        throw new DatabaseException(new StringBuilder(124).append("Numeric value out of 32-bit integer range: ").append(doubleValue).append(". Did you mean to use a long or double instead of an int?").toString());
    }

    private static Long zzcc(Object obj) {
        if (obj instanceof Integer) {
            return Long.valueOf(((Integer) obj).longValue());
        }
        if (obj instanceof Long) {
            return (Long) obj;
        }
        if (!(obj instanceof Double)) {
            String valueOf = String.valueOf(obj.getClass().getName());
            throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 42).append("Failed to convert a value of type ").append(valueOf).append(" to long").toString());
        }
        Double d = (Double) obj;
        if (d.doubleValue() >= -9.223372036854776E18d && d.doubleValue() <= 9.223372036854776E18d) {
            return Long.valueOf(d.longValue());
        }
        String valueOf2 = String.valueOf(d);
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf2).length() + 89).append("Numeric value out of 64-bit long range: ").append(valueOf2).append(". Did you mean to use a double instead of a long?").toString());
    }

    private static Double zzcd(Object obj) {
        if (obj instanceof Integer) {
            return Double.valueOf(((Integer) obj).doubleValue());
        }
        if (!(obj instanceof Long)) {
            if (obj instanceof Double) {
                return (Double) obj;
            }
            String valueOf = String.valueOf(obj.getClass().getName());
            throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 44).append("Failed to convert a value of type ").append(valueOf).append(" to double").toString());
        }
        Double valueOf2 = Double.valueOf(((Long) obj).doubleValue());
        if (valueOf2.longValue() == ((Long) obj).longValue()) {
            return valueOf2;
        }
        String valueOf3 = String.valueOf(obj);
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf3).length() + 97).append("Loss of precision while converting number to double: ").append(valueOf3).append(". Did you mean to use a 64-bit long instead?").toString());
    }

    private static Boolean zzce(Object obj) {
        if (obj instanceof Boolean) {
            return (Boolean) obj;
        }
        String valueOf = String.valueOf(obj.getClass().getName());
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 43).append("Failed to convert value of type ").append(valueOf).append(" to boolean").toString());
    }

    private static String zzcf(Object obj) {
        if (obj instanceof String) {
            return (String) obj;
        }
        String valueOf = String.valueOf(obj.getClass().getName());
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 42).append("Failed to convert value of type ").append(valueOf).append(" to String").toString());
    }

    public static Map<String, Object> zzcf(Map<String, Object> map) {
        Object zzbz = zzbz(map);
        zzann.zzcx(zzbz instanceof Map);
        return (Map) zzbz;
    }

    private static <T> T zzd(Object obj, Class<T> cls) {
        if (!(obj instanceof String)) {
            String valueOf = String.valueOf(cls);
            String valueOf2 = String.valueOf(obj.getClass());
            throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 57 + String.valueOf(valueOf2).length()).append("Expected a String while deserializing to enum ").append(valueOf).append(" but got a ").append(valueOf2).toString());
        }
        String str = (String) obj;
        try {
            return (T) Enum.valueOf(cls, str);
        } catch (IllegalArgumentException e) {
            String valueOf3 = String.valueOf(cls.getName());
            throw new DatabaseException(new StringBuilder(String.valueOf(valueOf3).length() + 42 + String.valueOf(str).length()).append("Could not find enum value of ").append(valueOf3).append(" for value \"").append(str).append("\"").toString());
        }
    }

    private static <T> T zze(Object obj, Class<T> cls) {
        zza zzj = zzj(cls);
        if (obj instanceof Map) {
            return (T) zzj.zzcg(zzca(obj));
        }
        String valueOf = String.valueOf(obj.getClass().getName());
        String valueOf2 = String.valueOf(cls.getName());
        throw new DatabaseException(new StringBuilder(String.valueOf(valueOf).length() + 38 + String.valueOf(valueOf2).length()).append("Can't convert object of type ").append(valueOf).append(" to type ").append(valueOf2).toString());
    }

    private static <T> zza<T> zzj(Class<T> cls) {
        zza<T> zzaVar = (zza<T>) bko.get(cls);
        if (zzaVar == null) {
            zza<T> zzaVar2 = new zza<>(cls);
            bko.put(cls, zzaVar2);
            return zzaVar2;
        }
        return zzaVar;
    }
}
