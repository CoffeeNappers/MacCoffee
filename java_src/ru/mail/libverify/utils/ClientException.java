package ru.mail.libverify.utils;

import java.io.IOException;
/* loaded from: classes3.dex */
public class ClientException extends Exception {
    private final boolean a;

    public ClientException(IOException iOException) {
        super(iOException);
        this.a = false;
    }

    public ClientException(String str) {
        super(str);
        this.a = true;
    }
}
