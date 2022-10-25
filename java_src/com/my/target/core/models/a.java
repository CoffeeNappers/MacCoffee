package com.my.target.core.models;
/* compiled from: AbstractMediaData.java */
/* loaded from: classes2.dex */
public abstract class a<T> implements h<T> {
    protected int height;
    private T t;
    protected final String url;
    protected int width;

    public String getUrl() {
        return this.url;
    }

    public int getWidth() {
        return this.width;
    }

    public int getHeight() {
        return this.height;
    }

    public void setWidth(int i) {
        this.width = i;
    }

    public void setHeight(int i) {
        this.height = i;
    }

    public void setData(T t) {
        this.t = t;
    }

    @Override // com.my.target.core.models.h
    public T getData() {
        return this.t;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public a(String str) {
        this.url = str;
    }
}
