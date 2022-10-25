package com.vkontakte.android.orm;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes3.dex */
enum FieldType {
    primitiveBoolean,
    primitiveByte,
    primitiveShort,
    primitiveChar,
    primitiveInt,
    primitiveLong,
    primitiveFloat,
    primitiveDouble,
    primitiveBlob,
    Boolean,
    Byte,
    Short,
    Char,
    Integer,
    Long,
    Float,
    Double,
    String,
    Enum,
    Array,
    List,
    Map,
    JsonObject,
    JsonArray,
    Reference;

    static FieldType parse(Class<?> clazz) {
        if (clazz.isPrimitive()) {
            if (Boolean.TYPE.equals(clazz)) {
                return primitiveBoolean;
            }
            if (Byte.TYPE.equals(clazz)) {
                return primitiveByte;
            }
            if (Short.TYPE.equals(clazz)) {
                return primitiveShort;
            }
            if (Character.TYPE.equals(clazz)) {
                return primitiveChar;
            }
            if (Integer.TYPE.equals(clazz)) {
                return primitiveInt;
            }
            if (Long.TYPE.equals(clazz)) {
                return primitiveLong;
            }
            if (Float.TYPE.equals(clazz)) {
                return primitiveFloat;
            }
            if (Double.TYPE.equals(clazz)) {
                return primitiveDouble;
            }
            throw new RuntimeException("Expected primitive class, handle +" + clazz);
        } else if (clazz.equals(CharSequence.class) || clazz.equals(String.class)) {
            return String;
        } else {
            if (clazz.equals(byte[].class)) {
                return primitiveBlob;
            }
            if (clazz.isArray()) {
                return Array;
            }
            if (clazz.isEnum()) {
                return Enum;
            }
            if (clazz.equals(Boolean.class)) {
                return Boolean;
            }
            if (clazz.equals(Byte.class)) {
                return Byte;
            }
            if (clazz.equals(Short.class)) {
                return Short;
            }
            if (clazz.equals(Character.class)) {
                return Char;
            }
            if (clazz.equals(Integer.class)) {
                return Integer;
            }
            if (clazz.equals(Long.class)) {
                return Long;
            }
            if (clazz.equals(Float.class)) {
                return Float;
            }
            if (clazz.equals(Double.class)) {
                return Double;
            }
            if (clazz.equals(JSONObject.class)) {
                return JsonObject;
            }
            if (clazz.equals(JSONArray.class)) {
                return JsonArray;
            }
            if (clazz.equals(List.class) || clazz == ArrayList.class) {
                return List;
            }
            if (clazz.equals(Map.class) || clazz == HashMap.class) {
                return Map;
            }
            return Reference;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static FieldType parse(Field field) {
        return parse(field.getType());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getDefaultSQLType() {
        switch (this) {
            case primitiveBoolean:
            case Boolean:
            case primitiveByte:
            case Byte:
            case primitiveShort:
            case Short:
            case primitiveChar:
            case Char:
            case primitiveInt:
            case Integer:
            case primitiveLong:
            case Long:
                return "INTEGER";
            case primitiveFloat:
            case Float:
            case primitiveDouble:
            case Double:
                return "REAL";
            case Reference:
            case String:
            case Enum:
            case Array:
            case List:
            case Map:
            case JsonArray:
            case JsonObject:
                return "TEXT";
            case primitiveBlob:
                return "BLOB";
            default:
                throw new IllegalArgumentException("Unknown field type!");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void bind(String key, Field what, ContentValues to, @NonNull Object from) throws IllegalAccessException {
        String str = null;
        switch (this) {
            case primitiveBoolean:
            case Boolean:
                to.put(key, (Boolean) what.get(from));
                return;
            case primitiveByte:
            case Byte:
                to.put(key, (Byte) what.get(from));
                return;
            case primitiveShort:
            case Short:
                to.put(key, (Short) what.get(from));
                return;
            case primitiveChar:
            case Char:
                to.put(key, Integer.valueOf(((Character) what.get(from)).charValue()));
                return;
            case primitiveInt:
            case Integer:
                to.put(key, (Integer) what.get(from));
                return;
            case primitiveLong:
            case Long:
                to.put(key, (Long) what.get(from));
                return;
            case primitiveFloat:
            case Float:
                to.put(key, (Float) what.get(from));
                return;
            case primitiveDouble:
            case Double:
                to.put(key, (Double) what.get(from));
                return;
            case Reference:
            case String:
            case JsonArray:
            case JsonObject:
                Object value = what.get(from);
                if (value != null) {
                    str = value.toString();
                }
                to.put(key, str);
                return;
            case Enum:
                Enum anEnum = (Enum) what.get(from);
                to.put(key, anEnum == null ? null : anEnum.name());
                return;
            case Array:
                to.put(key, serializeArray(what.get(from), parse(what.getType().getComponentType())));
                return;
            case List:
                to.put(key, serializeList((List) what.get(from)));
                return;
            case Map:
                to.put(key, serializeMap((Map) what.get(from)));
                return;
            case primitiveBlob:
                to.put(key, (byte[]) what.get(from));
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void bind(int columnIndex, Field what, DatabaseUtils.InsertHelper to, @NonNull Object from) throws IllegalAccessException {
        int i = 1;
        String str = null;
        switch (this) {
            case primitiveBoolean:
                to.bind(columnIndex, what.getBoolean(from) ? 1 : 0);
                return;
            case Boolean:
                if (!((Boolean) what.get(from)).booleanValue()) {
                    i = 0;
                }
                to.bind(columnIndex, i);
                return;
            case primitiveByte:
                to.bind(columnIndex, (int) what.getByte(from));
                return;
            case Byte:
                to.bind(columnIndex, (int) ((Byte) what.get(from)).byteValue());
                return;
            case primitiveShort:
                to.bind(columnIndex, (int) what.getShort(from));
                return;
            case Short:
                to.bind(columnIndex, (int) ((Short) what.get(from)).shortValue());
                return;
            case primitiveChar:
                to.bind(columnIndex, (int) what.getChar(from));
                return;
            case Char:
                to.bind(columnIndex, (int) ((Character) what.get(from)).charValue());
                return;
            case primitiveInt:
                to.bind(columnIndex, what.getInt(from));
                return;
            case Integer:
                to.bind(columnIndex, ((Integer) what.get(from)).intValue());
                return;
            case primitiveLong:
                to.bind(columnIndex, what.getLong(from));
                return;
            case Long:
                to.bind(columnIndex, ((Long) what.get(from)).longValue());
                return;
            case primitiveFloat:
                to.bind(columnIndex, what.getFloat(from));
                return;
            case Float:
                to.bind(columnIndex, ((Float) what.get(from)).floatValue());
                return;
            case primitiveDouble:
                to.bind(columnIndex, what.getDouble(from));
                return;
            case Double:
                to.bind(columnIndex, ((Double) what.get(from)).doubleValue());
                return;
            case Reference:
            case String:
            case JsonArray:
            case JsonObject:
                Object value = what.get(from);
                if (value != null) {
                    str = String.valueOf(value);
                }
                to.bind(columnIndex, str);
                return;
            case Enum:
                Enum anEnum = (Enum) what.get(from);
                if (anEnum != null) {
                    str = anEnum.name();
                }
                to.bind(columnIndex, str);
                return;
            case Array:
                Object array = what.get(from);
                if (array != null) {
                    str = serializeArray(array, parse(array.getClass().getComponentType()));
                }
                to.bind(columnIndex, str);
                return;
            case List:
                to.bind(columnIndex, serializeList((List) what.get(from)));
                return;
            case Map:
                to.bind(columnIndex, serializeMap((Map) what.get(from)));
                return;
            case primitiveBlob:
                to.bind(columnIndex, (byte[]) what.get(from));
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void set(int columnIndex, Field what, Cursor from, Object to) throws IllegalAccessException {
        switch (this) {
            case primitiveBoolean:
                what.setBoolean(to, from.getInt(columnIndex) == 1);
                return;
            case Boolean:
                what.set(to, Boolean.valueOf(from.getInt(columnIndex) == 1));
                return;
            case primitiveByte:
                what.setByte(to, (byte) from.getInt(columnIndex));
                return;
            case Byte:
                what.set(to, Byte.valueOf((byte) from.getInt(columnIndex)));
                return;
            case primitiveShort:
                what.setShort(to, (short) from.getInt(columnIndex));
                return;
            case Short:
                what.set(to, Short.valueOf((short) from.getInt(columnIndex)));
                return;
            case primitiveChar:
                what.setChar(to, (char) from.getInt(columnIndex));
                return;
            case Char:
                what.set(to, Character.valueOf((char) from.getInt(columnIndex)));
                return;
            case primitiveInt:
                what.setInt(to, from.getInt(columnIndex));
                return;
            case Integer:
                what.set(to, Integer.valueOf(from.getInt(columnIndex)));
                return;
            case primitiveLong:
                what.setLong(to, from.getLong(columnIndex));
                return;
            case Long:
                what.set(to, Long.valueOf(from.getLong(columnIndex)));
                return;
            case primitiveFloat:
                what.setFloat(to, from.getFloat(columnIndex));
                return;
            case Float:
                what.set(to, Float.valueOf(from.getFloat(columnIndex)));
                return;
            case primitiveDouble:
                what.setDouble(to, from.getDouble(columnIndex));
                return;
            case Double:
                what.set(to, Double.valueOf(from.getDouble(columnIndex)));
                return;
            case Reference:
                break;
            case String:
                what.set(to, from.getString(columnIndex));
                return;
            case Enum:
                String name = from.getString(columnIndex);
                if (name != null) {
                    what.set(to, Enum.valueOf(what.getType(), name));
                    return;
                } else {
                    what.set(to, null);
                    return;
                }
            case Array:
                what.set(to, parseArray(from.getString(columnIndex), what.getType().getComponentType()));
                return;
            case List:
                ParameterizedType genericTypes = (ParameterizedType) what.getGenericType();
                Class<?> genericType = (Class) genericTypes.getActualTypeArguments()[0];
                what.set(to, parseList(from.getString(columnIndex), genericType, parse(genericType)));
                return;
            case Map:
                ParameterizedType genericTypes2 = (ParameterizedType) what.getGenericType();
                Type[] actualTypeArguments = genericTypes2.getActualTypeArguments();
                Class<?> keyClass = (Class) actualTypeArguments[0];
                FieldType keyType = parse(keyClass);
                Class<?> valueClass = (Class) actualTypeArguments[1];
                FieldType valueType = parse(valueClass);
                what.set(to, parseMap(from.getString(columnIndex), keyClass, valueClass, keyType, valueType));
                return;
            case JsonArray:
                try {
                    what.set(to, new JSONArray(from.getString(columnIndex)));
                    break;
                } catch (JSONException e) {
                    what.set(to, null);
                    break;
                }
            case JsonObject:
                try {
                    what.set(to, new JSONObject(from.getString(columnIndex)));
                    return;
                } catch (JSONException e2) {
                    what.set(to, null);
                    return;
                }
            case primitiveBlob:
                what.set(to, from.getBlob(columnIndex));
                return;
            default:
                return;
        }
        ORM.logD("Unsupported reference type " + what.getType());
    }

    @Nullable
    static String serializeArray(@Nullable Object array, FieldType type) throws IllegalAccessException {
        if (array == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int length = Array.getLength(array);
        for (int i = 0; i < length; i++) {
            if (i > 0) {
                sb.append(',');
            }
            switch (type) {
                case primitiveBoolean:
                    sb.append(((boolean[]) array)[i]);
                    break;
                case Boolean:
                case Byte:
                case Short:
                case Char:
                case Integer:
                case Long:
                case Float:
                case Double:
                    sb.append(((Object[]) array)[i]);
                    break;
                case primitiveByte:
                    sb.append((int) ((byte[]) array)[i]);
                    break;
                case primitiveShort:
                    sb.append((int) ((short[]) array)[i]);
                    break;
                case primitiveChar:
                    sb.append(((char[]) array)[i]);
                    break;
                case primitiveInt:
                    sb.append(((int[]) array)[i]);
                    break;
                case primitiveLong:
                    sb.append(((long[]) array)[i]);
                    break;
                case primitiveFloat:
                    sb.append(((float[]) array)[i]);
                    break;
                case primitiveDouble:
                    sb.append(((double[]) array)[i]);
                    break;
                case Reference:
                case String:
                    sb.append(escapeJava(String.valueOf(((Object[]) array)[i])));
                    break;
                case Enum:
                    sb.append(((Enum) ((Object[]) array)[i]).name());
                    break;
                default:
                    ORM.logE("Serialization for " + array.getClass() + " is not supported");
                    break;
            }
        }
        return sb.toString();
    }

    @Nullable
    static String serializeMap(@Nullable Map<?, ?> object) throws IllegalAccessException {
        if (object == null) {
            return null;
        }
        boolean firstTime = true;
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<?, ?> entry : object.entrySet()) {
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (firstTime) {
                firstTime = false;
            } else {
                sb.append(',');
            }
            sb.append(escapeJava(String.valueOf(key)));
            sb.append('=');
            sb.append(escapeJava(String.valueOf(value)));
        }
        return sb.toString();
    }

    @Nullable
    static String serializeList(@Nullable List<?> collection) throws IllegalAccessException {
        if (collection == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        boolean firstTime = true;
        for (Object entry : collection) {
            if (firstTime) {
                firstTime = false;
            } else {
                sb.append(',');
            }
            sb.append(escapeJava(String.valueOf(entry)));
        }
        return sb.toString();
    }

    @Nullable
    static Object parseArray(String data, Class<?> componentType) {
        if (data == null) {
            return null;
        }
        String[] sourceArray = TextUtils.split(data, ",");
        switch (parse(componentType)) {
            case primitiveBoolean:
                boolean[] array = new boolean[sourceArray.length];
                for (int i = 0; i < array.length; i++) {
                    array[i] = Boolean.parseBoolean(sourceArray[i]);
                }
                return array;
            case Boolean:
                Boolean[] array2 = new Boolean[sourceArray.length];
                for (int i2 = 0; i2 < array2.length; i2++) {
                    array2[i2] = Boolean.valueOf(sourceArray[i2]);
                }
                return array2;
            case primitiveByte:
                byte[] array3 = new byte[sourceArray.length];
                for (int i3 = 0; i3 < array3.length; i3++) {
                    array3[i3] = Byte.parseByte(sourceArray[i3]);
                }
                return array3;
            case Byte:
                Byte[] array4 = new Byte[sourceArray.length];
                for (int i4 = 0; i4 < array4.length; i4++) {
                    array4[i4] = Byte.valueOf(sourceArray[i4]);
                }
                return array4;
            case primitiveShort:
                short[] array5 = new short[sourceArray.length];
                for (int i5 = 0; i5 < array5.length; i5++) {
                    array5[i5] = Short.parseShort(sourceArray[i5]);
                }
                return array5;
            case Short:
                Short[] array6 = new Short[sourceArray.length];
                for (int i6 = 0; i6 < array6.length; i6++) {
                    array6[i6] = Short.valueOf(sourceArray[i6]);
                }
                return array6;
            case primitiveChar:
                char[] array7 = new char[sourceArray.length];
                for (int i7 = 0; i7 < array7.length; i7++) {
                    array7[i7] = sourceArray[i7].charAt(0);
                }
                return array7;
            case Char:
                Character[] array8 = new Character[sourceArray.length];
                for (int i8 = 0; i8 < array8.length; i8++) {
                    array8[i8] = Character.valueOf(sourceArray[i8].charAt(0));
                }
                return array8;
            case primitiveInt:
                int[] array9 = new int[sourceArray.length];
                for (int i9 = 0; i9 < array9.length; i9++) {
                    array9[i9] = Integer.parseInt(sourceArray[i9]);
                }
                return array9;
            case Integer:
                Integer[] array10 = new Integer[sourceArray.length];
                for (int i10 = 0; i10 < array10.length; i10++) {
                    array10[i10] = Integer.valueOf(sourceArray[i10]);
                }
                return array10;
            case primitiveLong:
                long[] array11 = new long[sourceArray.length];
                for (int i11 = 0; i11 < array11.length; i11++) {
                    array11[i11] = Long.parseLong(sourceArray[i11]);
                }
                return array11;
            case Long:
                Long[] array12 = new Long[sourceArray.length];
                for (int i12 = 0; i12 < array12.length; i12++) {
                    array12[i12] = Long.valueOf(sourceArray[i12]);
                }
                return array12;
            case primitiveFloat:
                float[] array13 = new float[sourceArray.length];
                for (int i13 = 0; i13 < array13.length; i13++) {
                    array13[i13] = Float.parseFloat(sourceArray[i13]);
                }
                return array13;
            case Float:
                Float[] array14 = new Float[sourceArray.length];
                for (int i14 = 0; i14 < array14.length; i14++) {
                    array14[i14] = Float.valueOf(sourceArray[i14]);
                }
                return array14;
            case primitiveDouble:
                double[] array15 = new double[sourceArray.length];
                for (int i15 = 0; i15 < array15.length; i15++) {
                    array15[i15] = Double.parseDouble(sourceArray[i15]);
                }
                return array15;
            case Double:
                Double[] array16 = new Double[sourceArray.length];
                for (int i16 = 0; i16 < array16.length; i16++) {
                    array16[i16] = Double.valueOf(sourceArray[i16]);
                }
                return array16;
            case Reference:
            default:
                ORM.logE("Deserialization for array of " + componentType + " is not supported");
                throw new IllegalArgumentException();
            case String:
                for (int i17 = 0; i17 < sourceArray.length; i17++) {
                    sourceArray[i17] = unescapeJava(sourceArray[i17]);
                }
                return sourceArray;
            case Enum:
                Object[] array17 = (Object[]) Array.newInstance(componentType, sourceArray.length);
                for (int i18 = 0; i18 < array17.length; i18++) {
                    array17[i18] = Enum.valueOf(componentType, sourceArray[i18]);
                }
                return array17;
        }
    }

    @Nullable
    static ArrayList parseList(String data, Class genericType, FieldType type) {
        if (data == null) {
            return null;
        }
        String[] sourceArray = data.split("(?<!\\\\),");
        ArrayList result = new ArrayList(sourceArray.length);
        for (String source : sourceArray) {
            result.add(parse(unescapeJava(source), genericType, type));
        }
        return result;
    }

    @Nullable
    static HashMap parseMap(String data, Class keyClass, Class valueClass, FieldType keyType, FieldType valueType) {
        if (data == null) {
            return null;
        }
        String[] sourceArray = data.split("(?<!\\\\),");
        HashMap result = new HashMap(sourceArray.length);
        for (String source : sourceArray) {
            String[] entry = source.split("(?<!\\\\)=");
            Object key = parse(unescapeJava(entry[0]), keyClass, keyType);
            Object value = parse(unescapeJava(entry[1]), keyClass, valueType);
            result.put(key, value);
        }
        return result;
    }

    static Object parse(String source, Class clazz, FieldType type) {
        switch (type) {
            case Boolean:
                return Boolean.valueOf(source);
            case primitiveByte:
            case primitiveShort:
            case primitiveChar:
            case primitiveInt:
            case primitiveLong:
            case primitiveFloat:
            case primitiveDouble:
            case Reference:
            default:
                throw new IllegalArgumentException();
            case Byte:
                return Byte.valueOf(source);
            case Short:
                return Short.valueOf(source);
            case Char:
                return Character.valueOf(source.charAt(0));
            case Integer:
                return Integer.valueOf(source);
            case Long:
                return Long.valueOf(source);
            case Float:
                return Float.valueOf(source);
            case Double:
                return Double.valueOf(source);
            case String:
                return source;
            case Enum:
                return Enum.valueOf(clazz, source);
        }
    }

    @NonNull
    static String escapeJava(@NonNull String string) {
        return escapeJava(new StringBuilder(string)).toString();
    }

    @NonNull
    static String unescapeJava(@NonNull String string) {
        return unescapeJava(new StringBuilder(string)).toString();
    }

    @NonNull
    static StringBuilder escapeJava(@NonNull StringBuilder sb) {
        int i;
        int sz = sb.length();
        int i2 = 0;
        while (i2 < sz) {
            char ch = sb.charAt(i2);
            switch (ch) {
                case ',':
                    i = i2 + 1;
                    sb.setCharAt(i2, '\\');
                    sz++;
                    sb.insert(i, ',');
                    break;
                case '=':
                    i = i2 + 1;
                    sb.setCharAt(i2, '\\');
                    sz++;
                    sb.insert(i, '=');
                    break;
                case '\\':
                    i = i2 + 1;
                    sb.setCharAt(i2, '\\');
                    sz++;
                    sb.insert(i, '\\');
                    break;
                default:
                    i = i2;
                    break;
            }
            i2 = i + 1;
        }
        return sb;
    }

    static StringBuilder unescapeJava(@NonNull StringBuilder sb) {
        int sz = sb.length();
        boolean hadSlash = false;
        int i = 0;
        while (i < sz) {
            char ch = sb.charAt(i);
            if (hadSlash) {
                hadSlash = false;
                switch (ch) {
                    case ',':
                        i--;
                        sb.deleteCharAt(i);
                        sz--;
                        sb.setCharAt(i, ',');
                        continue;
                    case '=':
                        i--;
                        sb.deleteCharAt(i);
                        sz--;
                        sb.setCharAt(i, '=');
                        continue;
                    case '\\':
                        i--;
                        sb.deleteCharAt(i);
                        sz--;
                        sb.setCharAt(i, '\\');
                        continue;
                }
            } else if (ch == '\\') {
                hadSlash = true;
            }
            i++;
        }
        if (hadSlash) {
            sb.append('\\');
        }
        return sb;
    }
}
