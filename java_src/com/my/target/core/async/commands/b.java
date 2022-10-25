package com.my.target.core.async.commands;
/* compiled from: AsyncCommand.java */
/* loaded from: classes2.dex */
public interface b<T> extends Runnable {

    /* compiled from: AsyncCommand.java */
    /* loaded from: classes2.dex */
    public interface a<T> {
        void onExecute(b<T> bVar, T t);
    }

    String a();

    void a(a<T> aVar);

    void b();
}
