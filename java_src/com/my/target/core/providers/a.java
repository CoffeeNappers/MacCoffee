package com.my.target.core.providers;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;
/* compiled from: AbstractFPDataProvider.java */
/* loaded from: classes2.dex */
public abstract class a {
    private Map<String, String> map = new HashMap();

    /* JADX INFO: Access modifiers changed from: protected */
    public Map<String, String> getMap() {
        return this.map;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean addParam(String str, String str2) {
        if (!TextUtils.isEmpty(str)) {
            if (str2 == null) {
                return removeParam(str);
            }
            this.map.put(str, str2);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean removeParam(String str) {
        if (this.map.containsKey(str)) {
            this.map.remove(str);
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void removeAll() {
        this.map.clear();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getParam(String str) {
        return this.map.get(str);
    }

    public synchronized Map<String, String> getData() {
        HashMap hashMap;
        hashMap = new HashMap();
        hashMap.putAll(this.map);
        return hashMap;
    }

    public synchronized void putDataTo(Map<String, String> map) {
        map.putAll(this.map);
    }
}
