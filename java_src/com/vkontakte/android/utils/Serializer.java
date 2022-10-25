package com.vkontakte.android.utils;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.vkontakte.android.Log;
import com.vkontakte.android.utils.JSONSerializable;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public abstract class Serializer {
    private static final HashMap<ClassLoader, HashMap<String, Creator<?>>> mCreators = new HashMap<>();

    /* loaded from: classes.dex */
    public interface Creator<T> extends Parcelable.Creator<T> {
        /* renamed from: createFromSerializer */
        T mo1087createFromSerializer(Serializer serializer);

        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        T[] mo1088newArray(int i);
    }

    /* loaded from: classes.dex */
    public interface Serializable extends Parcelable {
        void serializeTo(Serializer serializer);
    }

    @Nullable
    public abstract Bundle readBundle(ClassLoader classLoader);

    public abstract byte readByte();

    public abstract char readChar();

    public abstract double readDouble();

    public abstract float readFloat();

    public abstract int readInt();

    public abstract <T extends java.io.Serializable> T readJavaSerializable();

    public abstract long readLong();

    @Nullable
    public abstract String readString();

    public abstract void writeBundle(@Nullable Bundle bundle);

    public abstract void writeByte(byte b);

    public abstract void writeChar(char c);

    public abstract void writeDouble(double d);

    public abstract void writeFloat(float f);

    public abstract void writeInt(int i);

    public abstract void writeJavaSerializable(@Nullable java.io.Serializable serializable);

    public abstract void writeLong(long j);

    public abstract void writeString(@Nullable String str);

    /* loaded from: classes.dex */
    public static abstract class CreatorAdapter<T> implements Parcelable.Creator<T>, Creator<T> {
        @Override // android.os.Parcelable.Creator
        public final T createFromParcel(Parcel source) {
            return mo1087createFromSerializer(Serializer.get(source));
        }
    }

    /* loaded from: classes.dex */
    public static abstract class SerializableAdapter implements Parcelable, Serializable {
        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            try {
                serializeTo(Serializer.get(dest));
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        }
    }

    public void writeSerializable(@Nullable Serializable v) {
        if (v == null) {
            writeString(null);
            return;
        }
        writeString(v.getClass().getName());
        v.serializeTo(this);
    }

    public void writeStringArray(@Nullable String[] v) {
        if (v == null) {
            writeInt(-1);
            return;
        }
        writeInt(v.length);
        for (String s : v) {
            writeString(s);
        }
    }

    public void writeByteArray(@Nullable byte[] v) {
        if (v == null) {
            writeInt(-1);
            return;
        }
        writeInt(v.length);
        for (byte b : v) {
            writeByte(b);
        }
    }

    public final <T extends Serializable> void writeTypedArray(T[] val) {
        if (val != null) {
            int N = val.length;
            writeInt(N);
            for (T item : val) {
                if (item != null) {
                    writeInt(1);
                    item.serializeTo(this);
                } else {
                    writeInt(0);
                }
            }
            return;
        }
        writeInt(-1);
    }

    public final <T extends Serializable> void writeTypedList(List<T> val) {
        if (val == null) {
            writeInt(-1);
            return;
        }
        int N = val.size();
        writeInt(N);
        for (int i = 0; i < N; i++) {
            T item = val.get(i);
            if (item != null) {
                writeInt(1);
                item.serializeTo(this);
            } else {
                writeInt(0);
            }
        }
    }

    @Nullable
    public final <T extends Serializable> T readSerializable(ClassLoader loader) {
        Creator<?> creator = readSerializerCreator(loader);
        if (creator == null) {
            return null;
        }
        return (T) creator.mo1087createFromSerializer(this);
    }

    @Nullable
    public String[] createStringArray() {
        int length = readInt();
        if (length < 0) {
            return null;
        }
        String[] strings = new String[length];
        for (int i = 0; i < length; i++) {
            strings[i] = readString();
        }
        return strings;
    }

    @Nullable
    public byte[] createByteArray() {
        int length = readInt();
        if (length < 0) {
            return null;
        }
        byte[] bytes = new byte[length];
        for (int i = 0; i < length; i++) {
            bytes[i] = readByte();
        }
        return bytes;
    }

    public final <T> T[] createTypedArray(Creator<T> c) {
        int N = readInt();
        if (N < 0) {
            return null;
        }
        T[] l = c.mo1088newArray(N);
        for (int i = 0; i < N; i++) {
            if (readInt() != 0) {
                l[i] = c.mo1087createFromSerializer(this);
            }
        }
        return l;
    }

    public final <T> ArrayList<T> createTypedArrayList(Creator<T> c) {
        int N = readInt();
        if (N < 0) {
            return null;
        }
        ArrayList<T> l = new ArrayList<>(N);
        while (N > 0) {
            if (readInt() != 0) {
                l.add(c.mo1087createFromSerializer(this));
            } else {
                l.add(null);
            }
            N--;
        }
        return l;
    }

    /* loaded from: classes.dex */
    public static class BadSerializableException extends RuntimeException {
        public BadSerializableException(String detailMessage) {
            super(detailMessage);
        }
    }

    private Creator<?> readSerializerCreator(ClassLoader loader) {
        ClassLoader serializableClassLoader;
        Creator<?> creator = null;
        String name = readString();
        if (name != null) {
            synchronized (mCreators) {
                HashMap<String, Creator<?>> map = mCreators.get(loader);
                if (map == null) {
                    map = new HashMap<>();
                    mCreators.put(loader, map);
                }
                creator = map.get(name);
                if (creator == null) {
                    if (loader == null) {
                        try {
                            try {
                                try {
                                    serializableClassLoader = getClass().getClassLoader();
                                } catch (NoSuchFieldException e) {
                                    throw new BadSerializableException("Serializer.Serializable protocol requires a Serializer.Creator object called CREATOR on class " + name);
                                }
                            } catch (ClassNotFoundException e2) {
                                L.e("Class not found when unmarshalling: " + name, e2);
                                throw new BadSerializableException("ClassNotFoundException when unmarshalling: " + name);
                            }
                        } catch (IllegalAccessException e3) {
                            L.e("Illegal access when unmarshalling: " + name, e3);
                            throw new BadSerializableException("IllegalAccessException when unmarshalling: " + name);
                        }
                    } else {
                        serializableClassLoader = loader;
                    }
                    Class<?> serializableClass = Class.forName(name, false, serializableClassLoader);
                    if (!Serializable.class.isAssignableFrom(serializableClass)) {
                        throw new BadSerializableException("Serializer.Serializable protocol requires that the class implements Serializer.Serializable");
                    }
                    Field f = serializableClass.getField("CREATOR");
                    if ((f.getModifiers() & 8) == 0) {
                        throw new BadSerializableException("Serializer.Serializable protocol requires the CREATOR object to be static on class " + name);
                    }
                    Class<?> creatorType = f.getType();
                    if (!Creator.class.isAssignableFrom(creatorType)) {
                        throw new BadSerializableException("Serializer.Serializable protocol requires a Serializer.Creator object called CREATOR on class " + name);
                    }
                    creator = (Creator) f.get(null);
                    if (creator == null) {
                        throw new BadSerializableException("Serializer.Serializable protocol requires a non-null Serializer.Creator object called CREATOR on class " + name);
                    }
                    map.put(name, creator);
                }
            }
        }
        return creator;
    }

    public static Serializer get(Parcel parcel) {
        return new ParcelSerializer(parcel);
    }

    public static Serializer get(DataOutput dataOutput) {
        return new DataOutputSerializer(dataOutput);
    }

    public static Serializer get(DataInput dataInput) {
        return new DataInputSerializer(dataInput);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class ParcelSerializer extends Serializer {
        final Parcel parcel;

        ParcelSerializer(Parcel parcel) {
            this.parcel = parcel;
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeByte(byte v) {
            this.parcel.writeByte(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeChar(char v) {
            this.parcel.writeInt(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeInt(int v) {
            this.parcel.writeInt(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeLong(long v) {
            this.parcel.writeLong(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeFloat(float v) {
            this.parcel.writeFloat(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeDouble(double v) {
            this.parcel.writeDouble(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeString(@Nullable String v) {
            this.parcel.writeString(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeBundle(@Nullable Bundle v) {
            this.parcel.writeBundle(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeJavaSerializable(@Nullable java.io.Serializable v) {
            this.parcel.writeSerializable(v);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public byte readByte() {
            return this.parcel.readByte();
        }

        @Override // com.vkontakte.android.utils.Serializer
        public char readChar() {
            return (char) this.parcel.readInt();
        }

        @Override // com.vkontakte.android.utils.Serializer
        public int readInt() {
            return this.parcel.readInt();
        }

        @Override // com.vkontakte.android.utils.Serializer
        public long readLong() {
            return this.parcel.readLong();
        }

        @Override // com.vkontakte.android.utils.Serializer
        public double readDouble() {
            return this.parcel.readDouble();
        }

        @Override // com.vkontakte.android.utils.Serializer
        public float readFloat() {
            return this.parcel.readFloat();
        }

        @Override // com.vkontakte.android.utils.Serializer
        @Nullable
        public String readString() {
            return this.parcel.readString();
        }

        @Override // com.vkontakte.android.utils.Serializer
        @Nullable
        public Bundle readBundle(ClassLoader loader) {
            return this.parcel.readBundle(loader);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public <T extends java.io.Serializable> T readJavaSerializable() {
            return (T) this.parcel.readSerializable();
        }
    }

    /* loaded from: classes.dex */
    private static class DataOutputSerializer extends Serializer {
        static final String ERROR_TEXT = "Don't use DataOutput for read values";
        final DataOutput dataOutput;

        DataOutputSerializer(DataOutput dataOutput) {
            this.dataOutput = dataOutput;
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeByte(byte v) {
            try {
                this.dataOutput.writeByte(v);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeChar(char v) {
            try {
                this.dataOutput.writeChar(v);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeInt(int v) {
            try {
                this.dataOutput.writeInt(v);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeLong(long v) {
            try {
                this.dataOutput.writeLong(v);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeFloat(float v) {
            try {
                this.dataOutput.writeFloat(v);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeDouble(double v) {
            try {
                this.dataOutput.writeDouble(v);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeString(@Nullable String v) {
            try {
                if (v == null) {
                    this.dataOutput.writeInt(-1);
                    return;
                }
                this.dataOutput.writeInt(v.length());
                this.dataOutput.writeUTF(v);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeBundle(@Nullable Bundle v) {
            writeString(Serializer.serializeExtras(v));
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeJavaSerializable(@Nullable java.io.Serializable v) {
            try {
                byte[] bytes = Serializer.serializeJavaSerializable(v);
                if (bytes == null) {
                    this.dataOutput.writeInt(-1);
                    return;
                }
                this.dataOutput.writeInt(bytes.length);
                this.dataOutput.write(bytes);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public byte readByte() {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public char readChar() {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public int readInt() {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public long readLong() {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public double readDouble() {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public float readFloat() {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        @Nullable
        public String readString() {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        @Nullable
        public Bundle readBundle(ClassLoader loader) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public <T extends java.io.Serializable> T readJavaSerializable() {
            throw new RuntimeException(ERROR_TEXT);
        }
    }

    /* loaded from: classes.dex */
    private static class DataInputSerializer extends Serializer {
        static final String ERROR_TEXT = "Don't use DataInput for write values";
        final DataInput dataInput;

        DataInputSerializer(DataInput dataInput) {
            this.dataInput = dataInput;
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeByte(byte v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeChar(char v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeInt(int v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeLong(long v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeFloat(float v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeDouble(double v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeString(@Nullable String v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeBundle(@Nullable Bundle v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public void writeJavaSerializable(@Nullable java.io.Serializable v) {
            throw new RuntimeException(ERROR_TEXT);
        }

        @Override // com.vkontakte.android.utils.Serializer
        public byte readByte() {
            try {
                return this.dataInput.readByte();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public char readChar() {
            try {
                return this.dataInput.readChar();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public int readInt() {
            try {
                return this.dataInput.readInt();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public long readLong() {
            try {
                return this.dataInput.readLong();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public double readDouble() {
            try {
                return this.dataInput.readDouble();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        public float readFloat() {
            try {
                return this.dataInput.readFloat();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        @Nullable
        public String readString() {
            try {
                int len = this.dataInput.readInt();
                if (len >= 0) {
                    return this.dataInput.readUTF();
                }
                return null;
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        @Override // com.vkontakte.android.utils.Serializer
        @Nullable
        public Bundle readBundle(ClassLoader loader) {
            return Serializer.deserializeExtras(readString());
        }

        @Override // com.vkontakte.android.utils.Serializer
        public <T extends java.io.Serializable> T readJavaSerializable() {
            try {
                int len = this.dataInput.readInt();
                if (len < 0) {
                    return null;
                }
                byte[] bytes = new byte[len];
                this.dataInput.readFully(bytes);
                return (T) Serializer.deserializeJavaSerializable(bytes);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] serializeJavaSerializable(java.io.Serializable obj) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        new ObjectOutputStream(out).writeObject(obj);
        return out.toByteArray();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static java.io.Serializable deserializeJavaSerializable(byte[] data) throws IOException, ClassNotFoundException {
        return (java.io.Serializable) new ObjectInputStream(new ByteArrayInputStream(data)).readObject();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Nullable
    public static String serializeExtras(Bundle extra) {
        if (extra == null) {
            return null;
        }
        if (extra.size() == 0) {
            return "";
        }
        try {
            JSONObject obj = new JSONObject();
            Set<String> keys = extra.keySet();
            for (String k : keys) {
                Object o = extra.get(k);
                if (o instanceof JSONSerializable) {
                    obj.put(k, JSONSerializable.Factory.to((JSONSerializable) o));
                } else {
                    obj.put(k, o);
                }
            }
            return obj.toString();
        } catch (JSONException x) {
            Log.w("vk", x);
            return "";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Bundle deserializeExtras(String extraStr) {
        if (extraStr == null) {
            return null;
        }
        Bundle extra = new Bundle();
        if (extraStr.length() > 0) {
            try {
                JSONObject obj = new JSONObject(extraStr);
                Iterator<String> keys = obj.keys();
                while (keys.hasNext()) {
                    String k = keys.next();
                    Object o = obj.get(k);
                    if (o instanceof Integer) {
                        extra.putInt(k, ((Integer) o).intValue());
                    } else if (o instanceof Boolean) {
                        extra.putBoolean(k, ((Boolean) o).booleanValue());
                    } else if (o instanceof JSONObject) {
                        extra.putParcelable(k, JSONSerializable.Factory.from((JSONObject) o));
                    } else {
                        extra.putString(k, (String) o);
                    }
                }
                return extra;
            } catch (JSONException x) {
                L.e(x, new Object[0]);
                return extra;
            }
        }
        return extra;
    }
}
