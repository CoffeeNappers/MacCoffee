package ru.mail.libverify.utils;
/* loaded from: classes3.dex */
public class ServerException extends Exception {
    public final int a;

    public ServerException(int i) {
        super("response code is " + i);
        this.a = i;
    }
}
