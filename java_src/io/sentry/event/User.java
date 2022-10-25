package io.sentry.event;

import java.io.Serializable;
/* loaded from: classes3.dex */
public class User implements Serializable {
    private final String email;
    private final String id;
    private final String ipAddress;
    private final String username;

    public User(String id, String username, String ipAddress, String email) {
        this.id = id;
        this.username = username;
        this.ipAddress = ipAddress;
        this.email = email;
    }

    public String getId() {
        return this.id;
    }

    public String getUsername() {
        return this.username;
    }

    public String getIpAddress() {
        return this.ipAddress;
    }

    public String getEmail() {
        return this.email;
    }
}
