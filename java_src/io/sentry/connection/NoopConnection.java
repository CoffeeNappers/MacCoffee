package io.sentry.connection;

import io.sentry.event.Event;
import java.io.IOException;
/* loaded from: classes3.dex */
public class NoopConnection extends AbstractConnection {
    public NoopConnection() {
        super(null, null);
    }

    @Override // io.sentry.connection.AbstractConnection
    protected void doSend(Event event) throws ConnectionException {
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }
}
