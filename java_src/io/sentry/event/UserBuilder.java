package io.sentry.event;
/* loaded from: classes3.dex */
public class UserBuilder {
    private String email;
    private String id;
    private String ipAddress;
    private String username;

    public UserBuilder setId(String value) {
        this.id = value;
        return this;
    }

    public UserBuilder setUsername(String value) {
        this.username = value;
        return this;
    }

    public UserBuilder setIpAddress(String value) {
        this.ipAddress = value;
        return this;
    }

    public UserBuilder setEmail(String value) {
        this.email = value;
        return this;
    }

    public User build() {
        return new User(this.id, this.username, this.ipAddress, this.email);
    }
}
