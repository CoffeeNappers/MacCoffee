package com.my.target.core.net.cookie;

import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.net.HttpCookie;
/* compiled from: SerializableHttpCookie.java */
/* loaded from: classes2.dex */
public class c implements Serializable {
    private static final String a = c.class.getSimpleName();
    private static final long serialVersionUID = 6374381323722046732L;
    private transient HttpCookie b;
    private Field c;

    public final String a(HttpCookie httpCookie) {
        this.b = httpCookie;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            new ObjectOutputStream(byteArrayOutputStream).writeObject(this);
            return a(byteArrayOutputStream.toByteArray());
        } catch (IOException e) {
            return null;
        }
    }

    private boolean a() {
        try {
            b();
            return ((Boolean) this.c.get(this.b)).booleanValue();
        } catch (Exception e) {
            return false;
        }
    }

    private void b() throws NoSuchFieldException {
        this.c = this.b.getClass().getDeclaredField("httpOnly");
        this.c.setAccessible(true);
    }

    private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.writeObject(this.b.getName());
        objectOutputStream.writeObject(this.b.getValue());
        objectOutputStream.writeObject(this.b.getComment());
        objectOutputStream.writeObject(this.b.getCommentURL());
        objectOutputStream.writeObject(this.b.getDomain());
        objectOutputStream.writeLong(this.b.getMaxAge());
        objectOutputStream.writeObject(this.b.getPath());
        objectOutputStream.writeObject(this.b.getPortlist());
        objectOutputStream.writeInt(this.b.getVersion());
        objectOutputStream.writeBoolean(this.b.getSecure());
        objectOutputStream.writeBoolean(this.b.getDiscard());
        objectOutputStream.writeBoolean(a());
    }

    private void readObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        this.b = new HttpCookie((String) objectInputStream.readObject(), (String) objectInputStream.readObject());
        this.b.setComment((String) objectInputStream.readObject());
        this.b.setCommentURL((String) objectInputStream.readObject());
        this.b.setDomain((String) objectInputStream.readObject());
        this.b.setMaxAge(objectInputStream.readLong());
        this.b.setPath((String) objectInputStream.readObject());
        this.b.setPortlist((String) objectInputStream.readObject());
        this.b.setVersion(objectInputStream.readInt());
        this.b.setSecure(objectInputStream.readBoolean());
        this.b.setDiscard(objectInputStream.readBoolean());
        boolean readBoolean = objectInputStream.readBoolean();
        try {
            b();
            this.c.set(this.b, Boolean.valueOf(readBoolean));
        } catch (Exception e) {
        }
    }

    private static String a(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (byte b : bArr) {
            int i = b & 255;
            if (i < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(i));
        }
        return sb.toString();
    }

    public static HttpCookie a(String str) {
        int length = str.length();
        byte[] bArr = new byte[length / 2];
        for (int i = 0; i < length; i += 2) {
            bArr[i / 2] = (byte) ((Character.digit(str.charAt(i), 16) << 4) + Character.digit(str.charAt(i + 1), 16));
        }
        try {
            return ((c) new ObjectInputStream(new ByteArrayInputStream(bArr)).readObject()).b;
        } catch (IOException e) {
            Log.d(a, "IOException in decodeCookie", e);
            return null;
        } catch (ClassNotFoundException e2) {
            return null;
        }
    }
}
