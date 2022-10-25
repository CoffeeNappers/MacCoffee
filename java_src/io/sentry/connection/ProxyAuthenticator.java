package io.sentry.connection;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
/* loaded from: classes3.dex */
public class ProxyAuthenticator extends Authenticator {
    private String pass;
    private String user;

    public ProxyAuthenticator(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    @Override // java.net.Authenticator
    protected PasswordAuthentication getPasswordAuthentication() {
        if (getRequestorType() == Authenticator.RequestorType.PROXY) {
            return new PasswordAuthentication(this.user, this.pass.toCharArray());
        }
        return null;
    }
}
