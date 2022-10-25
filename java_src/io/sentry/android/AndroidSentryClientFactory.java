package io.sentry.android;

import android.content.Context;
import android.util.Log;
import com.facebook.common.util.UriUtil;
import io.sentry.DefaultSentryClientFactory;
import io.sentry.SentryClient;
import io.sentry.SentryUncaughtExceptionHandler;
import io.sentry.android.event.helper.AndroidEventBuilderHelper;
import io.sentry.buffer.Buffer;
import io.sentry.buffer.DiskBuffer;
import io.sentry.config.Lookup;
import io.sentry.context.ContextManager;
import io.sentry.context.SingletonContextManager;
import io.sentry.dsn.Dsn;
import java.io.File;
/* loaded from: classes3.dex */
public class AndroidSentryClientFactory extends DefaultSentryClientFactory {
    private static final String DEFAULT_BUFFER_DIR = "sentry-buffered-events";
    public static final String TAG = AndroidSentryClientFactory.class.getName();
    private Context ctx;

    public AndroidSentryClientFactory(Context ctx) {
        Log.d(TAG, "Construction of Android Sentry.");
        this.ctx = ctx.getApplicationContext();
    }

    @Override // io.sentry.DefaultSentryClientFactory, io.sentry.SentryClientFactory
    public SentryClient createSentryClient(Dsn dsn) {
        if (!checkPermission("android.permission.INTERNET")) {
            Log.e(TAG, "android.permission.INTERNET is required to connect to the Sentry server, please add it to your AndroidManifest.xml");
        }
        Log.d(TAG, "Sentry init with ctx='" + this.ctx.toString() + "' and dsn='" + dsn + "'");
        String protocol = dsn.getProtocol();
        if (!protocol.equalsIgnoreCase(UriUtil.HTTP_SCHEME) && !protocol.equalsIgnoreCase(UriUtil.HTTPS_SCHEME)) {
            throw new IllegalArgumentException("Only 'http' or 'https' connections are supported in Sentry Android, but received: " + protocol);
        }
        String async = Lookup.lookup(DefaultSentryClientFactory.ASYNC_OPTION, dsn);
        if (async != null && async.equalsIgnoreCase("false")) {
            throw new IllegalArgumentException("Sentry Android cannot use synchronous connections, remove 'async=false' from your DSN.");
        }
        SentryClient sentryClient = super.createSentryClient(dsn);
        sentryClient.addBuilderHelper(new AndroidEventBuilderHelper(this.ctx));
        SentryUncaughtExceptionHandler.setup();
        return sentryClient;
    }

    @Override // io.sentry.DefaultSentryClientFactory
    protected Buffer getBuffer(Dsn dsn) {
        File bufferDir;
        String bufferDirOpt = Lookup.lookup(DefaultSentryClientFactory.BUFFER_DIR_OPTION, dsn);
        if (bufferDirOpt != null) {
            bufferDir = new File(bufferDirOpt);
        } else {
            bufferDir = new File(this.ctx.getCacheDir().getAbsolutePath(), DEFAULT_BUFFER_DIR);
        }
        Log.d(TAG, "Using buffer dir: " + bufferDir.getAbsolutePath());
        return new DiskBuffer(bufferDir, getBufferSize(dsn));
    }

    @Override // io.sentry.DefaultSentryClientFactory
    protected ContextManager getContextManager(Dsn dsn) {
        return new SingletonContextManager();
    }

    private boolean checkPermission(String permission) {
        int res = this.ctx.checkCallingOrSelfPermission(permission);
        return res == 0;
    }
}
