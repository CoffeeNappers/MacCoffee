package io.sentry.event.interfaces;
/* loaded from: classes3.dex */
public class UserInterface implements SentryInterface {
    public static final String USER_INTERFACE = "sentry.interfaces.User";
    private final String email;
    private final String id;
    private final String ipAddress;
    private final String username;

    public UserInterface(String id, String username, String ipAddress, String email) {
        this.id = id;
        this.username = username;
        this.ipAddress = ipAddress;
        this.email = email;
    }

    @Override // io.sentry.event.interfaces.SentryInterface
    public String getInterfaceName() {
        return USER_INTERFACE;
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

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        UserInterface that = (UserInterface) o;
        if (this.id != null) {
            if (this.id.equals(that.id)) {
                return true;
            }
        } else if (that.id == null) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        if (this.id != null) {
            return this.id.hashCode();
        }
        return 0;
    }

    public String toString() {
        return "UserInterface{id='" + this.id + "', username='" + this.username + "', ipAddress='" + this.ipAddress + "', email='" + this.email + "'}";
    }
}
