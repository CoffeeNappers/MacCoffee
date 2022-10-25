package com.fasterxml.jackson.core.util;

import com.facebook.internal.ServerProtocol;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.Versioned;
import com.vk.media.camera.CameraUtilsEffects;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.regex.Pattern;
/* loaded from: classes.dex */
public class VersionUtil {
    private static final Pattern V_SEP = Pattern.compile("[-_./;:]");
    private final Version _v;

    protected VersionUtil() {
        Version v = null;
        try {
            v = versionFor(getClass());
        } catch (Exception e) {
            System.err.println("ERROR: Failed to load Version information from " + getClass());
        }
        this._v = v == null ? Version.unknownVersion() : v;
    }

    public Version version() {
        return this._v;
    }

    public static Version versionFor(Class<?> cls) {
        Version version = packageVersionFor(cls);
        return version == null ? Version.unknownVersion() : version;
    }

    public static Version packageVersionFor(Class<?> cls) {
        Version v = null;
        try {
            String versionInfoClassName = cls.getPackage().getName() + ".PackageVersion";
            Class<?> vClass = Class.forName(versionInfoClassName, true, cls.getClassLoader());
            try {
                v = ((Versioned) vClass.newInstance()).version();
            } catch (Exception e) {
                throw new IllegalArgumentException("Failed to get Versioned out of " + vClass);
            }
        } catch (Exception e2) {
        }
        if (v == null) {
            Version v2 = Version.unknownVersion();
            return v2;
        }
        return v;
    }

    @Deprecated
    public static Version mavenVersionFor(ClassLoader cl, String groupId, String artifactId) {
        InputStream pomProperties = cl.getResourceAsStream("META-INF/maven/" + groupId.replaceAll("\\.", CameraUtilsEffects.FILE_DELIM) + CameraUtilsEffects.FILE_DELIM + artifactId + "/pom.properties");
        if (pomProperties != null) {
            try {
                Properties props = new Properties();
                props.load(pomProperties);
                String versionStr = props.getProperty(ServerProtocol.FALLBACK_DIALOG_PARAM_VERSION);
                String pomPropertiesArtifactId = props.getProperty("artifactId");
                String pomPropertiesGroupId = props.getProperty("groupId");
                return parseVersion(versionStr, pomPropertiesGroupId, pomPropertiesArtifactId);
            } catch (IOException e) {
            } finally {
                _close(pomProperties);
            }
        }
        return Version.unknownVersion();
    }

    public static Version parseVersion(String s, String groupId, String artifactId) {
        int i = 0;
        if (s != null) {
            String s2 = s.trim();
            if (s2.length() > 0) {
                String[] parts = V_SEP.split(s2);
                int parseVersionPart = parseVersionPart(parts[0]);
                int parseVersionPart2 = parts.length > 1 ? parseVersionPart(parts[1]) : 0;
                if (parts.length > 2) {
                    i = parseVersionPart(parts[2]);
                }
                return new Version(parseVersionPart, parseVersionPart2, i, parts.length > 3 ? parts[3] : null, groupId, artifactId);
            }
        }
        return Version.unknownVersion();
    }

    protected static int parseVersionPart(String s) {
        int number = 0;
        int len = s.length();
        for (int i = 0; i < len; i++) {
            char c = s.charAt(i);
            if (c > '9' || c < '0') {
                break;
            }
            number = (number * 10) + (c - '0');
        }
        return number;
    }

    private static final void _close(Closeable c) {
        try {
            c.close();
        } catch (IOException e) {
        }
    }

    public static final void throwInternal() {
        throw new RuntimeException("Internal error: this code path should never get executed");
    }
}
