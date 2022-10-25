package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.vkontakte.android.data.ServerKeys;
import java.io.BufferedOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzff implements zzfe {
    private final Context mContext;
    private final VersionInfoParcel zzanu;

    /* JADX INFO: Access modifiers changed from: package-private */
    @zzji
    /* loaded from: classes.dex */
    public static class zza {
        private final String mValue;
        private final String zzbcn;

        public zza(String str, String str2) {
            this.zzbcn = str;
            this.mValue = str2;
        }

        public String getKey() {
            return this.zzbcn;
        }

        public String getValue() {
            return this.mValue;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @zzji
    /* loaded from: classes.dex */
    public static class zzb {
        private final String zzbqi;
        private final URL zzbqj;
        private final ArrayList<zza> zzbqk;
        private final String zzbql;

        public zzb(String str, URL url, ArrayList<zza> arrayList, String str2) {
            this.zzbqi = str;
            this.zzbqj = url;
            if (arrayList == null) {
                this.zzbqk = new ArrayList<>();
            } else {
                this.zzbqk = arrayList;
            }
            this.zzbql = str2;
        }

        public String zznc() {
            return this.zzbqi;
        }

        public URL zznd() {
            return this.zzbqj;
        }

        public ArrayList<zza> zzne() {
            return this.zzbqk;
        }

        public String zznf() {
            return this.zzbql;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @zzji
    /* loaded from: classes.dex */
    public class zzc {
        private final zzd zzbqm;
        private final boolean zzbqn;
        private final String zzbqo;

        public zzc(boolean z, zzd zzdVar, String str) {
            this.zzbqn = z;
            this.zzbqm = zzdVar;
            this.zzbqo = str;
        }

        public String getReason() {
            return this.zzbqo;
        }

        public boolean isSuccess() {
            return this.zzbqn;
        }

        public zzd zzng() {
            return this.zzbqm;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @zzji
    /* loaded from: classes.dex */
    public static class zzd {
        private final String zzbna;
        private final String zzbqi;
        private final int zzbqp;
        private final List<zza> zzbqq;

        public zzd(String str, int i, List<zza> list, String str2) {
            this.zzbqi = str;
            this.zzbqp = i;
            if (list == null) {
                this.zzbqq = new ArrayList();
            } else {
                this.zzbqq = list;
            }
            this.zzbna = str2;
        }

        public String getBody() {
            return this.zzbna;
        }

        public int getResponseCode() {
            return this.zzbqp;
        }

        public String zznc() {
            return this.zzbqi;
        }

        public Iterable<zza> zznh() {
            return this.zzbqq;
        }
    }

    public zzff(Context context, VersionInfoParcel versionInfoParcel) {
        this.mContext = context;
        this.zzanu = versionInfoParcel;
    }

    protected zzc zza(zzb zzbVar) {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) zzbVar.zznd().openConnection();
            com.google.android.gms.ads.internal.zzu.zzgm().zza(this.mContext, this.zzanu.zzda, false, httpURLConnection);
            Iterator<zza> it = zzbVar.zzne().iterator();
            while (it.hasNext()) {
                zza next = it.next();
                httpURLConnection.addRequestProperty(next.getKey(), next.getValue());
            }
            if (!TextUtils.isEmpty(zzbVar.zznf())) {
                httpURLConnection.setDoOutput(true);
                byte[] bytes = zzbVar.zznf().getBytes();
                httpURLConnection.setFixedLengthStreamingMode(bytes.length);
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(httpURLConnection.getOutputStream());
                bufferedOutputStream.write(bytes);
                bufferedOutputStream.close();
            }
            ArrayList arrayList = new ArrayList();
            if (httpURLConnection.getHeaderFields() != null) {
                for (Map.Entry<String, List<String>> entry : httpURLConnection.getHeaderFields().entrySet()) {
                    for (String str : entry.getValue()) {
                        arrayList.add(new zza(entry.getKey(), str));
                    }
                }
            }
            return new zzc(true, new zzd(zzbVar.zznc(), httpURLConnection.getResponseCode(), arrayList, com.google.android.gms.ads.internal.zzu.zzgm().zza(new InputStreamReader(httpURLConnection.getInputStream()))), null);
        } catch (Exception e) {
            return new zzc(false, null, e.toString());
        }
    }

    protected JSONObject zza(zzd zzdVar) {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("http_request_id", zzdVar.zznc());
            if (zzdVar.getBody() != null) {
                jSONObject.put(TtmlNode.TAG_BODY, zzdVar.getBody());
            }
            JSONArray jSONArray = new JSONArray();
            for (zza zzaVar : zzdVar.zznh()) {
                jSONArray.put(new JSONObject().put("key", zzaVar.getKey()).put("value", zzaVar.getValue()));
            }
            jSONObject.put("headers", jSONArray);
            jSONObject.put("response_code", zzdVar.getResponseCode());
        } catch (JSONException e) {
            zzkx.zzb("Error constructing JSON for http response.", e);
        }
        return jSONObject;
    }

    @Override // com.google.android.gms.internal.zzfe
    public void zza(final zzmd zzmdVar, final Map<String, String> map) {
        zzla.zza(new Runnable() { // from class: com.google.android.gms.internal.zzff.1
            @Override // java.lang.Runnable
            public void run() {
                zzkx.zzdg("Received Http request.");
                final JSONObject zzbc = zzff.this.zzbc((String) map.get("http_request"));
                if (zzbc == null) {
                    zzkx.e("Response should not be null.");
                } else {
                    zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzff.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            zzmdVar.zzb("fetchHttpRequestCompleted", zzbc);
                            zzkx.zzdg("Dispatched http response.");
                        }
                    });
                }
            }
        });
    }

    protected zzb zzb(JSONObject jSONObject) {
        URL url;
        String optString = jSONObject.optString("http_request_id");
        String optString2 = jSONObject.optString("url");
        String optString3 = jSONObject.optString("post_body", null);
        try {
            url = new URL(optString2);
        } catch (MalformedURLException e) {
            zzkx.zzb("Error constructing http request.", e);
            url = null;
        }
        ArrayList arrayList = new ArrayList();
        JSONArray optJSONArray = jSONObject.optJSONArray("headers");
        if (optJSONArray == null) {
            optJSONArray = new JSONArray();
        }
        for (int i = 0; i < optJSONArray.length(); i++) {
            JSONObject optJSONObject = optJSONArray.optJSONObject(i);
            if (optJSONObject != null) {
                arrayList.add(new zza(optJSONObject.optString("key"), optJSONObject.optString("value")));
            }
        }
        return new zzb(optString, url, arrayList, optString3);
    }

    public JSONObject zzbc(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            JSONObject jSONObject2 = new JSONObject();
            String str2 = "";
            try {
                str2 = jSONObject.optString("http_request_id");
                zzc zza2 = zza(zzb(jSONObject));
                if (zza2.isSuccess()) {
                    jSONObject2.put(ServerKeys.RESPONSE, zza(zza2.zzng()));
                    jSONObject2.put("success", true);
                } else {
                    jSONObject2.put(ServerKeys.RESPONSE, new JSONObject().put("http_request_id", str2));
                    jSONObject2.put("success", false);
                    jSONObject2.put("reason", zza2.getReason());
                }
                return jSONObject2;
            } catch (Exception e) {
                try {
                    jSONObject2.put(ServerKeys.RESPONSE, new JSONObject().put("http_request_id", str2));
                    jSONObject2.put("success", false);
                    jSONObject2.put("reason", e.toString());
                    return jSONObject2;
                } catch (JSONException e2) {
                    return jSONObject2;
                }
            }
        } catch (JSONException e3) {
            zzkx.e("The request is not a valid JSON.");
            try {
                return new JSONObject().put("success", false);
            } catch (JSONException e4) {
                return new JSONObject();
            }
        }
    }
}
