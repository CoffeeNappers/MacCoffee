package com.google.android.gms.analytics;

import android.content.Context;
import com.google.android.gms.analytics.HitBuilders;
import com.google.android.gms.analytics.internal.zzae;
import java.lang.Thread;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class ExceptionReporter implements Thread.UncaughtExceptionHandler {
    private final Thread.UncaughtExceptionHandler aD;
    private final Tracker aE;
    private ExceptionParser aF;
    private GoogleAnalytics aG;
    private final Context mContext;

    public ExceptionReporter(Tracker tracker, Thread.UncaughtExceptionHandler uncaughtExceptionHandler, Context context) {
        if (tracker == null) {
            throw new NullPointerException("tracker cannot be null");
        }
        if (context == null) {
            throw new NullPointerException("context cannot be null");
        }
        this.aD = uncaughtExceptionHandler;
        this.aE = tracker;
        this.aF = new StandardExceptionParser(context, new ArrayList());
        this.mContext = context.getApplicationContext();
        String valueOf = String.valueOf(uncaughtExceptionHandler == null ? "null" : uncaughtExceptionHandler.getClass().getName());
        zzae.v(valueOf.length() != 0 ? "ExceptionReporter created, original handler is ".concat(valueOf) : new String("ExceptionReporter created, original handler is "));
    }

    public ExceptionParser getExceptionParser() {
        return this.aF;
    }

    public void setExceptionParser(ExceptionParser exceptionParser) {
        this.aF = exceptionParser;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable th) {
        String str = "UncaughtException";
        if (this.aF != null) {
            str = this.aF.getDescription(thread != null ? thread.getName() : null, th);
        }
        String valueOf = String.valueOf(str);
        zzae.v(valueOf.length() != 0 ? "Reporting uncaught exception: ".concat(valueOf) : new String("Reporting uncaught exception: "));
        this.aE.send(new HitBuilders.ExceptionBuilder().setDescription(str).setFatal(true).build());
        GoogleAnalytics zzza = zzza();
        zzza.dispatchLocalHits();
        zzza.zzzf();
        if (this.aD != null) {
            zzae.v("Passing exception to the original handler");
            this.aD.uncaughtException(thread, th);
        }
    }

    GoogleAnalytics zzza() {
        if (this.aG == null) {
            this.aG = GoogleAnalytics.getInstance(this.mContext);
        }
        return this.aG;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Thread.UncaughtExceptionHandler zzzb() {
        return this.aD;
    }
}
