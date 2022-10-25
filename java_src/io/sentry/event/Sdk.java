package io.sentry.event;

import java.io.Serializable;
import java.util.Set;
/* loaded from: classes3.dex */
public class Sdk implements Serializable {
    private Set<String> integrations;
    private String name;
    private String version;

    public Sdk(String name, String version, Set<String> integrations) {
        this.name = name;
        this.version = version;
        this.integrations = integrations;
    }

    public String getName() {
        return this.name;
    }

    public String getVersion() {
        return this.version;
    }

    public Set<String> getIntegrations() {
        return this.integrations;
    }
}
