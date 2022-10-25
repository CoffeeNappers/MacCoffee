package ru.mail.libverify.utils.permissions;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.util.LongSparseArray;
import com.facebook.internal.NativeProtocol;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;
@TargetApi(16)
/* loaded from: classes3.dex */
public class a {
    private static AtomicInteger a = new AtomicInteger(0);
    private static LongSparseArray<InterfaceC0287a> b = new LongSparseArray<>();

    /* renamed from: ru.mail.libverify.utils.permissions.a$a  reason: collision with other inner class name */
    /* loaded from: classes3.dex */
    public interface InterfaceC0287a {
        void a(String str);

        void a(boolean z);

        void b(String str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(int i, String[] strArr, int[] iArr) {
        InterfaceC0287a interfaceC0287a;
        boolean z = false;
        synchronized (a.class) {
            interfaceC0287a = b.get(i);
            if (interfaceC0287a != null) {
                b.remove(i);
            }
        }
        if (interfaceC0287a != null) {
            int i2 = 0;
            for (int i3 = 0; i3 < strArr.length; i3++) {
                if (iArr[i3] == 0) {
                    interfaceC0287a.a(strArr[i3]);
                    i2++;
                } else {
                    interfaceC0287a.b(strArr[i3]);
                }
            }
            if (i2 == strArr.length) {
                z = true;
            }
            interfaceC0287a.a(z);
        }
    }

    @TargetApi(23)
    public static void a(@NonNull Context context, @NonNull String[] strArr, @NonNull InterfaceC0287a interfaceC0287a) {
        int i = 0;
        if (Build.VERSION.SDK_INT < 23) {
            int length = strArr.length;
            while (i < length) {
                interfaceC0287a.a(strArr[i]);
                i++;
            }
            interfaceC0287a.a(true);
            return;
        }
        ArrayList arrayList = new ArrayList(strArr.length);
        int length2 = strArr.length;
        while (i < length2) {
            String str = strArr[i];
            if (ContextCompat.checkSelfPermission(context, str) == 0) {
                interfaceC0287a.a(str);
            } else {
                arrayList.add(str);
            }
            i++;
        }
        if (arrayList.size() == 0) {
            interfaceC0287a.a(true);
            return;
        }
        Intent intent = new Intent(context, ShadowActivity.class);
        int andIncrement = a.getAndIncrement();
        synchronized (a.class) {
            b.put(andIncrement, interfaceC0287a);
        }
        intent.setFlags(268435456);
        intent.putExtra("request_id", andIncrement);
        intent.putExtra(NativeProtocol.RESULT_ARGS_PERMISSIONS, (String[]) arrayList.toArray(new String[arrayList.size()]));
        context.startActivity(intent);
    }
}
