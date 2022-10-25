package com.google.android.gms.internal;

import android.util.Base64;
import java.net.URI;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes2.dex */
class zzamy {
    private String bjM;
    private Map<String, String> bjN;
    private URI bjx;
    private String protocol;

    public zzamy(URI uri, String str, Map<String, String> map) {
        this.bjx = null;
        this.protocol = null;
        this.bjM = null;
        this.bjN = null;
        this.bjx = uri;
        this.protocol = str;
        this.bjN = map;
        this.bjM = q();
    }

    private String q() {
        byte[] bArr = new byte[16];
        for (int i = 0; i < 16; i++) {
            bArr[i] = (byte) zzac(0, 255);
        }
        return Base64.encodeToString(bArr, 2);
    }

    private String zza(LinkedHashMap<String, String> linkedHashMap) {
        String str = new String();
        Iterator<String> it = linkedHashMap.keySet().iterator();
        while (true) {
            String str2 = str;
            if (it.hasNext()) {
                String next = it.next();
                String valueOf = String.valueOf(str2);
                String str3 = linkedHashMap.get(next);
                str = new StringBuilder(String.valueOf(valueOf).length() + 4 + String.valueOf(next).length() + String.valueOf(str3).length()).append(valueOf).append(next).append(": ").append(str3).append("\r\n").toString();
            } else {
                return str2;
            }
        }
    }

    private int zzac(int i, int i2) {
        return (int) ((Math.random() * i2) + i);
    }

    public byte[] p() {
        String concat;
        String path = this.bjx.getPath();
        String query = this.bjx.getQuery();
        String valueOf = String.valueOf(path);
        if (query == null) {
            concat = "";
        } else {
            String valueOf2 = String.valueOf(query);
            concat = valueOf2.length() != 0 ? "?".concat(valueOf2) : new String("?");
        }
        String valueOf3 = String.valueOf(concat);
        String concat2 = valueOf3.length() != 0 ? valueOf.concat(valueOf3) : new String(valueOf);
        String host = this.bjx.getHost();
        if (this.bjx.getPort() != -1) {
            String valueOf4 = String.valueOf(host);
            host = new StringBuilder(String.valueOf(valueOf4).length() + 12).append(valueOf4).append(":").append(this.bjx.getPort()).toString();
        }
        LinkedHashMap<String, String> linkedHashMap = new LinkedHashMap<>();
        linkedHashMap.put("Host", host);
        linkedHashMap.put("Upgrade", "websocket");
        linkedHashMap.put("Connection", "Upgrade");
        linkedHashMap.put("Sec-WebSocket-Version", "13");
        linkedHashMap.put("Sec-WebSocket-Key", this.bjM);
        if (this.protocol != null) {
            linkedHashMap.put("Sec-WebSocket-Protocol", this.protocol);
        }
        if (this.bjN != null) {
            for (String str : this.bjN.keySet()) {
                if (!linkedHashMap.containsKey(str)) {
                    linkedHashMap.put(str, this.bjN.get(str));
                }
            }
        }
        String valueOf5 = String.valueOf(new StringBuilder(String.valueOf(concat2).length() + 15).append("GET ").append(concat2).append(" HTTP/1.1\r\n").toString());
        String valueOf6 = String.valueOf(zza(linkedHashMap));
        String concat3 = String.valueOf(valueOf6.length() != 0 ? valueOf5.concat(valueOf6) : new String(valueOf5)).concat("\r\n");
        byte[] bArr = new byte[concat3.getBytes().length];
        System.arraycopy(concat3.getBytes(), 0, bArr, 0, concat3.getBytes().length);
        return bArr;
    }

    public void zzd(HashMap<String, String> hashMap) {
        if (!hashMap.get("Upgrade").toLowerCase(Locale.US).equals("websocket")) {
            throw new zzamx("connection failed: missing header field in server handshake: Upgrade");
        }
        if (hashMap.get("Connection").toLowerCase(Locale.US).equals("upgrade")) {
            return;
        }
        throw new zzamx("connection failed: missing header field in server handshake: Connection");
    }

    public void zzsz(String str) {
        int intValue = Integer.valueOf(str.substring(9, 12)).intValue();
        if (intValue == 407) {
            throw new zzamx("connection failed: proxy authentication not supported");
        }
        if (intValue == 404) {
            throw new zzamx("connection failed: 404 not found");
        }
        if (intValue == 101) {
            return;
        }
        throw new zzamx(new StringBuilder(50).append("connection failed: unknown status code ").append(intValue).toString());
    }
}
