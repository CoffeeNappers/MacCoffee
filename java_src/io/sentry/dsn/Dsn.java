package io.sentry.dsn;

import com.vk.media.camera.CameraUtilsEffects;
import io.sentry.config.Lookup;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class Dsn {
    public static final String DEFAULT_DSN = "noop://localhost?async=false";
    private static final Logger logger = LoggerFactory.getLogger(Dsn.class);
    private String host;
    private Map<String, String> options;
    private String path;
    private int port;
    private String projectId;
    private String protocol;
    private Set<String> protocolSettings;
    private String publicKey;
    private String secretKey;
    private URI uri;

    public Dsn(String dsn) throws InvalidDsnException {
        this(URI.create(dsn));
    }

    public Dsn(URI dsn) throws InvalidDsnException {
        if (dsn == null) {
            throw new InvalidDsnException("DSN constructed with null value!");
        }
        this.options = new HashMap();
        this.protocolSettings = new HashSet();
        extractProtocolInfo(dsn);
        extractUserKeys(dsn);
        extractHostInfo(dsn);
        extractPathInfo(dsn);
        extractOptions(dsn);
        makeOptionsImmutable();
        validate();
        try {
            this.uri = new URI(this.protocol, null, this.host, this.port, this.path, null, null);
        } catch (URISyntaxException e) {
            throw new InvalidDsnException("Impossible to determine Sentry's URI from the DSN '" + dsn + "'", e);
        }
    }

    public static String dsnLookup() {
        String dsn = Lookup.lookup("dsn");
        if (dsn == null) {
            logger.warn("*** Couldn't find a suitable DSN, Sentry operations will do nothing! See documentation: https://docs.sentry.io/clients/java/ ***");
            return DEFAULT_DSN;
        }
        return dsn;
    }

    private void extractPathInfo(URI dsnUri) {
        String uriPath = dsnUri.getPath();
        if (uriPath != null) {
            int projectIdStart = uriPath.lastIndexOf(CameraUtilsEffects.FILE_DELIM) + 1;
            this.path = uriPath.substring(0, projectIdStart);
            this.projectId = uriPath.substring(projectIdStart);
        }
    }

    private void extractHostInfo(URI dsnUri) {
        this.host = dsnUri.getHost();
        this.port = dsnUri.getPort();
    }

    private void extractProtocolInfo(URI dsnUri) {
        String scheme = dsnUri.getScheme();
        if (scheme != null) {
            String[] schemeDetails = scheme.split("\\+");
            this.protocolSettings.addAll(Arrays.asList(schemeDetails).subList(0, schemeDetails.length - 1));
            this.protocol = schemeDetails[schemeDetails.length - 1];
        }
    }

    private void extractUserKeys(URI dsnUri) {
        String userInfo = dsnUri.getUserInfo();
        if (userInfo != null) {
            String[] userDetails = userInfo.split(":");
            this.publicKey = userDetails[0];
            if (userDetails.length > 1) {
                this.secretKey = userDetails[1];
            }
        }
    }

    private void extractOptions(URI dsnUri) {
        String query = dsnUri.getQuery();
        if (query != null && !query.isEmpty()) {
            String[] arr$ = query.split("&");
            for (String optionPair : arr$) {
                try {
                    String[] pairDetails = optionPair.split("=");
                    String key = URLDecoder.decode(pairDetails[0], "UTF-8");
                    String value = pairDetails.length > 1 ? URLDecoder.decode(pairDetails[1], "UTF-8") : null;
                    this.options.put(key, value);
                } catch (UnsupportedEncodingException e) {
                    throw new IllegalArgumentException("Impossible to decode the query parameter '" + optionPair + "'", e);
                }
            }
        }
    }

    private void makeOptionsImmutable() {
        this.options = Collections.unmodifiableMap(this.options);
        this.protocolSettings = Collections.unmodifiableSet(this.protocolSettings);
    }

    private void validate() {
        List<String> missingElements = new LinkedList<>();
        if (this.host == null) {
            missingElements.add("host");
        }
        if (this.protocol != null && !this.protocol.equalsIgnoreCase("noop") && !this.protocol.equalsIgnoreCase("out")) {
            if (this.publicKey == null) {
                missingElements.add("public key");
            }
            if (this.secretKey == null) {
                missingElements.add("secret key");
            }
            if (this.projectId == null || this.projectId.isEmpty()) {
                missingElements.add("project ID");
            }
        }
        if (!missingElements.isEmpty()) {
            throw new InvalidDsnException("Invalid DSN, the following properties aren't set '" + missingElements + "'");
        }
    }

    public String getSecretKey() {
        return this.secretKey;
    }

    public String getPublicKey() {
        return this.publicKey;
    }

    public String getProjectId() {
        return this.projectId;
    }

    public String getProtocol() {
        return this.protocol;
    }

    public String getHost() {
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public String getPath() {
        return this.path;
    }

    public Set<String> getProtocolSettings() {
        return this.protocolSettings;
    }

    public Map<String, String> getOptions() {
        return this.options;
    }

    public URI getUri() {
        return this.uri;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Dsn dsn = (Dsn) o;
        if (this.port == dsn.port && this.host.equals(dsn.host) && this.options.equals(dsn.options) && this.path.equals(dsn.path) && this.projectId.equals(dsn.projectId)) {
            if (this.protocol == null ? dsn.protocol != null : !this.protocol.equals(dsn.protocol)) {
                return false;
            }
            return this.protocolSettings.equals(dsn.protocolSettings) && this.publicKey.equals(dsn.publicKey) && this.secretKey.equals(dsn.secretKey);
        }
        return false;
    }

    public int hashCode() {
        int result = this.publicKey.hashCode();
        return (((((((result * 31) + this.projectId.hashCode()) * 31) + this.host.hashCode()) * 31) + this.port) * 31) + this.path.hashCode();
    }

    public String toString() {
        return "Dsn{uri=" + this.uri + '}';
    }
}
