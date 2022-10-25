package com.google.android.gms.internal;

import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zzmy extends com.google.android.gms.analytics.zzg<zzmy> {
    private ProductAction aP;
    private final List<Product> aS = new ArrayList();
    private final List<Promotion> aR = new ArrayList();
    private final Map<String, List<Product>> aQ = new HashMap();

    public String toString() {
        HashMap hashMap = new HashMap();
        if (!this.aS.isEmpty()) {
            hashMap.put("products", this.aS);
        }
        if (!this.aR.isEmpty()) {
            hashMap.put("promotions", this.aR);
        }
        if (!this.aQ.isEmpty()) {
            hashMap.put("impressions", this.aQ);
        }
        hashMap.put("productAction", this.aP);
        return zzj(hashMap);
    }

    public void zza(Product product, String str) {
        if (product == null) {
            return;
        }
        if (str == null) {
            str = "";
        }
        if (!this.aQ.containsKey(str)) {
            this.aQ.put(str, new ArrayList());
        }
        this.aQ.get(str).add(product);
    }

    @Override // com.google.android.gms.analytics.zzg
    /* renamed from: zza */
    public void zzb(zzmy zzmyVar) {
        zzmyVar.aS.addAll(this.aS);
        zzmyVar.aR.addAll(this.aR);
        for (Map.Entry<String, List<Product>> entry : this.aQ.entrySet()) {
            String key = entry.getKey();
            for (Product product : entry.getValue()) {
                zzmyVar.zza(product, key);
            }
        }
        if (this.aP != null) {
            zzmyVar.aP = this.aP;
        }
    }

    public ProductAction zzaav() {
        return this.aP;
    }

    public List<Product> zzaaw() {
        return Collections.unmodifiableList(this.aS);
    }

    public Map<String, List<Product>> zzaax() {
        return this.aQ;
    }

    public List<Promotion> zzaay() {
        return Collections.unmodifiableList(this.aR);
    }
}
