package ru.mail.libverify.storage;

import android.content.Context;
import android.support.annotation.NonNull;
import java.util.HashSet;
import ru.mail.libverify.sms.IncomingCallReceiver;
import ru.mail.libverify.sms.IncomingSmsReceiver;
import ru.mail.libverify.utils.BatteryLevelReceiver;
import ru.mail.libverify.utils.SystemRestartReceiver;
import ru.mail.libverify.utils.network.NetworkStateReceiver;
/* loaded from: classes3.dex */
public class e {
    private static final HashSet<Object> a = new HashSet<>();
    private static final HashSet<Object> b = new HashSet<>();
    private static final HashSet<Object> c = new HashSet<>();
    private static final HashSet<Object> d = new HashSet<>();
    private static final HashSet<Object> e = new HashSet<>();

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(@NonNull Context context, @NonNull Object obj) {
        synchronized (e.class) {
            if (b.remove(obj) && b.isEmpty()) {
                IncomingCallReceiver.b(context);
            }
            if (c.remove(obj) && c.isEmpty()) {
                IncomingSmsReceiver.b(context);
            }
            if (d.remove(obj) && d.isEmpty()) {
                BatteryLevelReceiver.b(context);
            }
            if (a.remove(obj) && a.isEmpty()) {
                NetworkStateReceiver.d(context);
            }
            if (e.remove(obj) && e.isEmpty()) {
                SystemRestartReceiver.b(context);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(@NonNull Context context, @NonNull Object obj, int i) {
        if (i == 0) {
            return;
        }
        synchronized (e.class) {
            if ((i & 1) == 1) {
                if (b.add(obj) && b.size() == 1) {
                    IncomingCallReceiver.a(context);
                }
            }
            if ((i & 4) == 4 && c.add(obj) && c.size() == 1) {
                IncomingSmsReceiver.a(context);
            }
            if ((i & 8) == 8 && a.add(obj) && a.size() == 1) {
                NetworkStateReceiver.c(context);
            }
            if ((i & 16) == 16 && d.add(obj) && d.size() == 1) {
                BatteryLevelReceiver.a(context);
            }
            if ((i & 32) == 32 && e.add(obj) && e.size() == 1) {
                SystemRestartReceiver.a(context);
            }
        }
    }
}
