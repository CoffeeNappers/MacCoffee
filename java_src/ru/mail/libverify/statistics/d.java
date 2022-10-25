package ru.mail.libverify.statistics;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.HitBuilders;
import com.google.android.gms.analytics.Tracker;
import java.util.Locale;
import java.util.Map;
import ru.mail.libverify.storage.k;
/* loaded from: classes3.dex */
public final class d implements c {
    private final k a;
    private Tracker b;

    public d(@NonNull k kVar) {
        this.a = kVar;
    }

    private Tracker a() {
        if (this.b == null) {
            this.b = GoogleAnalytics.getInstance(this.a.d()).newTracker("UA-19019454-14");
            this.b.enableAutoActivityTracking(false);
            this.b.enableExceptionReporting(false);
            this.b.setAppVersion(String.format(Locale.US, "%s:%d", this.a.c(), 135));
        }
        return this.b;
    }

    @Override // ru.mail.libverify.statistics.c
    public final void a(@Nullable Thread thread, @NonNull Throwable th) {
        try {
            a().send(new HitBuilders.ExceptionBuilder().setFatal(true).setDescription(ru.mail.libverify.utils.c.a(th, thread)).build());
        } catch (Throwable th2) {
            ru.mail.libverify.utils.d.a("GAEventSender", "sendLog", th2);
        }
    }

    @Override // ru.mail.libverify.statistics.c
    public final void a(@NonNull a aVar) {
        try {
            a().send(new HitBuilders.EventBuilder().setCategory("common").setAction(aVar.toString()).build());
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("GAEventSender", "sendLog", th);
        }
    }

    @Override // ru.mail.libverify.statistics.c
    public final void a(@NonNull a aVar, @NonNull Map<String, String> map) {
        try {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                a().send(new HitBuilders.EventBuilder().setAction(entry.getValue()).setLabel(entry.getKey()).setCategory(String.format(Locale.US, "%s_%s", aVar, entry.getKey())).build());
            }
        } catch (Throwable th) {
            ru.mail.libverify.utils.d.a("GAEventSender", "sendLog", th);
        }
    }

    @Override // ru.mail.libverify.statistics.c
    public final void b(@Nullable Thread thread, @NonNull Throwable th) {
        try {
            a().send(new HitBuilders.ExceptionBuilder().setFatal(false).setDescription("[silent]" + ru.mail.libverify.utils.c.a(th, thread)).build());
        } catch (Throwable th2) {
            ru.mail.libverify.utils.d.a("GAEventSender", "sendLog", th2);
        }
    }
}
