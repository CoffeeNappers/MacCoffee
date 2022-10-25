package com.google.android.youtube.player.internal;

import android.os.IBinder;
import com.google.android.youtube.player.internal.u;
import java.lang.reflect.Field;
/* loaded from: classes2.dex */
public final class v<T> extends u.a {
    private final T a;

    private v(T t) {
        this.a = t;
    }

    public static <T> u a(T t) {
        return new v(t);
    }

    public static <T> T a(u uVar) {
        if (uVar instanceof v) {
            return ((v) uVar).a;
        }
        IBinder asBinder = uVar.asBinder();
        Field[] declaredFields = asBinder.getClass().getDeclaredFields();
        if (declaredFields.length != 1) {
            throw new IllegalArgumentException("The concrete class implementing IObjectWrapper must have exactly *one* declared private field for the wrapped object.  Preferably, this is an instance of the ObjectWrapper<T> class.");
        }
        Field field = declaredFields[0];
        if (field.isAccessible()) {
            throw new IllegalArgumentException("The concrete class implementing IObjectWrapper must have exactly one declared *private* field for the wrapped object. Preferably, this is an instance of the ObjectWrapper<T> class.");
        }
        field.setAccessible(true);
        try {
            return (T) field.get(asBinder);
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException("Could not access the field in remoteBinder.", e);
        } catch (IllegalArgumentException e2) {
            throw new IllegalArgumentException("remoteBinder is the wrong class.", e2);
        } catch (NullPointerException e3) {
            throw new IllegalArgumentException("Binder object is null.", e3);
        }
    }
}
