package com.vkontakte.android.api;

import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.net.HttpCookie;
/* loaded from: classes2.dex */
public class SerializableHttpCookie implements Serializable {
    private static final String TAG = SerializableHttpCookie.class.getSimpleName();
    private static final long serialVersionUID = 6374381323722046732L;
    private transient HttpCookie cookie;
    private Field fieldHttpOnly;

    public String encode(HttpCookie cookie) {
        this.cookie = cookie;
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ObjectOutputStream outputStream = new ObjectOutputStream(os);
            outputStream.writeObject(this);
            return byteArrayToHexString(os.toByteArray());
        } catch (IOException e) {
            Log.d(TAG, "IOException in encodeCookie", e);
            return null;
        }
    }

    public HttpCookie decode(String encodedCookie) {
        byte[] bytes = hexStringToByteArray(encodedCookie);
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        try {
            ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
            HttpCookie cookie = ((SerializableHttpCookie) objectInputStream.readObject()).cookie;
            return cookie;
        } catch (IOException e) {
            Log.d(TAG, "IOException in decodeCookie", e);
            return null;
        } catch (ClassNotFoundException e2) {
            Log.d(TAG, "ClassNotFoundException in decodeCookie", e2);
            return null;
        }
    }

    private boolean getHttpOnly() {
        try {
            initFieldHttpOnly();
            return ((Boolean) this.fieldHttpOnly.get(this.cookie)).booleanValue();
        } catch (Exception e) {
            Log.w(TAG, e);
            return false;
        }
    }

    private void setHttpOnly(boolean httpOnly) {
        try {
            initFieldHttpOnly();
            this.fieldHttpOnly.set(this.cookie, Boolean.valueOf(httpOnly));
        } catch (Exception e) {
            Log.w(TAG, e);
        }
    }

    private void initFieldHttpOnly() throws NoSuchFieldException {
        this.fieldHttpOnly = this.cookie.getClass().getDeclaredField("httpOnly");
        this.fieldHttpOnly.setAccessible(true);
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeObject(this.cookie.getName());
        out.writeObject(this.cookie.getValue());
        out.writeObject(this.cookie.getComment());
        out.writeObject(this.cookie.getCommentURL());
        out.writeObject(this.cookie.getDomain());
        out.writeLong(this.cookie.getMaxAge());
        out.writeObject(this.cookie.getPath());
        out.writeObject(this.cookie.getPortlist());
        out.writeInt(this.cookie.getVersion());
        out.writeBoolean(this.cookie.getSecure());
        out.writeBoolean(this.cookie.getDiscard());
        out.writeBoolean(getHttpOnly());
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        String name = (String) in.readObject();
        String value = (String) in.readObject();
        this.cookie = new HttpCookie(name, value);
        this.cookie.setComment((String) in.readObject());
        this.cookie.setCommentURL((String) in.readObject());
        this.cookie.setDomain((String) in.readObject());
        this.cookie.setMaxAge(in.readLong());
        this.cookie.setPath((String) in.readObject());
        this.cookie.setPortlist((String) in.readObject());
        this.cookie.setVersion(in.readInt());
        this.cookie.setSecure(in.readBoolean());
        this.cookie.setDiscard(in.readBoolean());
        setHttpOnly(in.readBoolean());
    }

    private String byteArrayToHexString(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        for (byte element : bytes) {
            int v = element & 255;
            if (v < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(v));
        }
        return sb.toString();
    }

    private byte[] hexStringToByteArray(String hexString) {
        int len = hexString.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hexString.charAt(i), 16) << 4) + Character.digit(hexString.charAt(i + 1), 16));
        }
        return data;
    }
}
