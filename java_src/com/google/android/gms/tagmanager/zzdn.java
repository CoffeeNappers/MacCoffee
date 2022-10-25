package com.google.android.gms.tagmanager;

import android.content.Context;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.analytics.Tracker;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import com.google.android.gms.internal.zzaj;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.stickers.Stickers;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public class zzdn extends zzdk {
    private static final String ID = com.google.android.gms.internal.zzag.UNIVERSAL_ANALYTICS.toString();
    private static final String aIa = com.google.android.gms.internal.zzah.ACCOUNT.toString();
    private static final String aIb = com.google.android.gms.internal.zzah.ANALYTICS_PASS_THROUGH.toString();
    private static final String aIc = com.google.android.gms.internal.zzah.ENABLE_ECOMMERCE.toString();
    private static final String aId = com.google.android.gms.internal.zzah.ECOMMERCE_USE_DATA_LAYER.toString();
    private static final String aIe = com.google.android.gms.internal.zzah.ECOMMERCE_MACRO_DATA.toString();
    private static final String aIf = com.google.android.gms.internal.zzah.ANALYTICS_FIELDS.toString();
    private static final String aIg = com.google.android.gms.internal.zzah.TRACK_TRANSACTION.toString();
    private static final String aIh = com.google.android.gms.internal.zzah.TRANSACTION_DATALAYER_MAP.toString();
    private static final String aIi = com.google.android.gms.internal.zzah.TRANSACTION_ITEM_DATALAYER_MAP.toString();
    private static final List<String> aIj = Arrays.asList(ProductAction.ACTION_DETAIL, ProductAction.ACTION_CHECKOUT, ProductAction.ACTION_CHECKOUT_OPTION, "click", ProductAction.ACTION_ADD, ProductAction.ACTION_REMOVE, ProductAction.ACTION_PURCHASE, ProductAction.ACTION_REFUND);
    private static final Pattern aIk = Pattern.compile("dimension(\\d+)");
    private static final Pattern aIl = Pattern.compile("metric(\\d+)");
    private static Map<String, String> aIm;
    private static Map<String, String> aIn;
    private final DataLayer aDZ;
    private final Set<String> aIo;
    private final zzdj aIp;

    public zzdn(Context context, DataLayer dataLayer) {
        this(context, dataLayer, new zzdj(context));
    }

    zzdn(Context context, DataLayer dataLayer, zzdj zzdjVar) {
        super(ID, new String[0]);
        this.aDZ = dataLayer;
        this.aIp = zzdjVar;
        this.aIo = new HashSet();
        this.aIo.add("");
        this.aIo.add(AppEventsConstants.EVENT_PARAM_VALUE_NO);
        this.aIo.add("false");
    }

    private void zza(Tracker tracker, Map<String, zzaj.zza> map) {
        String zzqc = zzqc("transactionId");
        if (zzqc == null) {
            zzbo.e("Cannot find transactionId in data layer.");
            return;
        }
        LinkedList<Map<String, String>> linkedList = new LinkedList();
        try {
            Map<String, String> zzm = zzm(map.get(aIf));
            zzm.put("&t", "transaction");
            for (Map.Entry<String, String> entry : zzbk(map).entrySet()) {
                zze(zzm, entry.getValue(), zzqc(entry.getKey()));
            }
            linkedList.add(zzm);
            List<Map<String, String>> zzqd = zzqd("transactionProducts");
            if (zzqd != null) {
                for (Map<String, String> map2 : zzqd) {
                    if (map2.get("name") == null) {
                        zzbo.e("Unable to send transaction item hit due to missing 'name' field.");
                        return;
                    }
                    Map<String, String> zzm2 = zzm(map.get(aIf));
                    zzm2.put("&t", Stickers.EXTRA_ITEM);
                    zzm2.put("&ti", zzqc);
                    for (Map.Entry<String, String> entry2 : zzbl(map).entrySet()) {
                        zze(zzm2, entry2.getValue(), map2.get(entry2.getKey()));
                    }
                    linkedList.add(zzm2);
                }
            }
            for (Map<String, String> map3 : linkedList) {
                tracker.send(map3);
            }
        } catch (IllegalArgumentException e) {
            zzbo.zzb("Unable to send transaction", e);
        }
    }

    private Double zzax(Object obj) {
        if (obj instanceof String) {
            try {
                return Double.valueOf((String) obj);
            } catch (NumberFormatException e) {
                String valueOf = String.valueOf(e.getMessage());
                throw new RuntimeException(valueOf.length() != 0 ? "Cannot convert the object to Double: ".concat(valueOf) : new String("Cannot convert the object to Double: "));
            }
        } else if (obj instanceof Integer) {
            return Double.valueOf(((Integer) obj).doubleValue());
        } else {
            if (obj instanceof Double) {
                return (Double) obj;
            }
            String valueOf2 = String.valueOf(obj.toString());
            throw new RuntimeException(valueOf2.length() != 0 ? "Cannot convert the object to Double: ".concat(valueOf2) : new String("Cannot convert the object to Double: "));
        }
    }

    private Integer zzay(Object obj) {
        if (obj instanceof String) {
            try {
                return Integer.valueOf((String) obj);
            } catch (NumberFormatException e) {
                String valueOf = String.valueOf(e.getMessage());
                throw new RuntimeException(valueOf.length() != 0 ? "Cannot convert the object to Integer: ".concat(valueOf) : new String("Cannot convert the object to Integer: "));
            }
        } else if (obj instanceof Double) {
            return Integer.valueOf(((Double) obj).intValue());
        } else {
            if (obj instanceof Integer) {
                return (Integer) obj;
            }
            String valueOf2 = String.valueOf(obj.toString());
            throw new RuntimeException(valueOf2.length() != 0 ? "Cannot convert the object to Integer: ".concat(valueOf2) : new String("Cannot convert the object to Integer: "));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x0134  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void zzb(com.google.android.gms.analytics.Tracker r8, java.util.Map<java.lang.String, com.google.android.gms.internal.zzaj.zza> r9) {
        /*
            Method dump skipped, instructions count: 497
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.tagmanager.zzdn.zzb(com.google.android.gms.analytics.Tracker, java.util.Map):void");
    }

    private Promotion zzbi(Map<String, String> map) {
        Promotion promotion = new Promotion();
        String str = map.get("id");
        if (str != null) {
            promotion.setId(String.valueOf(str));
        }
        String str2 = map.get("name");
        if (str2 != null) {
            promotion.setName(String.valueOf(str2));
        }
        String str3 = map.get("creative");
        if (str3 != null) {
            promotion.setCreative(String.valueOf(str3));
        }
        String str4 = map.get("position");
        if (str4 != null) {
            promotion.setPosition(String.valueOf(str4));
        }
        return promotion;
    }

    private Product zzbj(Map<String, Object> map) {
        Product product = new Product();
        Object obj = map.get("id");
        if (obj != null) {
            product.setId(String.valueOf(obj));
        }
        Object obj2 = map.get("name");
        if (obj2 != null) {
            product.setName(String.valueOf(obj2));
        }
        Object obj3 = map.get("brand");
        if (obj3 != null) {
            product.setBrand(String.valueOf(obj3));
        }
        Object obj4 = map.get(ServerKeys.CATEGORY);
        if (obj4 != null) {
            product.setCategory(String.valueOf(obj4));
        }
        Object obj5 = map.get("variant");
        if (obj5 != null) {
            product.setVariant(String.valueOf(obj5));
        }
        Object obj6 = map.get(FirebaseAnalytics.Param.COUPON);
        if (obj6 != null) {
            product.setCouponCode(String.valueOf(obj6));
        }
        Object obj7 = map.get("position");
        if (obj7 != null) {
            product.setPosition(zzay(obj7).intValue());
        }
        Object obj8 = map.get("price");
        if (obj8 != null) {
            product.setPrice(zzax(obj8).doubleValue());
        }
        Object obj9 = map.get(FirebaseAnalytics.Param.QUANTITY);
        if (obj9 != null) {
            product.setQuantity(zzay(obj9).intValue());
        }
        for (String str : map.keySet()) {
            Matcher matcher = aIk.matcher(str);
            if (matcher.matches()) {
                try {
                    product.setCustomDimension(Integer.parseInt(matcher.group(1)), String.valueOf(map.get(str)));
                } catch (NumberFormatException e) {
                    String valueOf = String.valueOf(str);
                    zzbo.zzdi(valueOf.length() != 0 ? "illegal number in custom dimension value: ".concat(valueOf) : new String("illegal number in custom dimension value: "));
                }
            } else {
                Matcher matcher2 = aIl.matcher(str);
                if (matcher2.matches()) {
                    try {
                        product.setCustomMetric(Integer.parseInt(matcher2.group(1)), zzay(map.get(str)).intValue());
                    } catch (NumberFormatException e2) {
                        String valueOf2 = String.valueOf(str);
                        zzbo.zzdi(valueOf2.length() != 0 ? "illegal number in custom metric value: ".concat(valueOf2) : new String("illegal number in custom metric value: "));
                    }
                }
            }
        }
        return product;
    }

    private Map<String, String> zzbk(Map<String, zzaj.zza> map) {
        zzaj.zza zzaVar = map.get(aIh);
        if (zzaVar != null) {
            return zzc(zzaVar);
        }
        if (aIm == null) {
            HashMap hashMap = new HashMap();
            hashMap.put("transactionId", "&ti");
            hashMap.put("transactionAffiliation", "&ta");
            hashMap.put("transactionTax", "&tt");
            hashMap.put("transactionShipping", "&ts");
            hashMap.put("transactionTotal", "&tr");
            hashMap.put("transactionCurrency", "&cu");
            aIm = hashMap;
        }
        return aIm;
    }

    private Map<String, String> zzbl(Map<String, zzaj.zza> map) {
        zzaj.zza zzaVar = map.get(aIi);
        if (zzaVar != null) {
            return zzc(zzaVar);
        }
        if (aIn == null) {
            HashMap hashMap = new HashMap();
            hashMap.put("name", "&in");
            hashMap.put("sku", "&ic");
            hashMap.put(ServerKeys.CATEGORY, "&iv");
            hashMap.put("price", "&ip");
            hashMap.put(FirebaseAnalytics.Param.QUANTITY, "&iq");
            hashMap.put("currency", "&cu");
            aIn = hashMap;
        }
        return aIn;
    }

    private Map<String, String> zzc(zzaj.zza zzaVar) {
        Object zzl = zzdm.zzl(zzaVar);
        if (!(zzl instanceof Map)) {
            return null;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : ((Map) zzl).entrySet()) {
            linkedHashMap.put(entry.getKey().toString(), entry.getValue().toString());
        }
        return linkedHashMap;
    }

    private void zze(Map<String, String> map, String str, String str2) {
        if (str2 != null) {
            map.put(str, str2);
        }
    }

    private ProductAction zzi(String str, Map<String, Object> map) {
        ProductAction productAction = new ProductAction(str);
        Object obj = map.get("id");
        if (obj != null) {
            productAction.setTransactionId(String.valueOf(obj));
        }
        Object obj2 = map.get("affiliation");
        if (obj2 != null) {
            productAction.setTransactionAffiliation(String.valueOf(obj2));
        }
        Object obj3 = map.get(FirebaseAnalytics.Param.COUPON);
        if (obj3 != null) {
            productAction.setTransactionCouponCode(String.valueOf(obj3));
        }
        Object obj4 = map.get(ArgKeys.LIST);
        if (obj4 != null) {
            productAction.setProductActionList(String.valueOf(obj4));
        }
        Object obj5 = map.get("option");
        if (obj5 != null) {
            productAction.setCheckoutOptions(String.valueOf(obj5));
        }
        Object obj6 = map.get("revenue");
        if (obj6 != null) {
            productAction.setTransactionRevenue(zzax(obj6).doubleValue());
        }
        Object obj7 = map.get(FirebaseAnalytics.Param.TAX);
        if (obj7 != null) {
            productAction.setTransactionTax(zzax(obj7).doubleValue());
        }
        Object obj8 = map.get(FirebaseAnalytics.Param.SHIPPING);
        if (obj8 != null) {
            productAction.setTransactionShipping(zzax(obj8).doubleValue());
        }
        Object obj9 = map.get("step");
        if (obj9 != null) {
            productAction.setCheckoutStep(zzay(obj9).intValue());
        }
        return productAction;
    }

    private boolean zzj(Map<String, zzaj.zza> map, String str) {
        zzaj.zza zzaVar = map.get(str);
        if (zzaVar == null) {
            return false;
        }
        return zzdm.zzk(zzaVar).booleanValue();
    }

    private Map<String, String> zzm(zzaj.zza zzaVar) {
        Map<String, String> zzc;
        if (zzaVar != null && (zzc = zzc(zzaVar)) != null) {
            String str = zzc.get("&aip");
            if (str != null && this.aIo.contains(str.toLowerCase())) {
                zzc.remove("&aip");
            }
            return zzc;
        }
        return new HashMap();
    }

    private String zzqc(String str) {
        Object obj = this.aDZ.get(str);
        if (obj == null) {
            return null;
        }
        return obj.toString();
    }

    private List<Map<String, String>> zzqd(String str) {
        Object obj = this.aDZ.get(str);
        if (obj == null) {
            return null;
        }
        if (!(obj instanceof List)) {
            throw new IllegalArgumentException("transactionProducts should be of type List.");
        }
        for (Object obj2 : (List) obj) {
            if (!(obj2 instanceof Map)) {
                throw new IllegalArgumentException("Each element of transactionProducts should be of type Map.");
            }
        }
        return (List) obj;
    }

    @Override // com.google.android.gms.tagmanager.zzdk, com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ zzaj.zza zzay(Map map) {
        return super.zzay((Map<String, zzaj.zza>) map);
    }

    @Override // com.google.android.gms.tagmanager.zzdk
    public void zzba(Map<String, zzaj.zza> map) {
        Tracker zzpu = this.aIp.zzpu("_GTM_DEFAULT_TRACKER_");
        zzpu.enableAdvertisingIdCollection(zzj(map, "collect_adid"));
        if (zzj(map, aIc)) {
            zzb(zzpu, map);
        } else if (zzj(map, aIb)) {
            zzpu.send(zzm(map.get(aIf)));
        } else if (zzj(map, aIg)) {
            zza(zzpu, map);
        } else {
            zzbo.zzdi("Ignoring unknown tag.");
        }
    }

    @Override // com.google.android.gms.tagmanager.zzdk, com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ boolean zzcdu() {
        return super.zzcdu();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ String zzcfg() {
        return super.zzcfg();
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public /* bridge */ /* synthetic */ Set zzcfh() {
        return super.zzcfh();
    }
}
