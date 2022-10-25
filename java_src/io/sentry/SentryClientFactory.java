package io.sentry;

import io.sentry.config.Lookup;
import io.sentry.dsn.Dsn;
import io.sentry.util.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public abstract class SentryClientFactory {
    private static final Logger logger = LoggerFactory.getLogger(SentryClientFactory.class);

    public abstract SentryClient createSentryClient(Dsn dsn);

    public static SentryClient sentryClient(String dsn) {
        return sentryClient(dsn, null);
    }

    public static SentryClient sentryClient(String dsn, SentryClientFactory sentryClientFactory) {
        Dsn realDsn = resolveDsn(dsn);
        if (sentryClientFactory == null) {
            String sentryClientFactoryName = Lookup.lookup("factory", realDsn);
            if (Util.isNullOrEmpty(sentryClientFactoryName)) {
                sentryClientFactory = new DefaultSentryClientFactory();
            } else {
                try {
                    sentryClientFactory = (SentryClientFactory) Class.forName(sentryClientFactoryName).newInstance();
                } catch (ClassNotFoundException | IllegalAccessException | InstantiationException e) {
                    logger.error("Error creating SentryClient using factory class: '" + sentryClientFactoryName + "'.", (Throwable) e);
                    return null;
                }
            }
        }
        return sentryClientFactory.createSentryClient(realDsn);
    }

    private static Dsn resolveDsn(String dsn) {
        if (!Util.isNullOrEmpty(dsn)) {
            Dsn realDsn = new Dsn(dsn);
            return realDsn;
        }
        Dsn realDsn2 = new Dsn(Dsn.dsnLookup());
        return realDsn2;
    }

    public String toString() {
        return "SentryClientFactory{name='" + getClass().getName() + "'}";
    }
}
