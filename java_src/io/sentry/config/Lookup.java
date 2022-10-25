package io.sentry.config;

import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.sentry.dsn.Dsn;
import java.io.InputStream;
import java.util.Properties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public final class Lookup {
    private static final String CONFIG_FILE_NAME = "sentry.properties";
    private static Properties configProps;
    private static final Logger logger = LoggerFactory.getLogger(Lookup.class);

    static {
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            InputStream input = classLoader.getResourceAsStream(CONFIG_FILE_NAME);
            if (input != null) {
                configProps = new Properties();
                configProps.load(input);
            } else {
                logger.debug("Sentry configuration file '{}' not found.", CONFIG_FILE_NAME);
            }
        } catch (Exception e) {
            logger.error("Error loading Sentry configuration file '{}': ", CONFIG_FILE_NAME, e);
        }
    }

    private Lookup() {
    }

    public static String lookup(String key) {
        return lookup(key, null);
    }

    public static String lookup(String key, Dsn dsn) {
        String value = null;
        try {
            Class.forName("javax.naming.InitialContext", false, Dsn.class.getClassLoader());
            value = JndiLookup.jndiLookup(key);
            if (value != null) {
                logger.debug("Found {}={} in JNDI.", key, value);
            }
        } catch (ClassNotFoundException | NoClassDefFoundError e) {
            logger.trace("JNDI not available", e);
        }
        if (value == null && (value = System.getProperty("sentry." + key.toLowerCase())) != null) {
            logger.debug("Found {}={} in Java System Properties.", key, value);
        }
        if (value == null && (value = System.getenv("SENTRY_" + key.replace(".", EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).toUpperCase())) != null) {
            logger.debug("Found {}={} in System Environment Variables.", key, value);
        }
        if (value == null && dsn != null) {
            String value2 = dsn.getOptions().get(key);
            value = value2;
            if (value != null) {
                logger.debug("Found {}={} in DSN.", key, value);
            }
        }
        if (value == null && configProps != null && (value = configProps.getProperty(key)) != null) {
            logger.debug("Found {}={} in {}.", key, value, CONFIG_FILE_NAME);
        }
        if (value != null) {
            return value.trim();
        }
        return null;
    }
}
