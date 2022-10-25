package io.sentry.config;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.naming.NoInitialContextException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public final class JndiLookup {
    private static final String JNDI_PREFIX = "java:comp/env/sentry/";
    private static final Logger logger = LoggerFactory.getLogger(JndiLookup.class);

    private JndiLookup() {
    }

    public static String jndiLookup(String key) {
        try {
            String value = (String) new InitialContext().lookup(JNDI_PREFIX + key);
            return value;
        } catch (NamingException e) {
            logger.trace("No /sentry/" + key + " in JNDI");
            return null;
        } catch (NoInitialContextException e2) {
            logger.trace("JNDI not configured for Sentry (NoInitialContextEx)");
            return null;
        } catch (RuntimeException e3) {
            logger.warn("Odd RuntimeException while testing for JNDI", (Throwable) e3);
            return null;
        }
    }
}
