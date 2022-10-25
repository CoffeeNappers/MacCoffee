package com.my.target.core.communication.js;

import com.my.target.core.communication.js.events.f;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
/* compiled from: JSEventProcessor.java */
/* loaded from: classes2.dex */
public final class c {
    private HashMap<String, ArrayList<b>> a = new HashMap<>();

    public final boolean a(f fVar) {
        String a = fVar.a();
        if (this.a.containsKey(a)) {
            ArrayList arrayList = new ArrayList(this.a.get(a));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                b bVar = (b) it.next();
                if (arrayList.contains(bVar)) {
                    bVar.a(fVar);
                }
            }
            return true;
        }
        return false;
    }

    public final boolean a(String str, b bVar) {
        if (this.a.containsKey(str)) {
            ArrayList<b> arrayList = this.a.get(str);
            if (arrayList.contains(bVar)) {
                return false;
            }
            arrayList.add(bVar);
        } else {
            ArrayList<b> arrayList2 = new ArrayList<>();
            arrayList2.add(bVar);
            this.a.put(str, arrayList2);
        }
        return true;
    }

    public final void a() {
        for (Map.Entry<String, ArrayList<b>> entry : this.a.entrySet()) {
            entry.getValue().clear();
        }
        this.a.clear();
    }
}
