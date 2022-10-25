package com.vk.core.network.cookies.persistence;

import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import okhttp3.Cookie;
/* loaded from: classes2.dex */
public class SerializableCookie implements Serializable {
    private static final long serialVersionUID = -8594045714036645534L;
    private transient Cookie cookie;
    private static final String TAG = SerializableCookie.class.getSimpleName();
    private static long NON_VALID_EXPIRES_AT = -1;

    public String encode(Cookie cookie) {
        ObjectOutputStream objectOutputStream;
        this.cookie = cookie;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ObjectOutputStream objectOutputStream2 = null;
        try {
            try {
                objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            } catch (IOException e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            objectOutputStream.writeObject(this);
            if (objectOutputStream != null) {
                try {
                    objectOutputStream.close();
                } catch (IOException e2) {
                    Log.d(TAG, "Stream not closed in encodeCookie", e2);
                }
            }
            return byteArrayToHexString(byteArrayOutputStream.toByteArray());
        } catch (IOException e3) {
            e = e3;
            objectOutputStream2 = objectOutputStream;
            Log.d(TAG, "IOException in encodeCookie", e);
            if (objectOutputStream2 == null) {
                return null;
            }
            try {
                objectOutputStream2.close();
                return null;
            } catch (IOException e4) {
                Log.d(TAG, "Stream not closed in encodeCookie", e4);
                return null;
            }
        } catch (Throwable th2) {
            th = th2;
            objectOutputStream2 = objectOutputStream;
            if (objectOutputStream2 != null) {
                try {
                    objectOutputStream2.close();
                } catch (IOException e5) {
                    Log.d(TAG, "Stream not closed in encodeCookie", e5);
                }
            }
            throw th;
        }
    }

    private static String byteArrayToHexString(byte[] bytes) {
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

    public Cookie decode(String encodedCookie) {
        ObjectInputStream objectInputStream;
        byte[] bytes = hexStringToByteArray(encodedCookie);
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
        Cookie cookie = null;
        ObjectInputStream objectInputStream2 = null;
        try {
            try {
                objectInputStream = new ObjectInputStream(byteArrayInputStream);
            } catch (Throwable th) {
                th = th;
            }
        } catch (IOException e) {
            e = e;
        } catch (ClassNotFoundException e2) {
            e = e2;
        }
        try {
            cookie = ((SerializableCookie) objectInputStream.readObject()).cookie;
            if (objectInputStream != null) {
                try {
                    objectInputStream.close();
                    objectInputStream2 = objectInputStream;
                } catch (IOException e3) {
                    Log.d(TAG, "Stream not closed in decodeCookie", e3);
                    objectInputStream2 = objectInputStream;
                }
            } else {
                objectInputStream2 = objectInputStream;
            }
        } catch (IOException e4) {
            e = e4;
            objectInputStream2 = objectInputStream;
            Log.d(TAG, "IOException in decodeCookie", e);
            if (objectInputStream2 != null) {
                try {
                    objectInputStream2.close();
                } catch (IOException e5) {
                    Log.d(TAG, "Stream not closed in decodeCookie", e5);
                }
            }
            return cookie;
        } catch (ClassNotFoundException e6) {
            e = e6;
            objectInputStream2 = objectInputStream;
            Log.d(TAG, "ClassNotFoundException in decodeCookie", e);
            if (objectInputStream2 != null) {
                try {
                    objectInputStream2.close();
                } catch (IOException e7) {
                    Log.d(TAG, "Stream not closed in decodeCookie", e7);
                }
            }
            return cookie;
        } catch (Throwable th2) {
            th = th2;
            objectInputStream2 = objectInputStream;
            if (objectInputStream2 != null) {
                try {
                    objectInputStream2.close();
                } catch (IOException e8) {
                    Log.d(TAG, "Stream not closed in decodeCookie", e8);
                }
            }
            throw th;
        }
        return cookie;
    }

    private static byte[] hexStringToByteArray(String hexString) {
        int len = hexString.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hexString.charAt(i), 16) << 4) + Character.digit(hexString.charAt(i + 1), 16));
        }
        return data;
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeObject(this.cookie.name());
        out.writeObject(this.cookie.value());
        out.writeLong(this.cookie.persistent() ? this.cookie.expiresAt() : NON_VALID_EXPIRES_AT);
        out.writeObject(this.cookie.domain());
        out.writeObject(this.cookie.path());
        out.writeBoolean(this.cookie.secure());
        out.writeBoolean(this.cookie.httpOnly());
        out.writeBoolean(this.cookie.hostOnly());
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        Cookie.Builder builder = new Cookie.Builder();
        builder.name((String) in.readObject());
        builder.value((String) in.readObject());
        long expiresAt = in.readLong();
        if (expiresAt != NON_VALID_EXPIRES_AT) {
            builder.expiresAt(expiresAt);
        }
        String domain = (String) in.readObject();
        builder.domain(domain);
        builder.path((String) in.readObject());
        if (in.readBoolean()) {
            builder.secure();
        }
        if (in.readBoolean()) {
            builder.httpOnly();
        }
        if (in.readBoolean()) {
            builder.hostOnlyDomain(domain);
        }
        this.cookie = builder.build();
    }
}
