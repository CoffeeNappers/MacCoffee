package com.google.android.gms.measurement.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.facebook.common.util.UriUtil;
import com.facebook.share.internal.ShareConstants;
import com.google.android.gms.internal.zzart;
import com.google.android.gms.internal.zzwa;
import com.google.android.gms.internal.zzwc;
import com.google.android.gms.measurement.AppMeasurement;
import com.vkontakte.android.api.friends.FriendsGetRequests;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.sentry.marshaller.json.JsonMarshaller;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.BitSet;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import javax.security.auth.x500.X500Principal;
/* loaded from: classes2.dex */
public class zzal extends zzz {
    /* JADX INFO: Access modifiers changed from: package-private */
    public zzal(zzx zzxVar) {
        super(zzxVar);
    }

    private Object zza(int i, Object obj, boolean z) {
        if (obj == null) {
            return null;
        }
        if ((obj instanceof Long) || (obj instanceof Double)) {
            return obj;
        }
        if (obj instanceof Integer) {
            return Long.valueOf(((Integer) obj).intValue());
        }
        if (obj instanceof Byte) {
            return Long.valueOf(((Byte) obj).byteValue());
        }
        if (obj instanceof Short) {
            return Long.valueOf(((Short) obj).shortValue());
        }
        if (obj instanceof Boolean) {
            return Long.valueOf(((Boolean) obj).booleanValue() ? 1L : 0L);
        } else if (obj instanceof Float) {
            return Double.valueOf(((Float) obj).doubleValue());
        } else {
            if (!(obj instanceof String) && !(obj instanceof Character) && !(obj instanceof CharSequence)) {
                return null;
            }
            return zza(String.valueOf(obj), i, z);
        }
    }

    public static String zza(zzwa.zzb zzbVar) {
        if (zzbVar == null) {
            return "null";
        }
        StringBuilder sb = new StringBuilder();
        sb.append("\nevent_filter {\n");
        zza(sb, 0, "filter_id", zzbVar.awd);
        zza(sb, 0, "event_name", zzbVar.awe);
        zza(sb, 1, "event_count_filter", zzbVar.awh);
        sb.append("  filters {\n");
        for (zzwa.zzc zzcVar : zzbVar.awf) {
            zza(sb, 2, zzcVar);
        }
        zza(sb, 1);
        sb.append("}\n}\n");
        return sb.toString();
    }

    public static String zza(zzwa.zze zzeVar) {
        if (zzeVar == null) {
            return "null";
        }
        StringBuilder sb = new StringBuilder();
        sb.append("\nproperty_filter {\n");
        zza(sb, 0, "filter_id", zzeVar.awd);
        zza(sb, 0, "property_name", zzeVar.awt);
        zza(sb, 1, zzeVar.awu);
        sb.append("}\n");
        return sb.toString();
    }

    private static void zza(StringBuilder sb, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            sb.append("  ");
        }
    }

    private static void zza(StringBuilder sb, int i, zzwa.zzc zzcVar) {
        if (zzcVar == null) {
            return;
        }
        zza(sb, i);
        sb.append("filter {\n");
        zza(sb, i, "complement", zzcVar.awl);
        zza(sb, i, "param_name", zzcVar.awm);
        zza(sb, i + 1, "string_filter", zzcVar.awj);
        zza(sb, i + 1, "number_filter", zzcVar.awk);
        zza(sb, i);
        sb.append("}\n");
    }

    private static void zza(StringBuilder sb, int i, zzwc.zze zzeVar) {
        if (zzeVar == null) {
            return;
        }
        zza(sb, i);
        sb.append("bundle {\n");
        zza(sb, i, "protocol_version", zzeVar.awU);
        zza(sb, i, JsonMarshaller.PLATFORM, zzeVar.axc);
        zza(sb, i, "gmp_version", zzeVar.axg);
        zza(sb, i, "uploading_gmp_version", zzeVar.axh);
        zza(sb, i, "config_version", zzeVar.axt);
        zza(sb, i, "gmp_app_id", zzeVar.aqZ);
        zza(sb, i, "app_id", zzeVar.zzcs);
        zza(sb, i, "app_version", zzeVar.aii);
        zza(sb, i, "app_version_major", zzeVar.axp);
        zza(sb, i, "firebase_instance_id", zzeVar.arh);
        zza(sb, i, "dev_cert_hash", zzeVar.axl);
        zza(sb, i, "app_store", zzeVar.ara);
        zza(sb, i, "upload_timestamp_millis", zzeVar.awX);
        zza(sb, i, "start_timestamp_millis", zzeVar.awY);
        zza(sb, i, "end_timestamp_millis", zzeVar.awZ);
        zza(sb, i, "previous_bundle_start_timestamp_millis", zzeVar.axa);
        zza(sb, i, "previous_bundle_end_timestamp_millis", zzeVar.axb);
        zza(sb, i, "app_instance_id", zzeVar.axk);
        zza(sb, i, "resettable_device_id", zzeVar.axi);
        zza(sb, i, "device_id", zzeVar.axs);
        zza(sb, i, "limited_ad_tracking", zzeVar.axj);
        zza(sb, i, "os_version", zzeVar.zzdb);
        zza(sb, i, "device_model", zzeVar.axd);
        zza(sb, i, "user_default_language", zzeVar.axe);
        zza(sb, i, "time_zone_offset_minutes", zzeVar.axf);
        zza(sb, i, "bundle_sequential_index", zzeVar.axm);
        zza(sb, i, "service_upload", zzeVar.axn);
        zza(sb, i, "health_monitor", zzeVar.ard);
        zza(sb, i, zzeVar.awW);
        zza(sb, i, zzeVar.axo);
        zza(sb, i, zzeVar.awV);
        zza(sb, i);
        sb.append("}\n");
    }

    private static void zza(StringBuilder sb, int i, String str, zzwa.zzd zzdVar) {
        if (zzdVar == null) {
            return;
        }
        zza(sb, i);
        sb.append(str);
        sb.append(" {\n");
        if (zzdVar.awn != null) {
            String str2 = "UNKNOWN_COMPARISON_TYPE";
            switch (zzdVar.awn.intValue()) {
                case 1:
                    str2 = "LESS_THAN";
                    break;
                case 2:
                    str2 = "GREATER_THAN";
                    break;
                case 3:
                    str2 = "EQUAL";
                    break;
                case 4:
                    str2 = "BETWEEN";
                    break;
            }
            zza(sb, i, "comparison_type", str2);
        }
        zza(sb, i, "match_as_float", zzdVar.awo);
        zza(sb, i, "comparison_value", zzdVar.awp);
        zza(sb, i, "min_comparison_value", zzdVar.awq);
        zza(sb, i, "max_comparison_value", zzdVar.awr);
        zza(sb, i);
        sb.append("}\n");
    }

    private static void zza(StringBuilder sb, int i, String str, zzwa.zzf zzfVar) {
        String[] strArr;
        if (zzfVar == null) {
            return;
        }
        zza(sb, i);
        sb.append(str);
        sb.append(" {\n");
        if (zzfVar.awv != null) {
            String str2 = "UNKNOWN_MATCH_TYPE";
            switch (zzfVar.awv.intValue()) {
                case 1:
                    str2 = "REGEXP";
                    break;
                case 2:
                    str2 = "BEGINS_WITH";
                    break;
                case 3:
                    str2 = "ENDS_WITH";
                    break;
                case 4:
                    str2 = "PARTIAL";
                    break;
                case 5:
                    str2 = "EXACT";
                    break;
                case 6:
                    str2 = "IN_LIST";
                    break;
            }
            zza(sb, i, "match_type", str2);
        }
        zza(sb, i, "expression", zzfVar.aww);
        zza(sb, i, "case_sensitive", zzfVar.awx);
        if (zzfVar.awy.length > 0) {
            zza(sb, i + 1);
            sb.append("expression_list {\n");
            for (String str3 : zzfVar.awy) {
                zza(sb, i + 2);
                sb.append(str3);
                sb.append("\n");
            }
            sb.append("}\n");
        }
        zza(sb, i);
        sb.append("}\n");
    }

    private static void zza(StringBuilder sb, int i, String str, zzwc.zzf zzfVar) {
        int i2 = 0;
        if (zzfVar == null) {
            return;
        }
        int i3 = i + 1;
        zza(sb, i3);
        sb.append(str);
        sb.append(" {\n");
        if (zzfVar.axv != null) {
            zza(sb, i3 + 1);
            sb.append("results: ");
            long[] jArr = zzfVar.axv;
            int length = jArr.length;
            int i4 = 0;
            int i5 = 0;
            while (i4 < length) {
                Long valueOf = Long.valueOf(jArr[i4]);
                int i6 = i5 + 1;
                if (i5 != 0) {
                    sb.append(", ");
                }
                sb.append(valueOf);
                i4++;
                i5 = i6;
            }
            sb.append('\n');
        }
        if (zzfVar.axu != null) {
            zza(sb, i3 + 1);
            sb.append("status: ");
            long[] jArr2 = zzfVar.axu;
            int length2 = jArr2.length;
            int i7 = 0;
            while (i2 < length2) {
                Long valueOf2 = Long.valueOf(jArr2[i2]);
                int i8 = i7 + 1;
                if (i7 != 0) {
                    sb.append(", ");
                }
                sb.append(valueOf2);
                i2++;
                i7 = i8;
            }
            sb.append('\n');
        }
        zza(sb, i3);
        sb.append("}\n");
    }

    private static void zza(StringBuilder sb, int i, String str, Object obj) {
        if (obj == null) {
            return;
        }
        zza(sb, i + 1);
        sb.append(str);
        sb.append(": ");
        sb.append(obj);
        sb.append('\n');
    }

    private static void zza(StringBuilder sb, int i, zzwc.zza[] zzaVarArr) {
        if (zzaVarArr == null) {
            return;
        }
        int i2 = i + 1;
        for (zzwc.zza zzaVar : zzaVarArr) {
            if (zzaVar != null) {
                zza(sb, i2);
                sb.append("audience_membership {\n");
                zza(sb, i2, "audience_id", zzaVar.avZ);
                zza(sb, i2, "new_audience", zzaVar.awL);
                zza(sb, i2, "current_data", zzaVar.awJ);
                zza(sb, i2, "previous_data", zzaVar.awK);
                zza(sb, i2);
                sb.append("}\n");
            }
        }
    }

    private static void zza(StringBuilder sb, int i, zzwc.zzb[] zzbVarArr) {
        if (zzbVarArr == null) {
            return;
        }
        int i2 = i + 1;
        for (zzwc.zzb zzbVar : zzbVarArr) {
            if (zzbVar != null) {
                zza(sb, i2);
                sb.append("event {\n");
                zza(sb, i2, "name", zzbVar.name);
                zza(sb, i2, "timestamp_millis", zzbVar.awO);
                zza(sb, i2, "previous_timestamp_millis", zzbVar.awP);
                zza(sb, i2, ServerKeys.COUNT, zzbVar.count);
                zza(sb, i2, zzbVar.awN);
                zza(sb, i2);
                sb.append("}\n");
            }
        }
    }

    private static void zza(StringBuilder sb, int i, zzwc.zzc[] zzcVarArr) {
        if (zzcVarArr == null) {
            return;
        }
        int i2 = i + 1;
        for (zzwc.zzc zzcVar : zzcVarArr) {
            if (zzcVar != null) {
                zza(sb, i2);
                sb.append("param {\n");
                zza(sb, i2, "name", zzcVar.name);
                zza(sb, i2, "string_value", zzcVar.Fe);
                zza(sb, i2, "int_value", zzcVar.awR);
                zza(sb, i2, "double_value", zzcVar.avW);
                zza(sb, i2);
                sb.append("}\n");
            }
        }
    }

    private static void zza(StringBuilder sb, int i, zzwc.zzg[] zzgVarArr) {
        if (zzgVarArr == null) {
            return;
        }
        int i2 = i + 1;
        for (zzwc.zzg zzgVar : zzgVarArr) {
            if (zzgVar != null) {
                zza(sb, i2);
                sb.append("user_property {\n");
                zza(sb, i2, "set_timestamp_millis", zzgVar.axx);
                zza(sb, i2, "name", zzgVar.name);
                zza(sb, i2, "string_value", zzgVar.Fe);
                zza(sb, i2, "int_value", zzgVar.awR);
                zza(sb, i2, "double_value", zzgVar.avW);
                zza(sb, i2);
                sb.append("}\n");
            }
        }
    }

    public static boolean zza(Context context, String str, boolean z) {
        ActivityInfo receiverInfo;
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null || (receiverInfo = packageManager.getReceiverInfo(new ComponentName(context, str), 2)) == null || !receiverInfo.enabled) {
                return false;
            }
            if (z) {
                if (!receiverInfo.exported) {
                    return false;
                }
            }
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    public static boolean zza(long[] jArr, int i) {
        return i < jArr.length * 64 && (jArr[i / 64] & (1 << (i % 64))) != 0;
    }

    public static long[] zza(BitSet bitSet) {
        int length = (bitSet.length() + 63) / 64;
        long[] jArr = new long[length];
        for (int i = 0; i < length; i++) {
            jArr[i] = 0;
            for (int i2 = 0; i2 < 64 && (i * 64) + i2 < bitSet.length(); i2++) {
                if (bitSet.get((i * 64) + i2)) {
                    jArr[i] = jArr[i] | (1 << i2);
                }
            }
        }
        return jArr;
    }

    public static String zzb(zzwc.zzd zzdVar) {
        zzwc.zze[] zzeVarArr;
        if (zzdVar == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        sb.append("\nbatch {\n");
        if (zzdVar.awS != null) {
            for (zzwc.zze zzeVar : zzdVar.awS) {
                if (zzeVar != null) {
                    zza(sb, 1, zzeVar);
                }
            }
        }
        sb.append("}\n");
        return sb.toString();
    }

    public static boolean zzbb(String str, String str2) {
        if (str == null && str2 == null) {
            return true;
        }
        if (str != null) {
            return str.equals(str2);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @WorkerThread
    public static boolean zzc(EventParcel eventParcel, AppMetadata appMetadata) {
        com.google.android.gms.common.internal.zzaa.zzy(eventParcel);
        com.google.android.gms.common.internal.zzaa.zzy(appMetadata);
        return !TextUtils.isEmpty(appMetadata.aqZ) || FriendsGetRequests.FILE_PREFIX_IN.equals(eventParcel.name);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static MessageDigest zzfl(String str) {
        MessageDigest messageDigest;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < 2) {
                try {
                    messageDigest = MessageDigest.getInstance(str);
                } catch (NoSuchAlgorithmException e) {
                }
                if (messageDigest != null) {
                    return messageDigest;
                }
                i = i2 + 1;
            } else {
                return null;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean zzmu(String str) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        return str.charAt(0) != '_';
    }

    private int zznd(String str) {
        return "_ldl".equals(str) ? zzbwd().zzbuj() : zzbwd().zzbui();
    }

    public static boolean zzne(String str) {
        return !TextUtils.isEmpty(str) && str.startsWith(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean zzng(String str) {
        return str != null && str.matches("(\\+|-)?([0-9]+\\.?[0-9]*|[0-9]*\\.?[0-9]+)") && str.length() <= 310;
    }

    public static boolean zzr(Context context, String str) {
        ServiceInfo serviceInfo;
        try {
            PackageManager packageManager = context.getPackageManager();
            if (packageManager == null || (serviceInfo = packageManager.getServiceInfo(new ComponentName(context, str), 4)) == null) {
                return false;
            }
            return serviceInfo.enabled;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    static long zzy(byte[] bArr) {
        int i = 0;
        com.google.android.gms.common.internal.zzaa.zzy(bArr);
        com.google.android.gms.common.internal.zzaa.zzbs(bArr.length > 0);
        long j = 0;
        for (int length = bArr.length - 1; length >= 0 && length >= bArr.length - 8; length--) {
            j += (bArr[length] & 255) << i;
            i += 8;
        }
        return j;
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ Context getContext() {
        return super.getContext();
    }

    public Bundle zza(String str, Bundle bundle, @Nullable List<String> list, boolean z) {
        int zzmz;
        if (bundle != null) {
            Bundle bundle2 = new Bundle(bundle);
            zzbwd().zzbuc();
            int i = 0;
            for (String str2 : bundle.keySet()) {
                if (list == null || !list.contains(str2)) {
                    zzmz = z ? zzmz(str2) : 0;
                    if (zzmz == 0) {
                        zzmz = zzna(str2);
                    }
                } else {
                    zzmz = 0;
                }
                if (zzmz != 0) {
                    if (zzd(bundle2, zzmz)) {
                        bundle2.putString("_ev", zza(str2, zzbwd().zzbuf(), true));
                        if (zzmz == 3) {
                            zzb(bundle2, str2);
                        }
                    }
                    bundle2.remove(str2);
                } else if (!zzk(str2, bundle.get(str2)) && !"_ev".equals(str2)) {
                    if (zzd(bundle2, 4)) {
                        bundle2.putString("_ev", zza(str2, zzbwd().zzbuf(), true));
                        zzb(bundle2, bundle.get(str2));
                    }
                    bundle2.remove(str2);
                } else if (!zzmu(str2) || (i = i + 1) <= 25) {
                    i = i;
                } else {
                    zzbwb().zzbwy().zze(new StringBuilder(48).append("Event can't contain more then ").append(25).append(" params").toString(), str, bundle);
                    zzd(bundle2, 5);
                    bundle2.remove(str2);
                }
            }
            return bundle2;
        }
        return null;
    }

    public String zza(String str, int i, boolean z) {
        if (str.length() > i) {
            if (!z) {
                return null;
            }
            return String.valueOf(str.substring(0, i)).concat("...");
        }
        return str;
    }

    public void zza(int i, String str, String str2, int i2) {
        Bundle bundle = new Bundle();
        zzd(bundle, i);
        if (!TextUtils.isEmpty(str)) {
            bundle.putString(str, str2);
        }
        if (i == 6 || i == 7 || i == 2) {
            bundle.putLong("_el", i2);
        }
        this.aqw.zzbvq().zzf("auto", "_err", bundle);
    }

    public void zza(Bundle bundle, String str, Object obj) {
        if (bundle == null) {
            return;
        }
        if (obj instanceof Long) {
            bundle.putLong(str, ((Long) obj).longValue());
        } else if (obj instanceof String) {
            bundle.putString(str, String.valueOf(obj));
        } else if (obj instanceof Double) {
            bundle.putDouble(str, ((Double) obj).doubleValue());
        } else if (str == null) {
        } else {
            zzbwb().zzbxb().zze("Not putting event parameter. Invalid value type. name, type", str, obj != null ? obj.getClass().getSimpleName() : null);
        }
    }

    public void zza(zzwc.zzc zzcVar, Object obj) {
        com.google.android.gms.common.internal.zzaa.zzy(obj);
        zzcVar.Fe = null;
        zzcVar.awR = null;
        zzcVar.avW = null;
        if (obj instanceof String) {
            zzcVar.Fe = (String) obj;
        } else if (obj instanceof Long) {
            zzcVar.awR = (Long) obj;
        } else if (obj instanceof Double) {
            zzcVar.avW = (Double) obj;
        } else {
            zzbwb().zzbwy().zzj("Ignoring invalid (type) event param value", obj);
        }
    }

    public void zza(zzwc.zzg zzgVar, Object obj) {
        com.google.android.gms.common.internal.zzaa.zzy(obj);
        zzgVar.Fe = null;
        zzgVar.awR = null;
        zzgVar.avW = null;
        if (obj instanceof String) {
            zzgVar.Fe = (String) obj;
        } else if (obj instanceof Long) {
            zzgVar.awR = (Long) obj;
        } else if (obj instanceof Double) {
            zzgVar.avW = (Double) obj;
        } else {
            zzbwb().zzbwy().zzj("Ignoring invalid (type) user attribute value", obj);
        }
    }

    boolean zza(String str, String str2, int i, Object obj) {
        if (obj != null && !(obj instanceof Long) && !(obj instanceof Float) && !(obj instanceof Integer) && !(obj instanceof Byte) && !(obj instanceof Short) && !(obj instanceof Boolean) && !(obj instanceof Double)) {
            if (!(obj instanceof String) && !(obj instanceof Character) && !(obj instanceof CharSequence)) {
                return false;
            }
            String valueOf = String.valueOf(obj);
            if (valueOf.length() <= i) {
                return true;
            }
            zzbwb().zzbxa().zzd("Value is too long; discarded. Value kind, name, value length", str, str2, Integer.valueOf(valueOf.length()));
            return false;
        }
        return true;
    }

    public byte[] zza(zzwc.zzd zzdVar) {
        try {
            byte[] bArr = new byte[zzdVar.cz()];
            zzart zzbe = zzart.zzbe(bArr);
            zzdVar.zza(zzbe);
            zzbe.cm();
            return bArr;
        } catch (IOException e) {
            zzbwb().zzbwy().zzj("Data loss. Failed to serialize batch", e);
            return null;
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzaby() {
        super.zzaby();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ com.google.android.gms.common.util.zze zzabz() {
        return super.zzabz();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x006a -> B:18:0x0078). Please submit an issue!!! */
    @WorkerThread
    public long zzad(Context context, String str) {
        long j = -1;
        zzzx();
        com.google.android.gms.common.internal.zzaa.zzy(context);
        com.google.android.gms.common.internal.zzaa.zzib(str);
        PackageManager packageManager = context.getPackageManager();
        MessageDigest zzfl = zzfl(CommonUtils.MD5_INSTANCE);
        if (zzfl == null) {
            zzbwb().zzbwy().log("Could not get MD5 instance");
        } else {
            if (packageManager != null) {
                try {
                } catch (PackageManager.NameNotFoundException e) {
                    zzbwb().zzbwy().zzj("Package name not found", e);
                }
                if (!zzae(context, str)) {
                    PackageInfo packageInfo = packageManager.getPackageInfo(getContext().getPackageName(), 64);
                    if (packageInfo.signatures == null || packageInfo.signatures.length <= 0) {
                        zzbwb().zzbxa().log("Could not get signatures");
                    } else {
                        j = zzy(zzfl.digest(packageInfo.signatures[0].toByteArray()));
                    }
                }
            }
            j = 0;
        }
        return j;
    }

    boolean zzae(Context context, String str) {
        X500Principal x500Principal = new X500Principal("CN=Android Debug,O=Android,C=US");
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(str, 64);
            if (packageInfo != null && packageInfo.signatures != null && packageInfo.signatures.length > 0) {
                return ((X509Certificate) CertificateFactory.getInstance("X.509").generateCertificate(new ByteArrayInputStream(packageInfo.signatures[0].toByteArray()))).getSubjectX500Principal().equals(x500Principal);
            }
        } catch (PackageManager.NameNotFoundException e) {
            zzbwb().zzbwy().zzj("Package name not found", e);
        } catch (CertificateException e2) {
            zzbwb().zzbwy().zzj("Error obtaining certificate", e2);
        }
        return true;
    }

    boolean zzaz(String str, String str2) {
        if (str2 == null) {
            zzbwb().zzbwy().zzj("Name is required and can't be null. Type", str);
            return false;
        } else if (str2.length() == 0) {
            zzbwb().zzbwy().zzj("Name is required and can't be empty. Type", str);
            return false;
        } else if (!Character.isLetter(str2.charAt(0))) {
            zzbwb().zzbwy().zze("Name must start with a letter. Type, name", str, str2);
            return false;
        } else {
            for (int i = 1; i < str2.length(); i++) {
                char charAt = str2.charAt(i);
                if (charAt != '_' && !Character.isLetterOrDigit(charAt)) {
                    zzbwb().zzbwy().zze("Name must consist of letters, digits or _ (underscores). Type, name", str, str2);
                    return false;
                }
            }
            return true;
        }
    }

    public void zzb(Bundle bundle, Object obj) {
        com.google.android.gms.common.internal.zzaa.zzy(bundle);
        if (obj != null) {
            if (!(obj instanceof String) && !(obj instanceof CharSequence)) {
                return;
            }
            bundle.putLong("_el", String.valueOf(obj).length());
        }
    }

    boolean zzba(String str, String str2) {
        if (str2 == null) {
            zzbwb().zzbwy().zzj("Name is required and can't be null. Type", str);
            return false;
        } else if (str2.length() == 0) {
            zzbwb().zzbwy().zzj("Name is required and can't be empty. Type", str);
            return false;
        } else {
            char charAt = str2.charAt(0);
            if (!Character.isLetter(charAt) && charAt != '_') {
                zzbwb().zzbwy().zze("Name must start with a letter or _ (underscores). Type, name", str, str2);
                return false;
            }
            for (int i = 1; i < str2.length(); i++) {
                char charAt2 = str2.charAt(i);
                if (charAt2 != '_' && !Character.isLetterOrDigit(charAt2)) {
                    zzbwb().zzbwy().zze("Name must consist of letters, digits or _ (underscores). Type, name", str, str2);
                    return false;
                }
            }
            return true;
        }
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzbvo() {
        super.zzbvo();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzc zzbvp() {
        return super.zzbvp();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzac zzbvq() {
        return super.zzbvq();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzn zzbvr() {
        return super.zzbvr();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzg zzbvs() {
        return super.zzbvs();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzae zzbvt() {
        return super.zzbvt();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzad zzbvu() {
        return super.zzbvu();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzo zzbvv() {
        return super.zzbvv();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zze zzbvw() {
        return super.zzbvw();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzal zzbvx() {
        return super.zzbvx();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzv zzbvy() {
        return super.zzbvy();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzag zzbvz() {
        return super.zzbvz();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzw zzbwa() {
        return super.zzbwa();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzq zzbwb() {
        return super.zzbwb();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzt zzbwc() {
        return super.zzbwc();
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ zzd zzbwd() {
        return super.zzbwd();
    }

    boolean zzc(String str, int i, String str2) {
        if (str2 == null) {
            zzbwb().zzbwy().zzj("Name is required and can't be null. Type", str);
            return false;
        } else if (str2.length() <= i) {
            return true;
        } else {
            zzbwb().zzbwy().zzd("Name is too long. Type, maximum supported length, name", str, Integer.valueOf(i), str2);
            return false;
        }
    }

    boolean zzc(String str, Map<String, String> map, String str2) {
        if (str2 == null) {
            zzbwb().zzbwy().zzj("Name is required and can't be null. Type", str);
            return false;
        } else if (str2.startsWith("firebase_")) {
            zzbwb().zzbwy().zze("Name starts with reserved prefix. Type, name", str, str2);
            return false;
        } else if (map == null || !map.containsKey(str2)) {
            return true;
        } else {
            zzbwb().zzbwy().zze("Name is reserved. Type, name", str, str2);
            return false;
        }
    }

    public boolean zzd(Bundle bundle, int i) {
        if (bundle != null && bundle.getLong("_err") == 0) {
            bundle.putLong("_err", i);
            return true;
        }
        return false;
    }

    @WorkerThread
    public boolean zzez(String str) {
        zzzx();
        if (getContext().checkCallingOrSelfPermission(str) == 0) {
            return true;
        }
        zzbwb().zzbxd().zzj("Permission not granted", str);
        return false;
    }

    public boolean zzf(long j, long j2) {
        return j == 0 || j2 <= 0 || Math.abs(zzabz().currentTimeMillis() - j) > j2;
    }

    public boolean zzk(String str, Object obj) {
        return zzne(str) ? zza("param", str, zzbwd().zzbuh(), obj) : zza("param", str, zzbwd().zzbug(), obj);
    }

    public byte[] zzk(byte[] bArr) throws IOException {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
            gZIPOutputStream.write(bArr);
            gZIPOutputStream.close();
            byteArrayOutputStream.close();
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            zzbwb().zzbwy().zzj("Failed to gzip content", e);
            throw e;
        }
    }

    public Object zzl(String str, Object obj) {
        if ("_ev".equals(str)) {
            return zza(zzbwd().zzbuh(), obj, true);
        }
        return zza(zzne(str) ? zzbwd().zzbuh() : zzbwd().zzbug(), obj, false);
    }

    public int zzm(String str, Object obj) {
        return "_ldl".equals(str) ? zza("user property referrer", str, zznd(str), obj) : zza("user property", str, zznd(str), obj) ? 0 : 7;
    }

    public int zzmv(String str) {
        if (!zzaz("event", str)) {
            return 2;
        }
        if (!zzc("event", AppMeasurement.zza.aqx, str)) {
            return 13;
        }
        return zzc("event", zzbwd().zzbud(), str) ? 0 : 2;
    }

    public int zzmw(String str) {
        if (!zzba("event", str)) {
            return 2;
        }
        if (!zzc("event", AppMeasurement.zza.aqx, str)) {
            return 13;
        }
        return zzc("event", zzbwd().zzbud(), str) ? 0 : 2;
    }

    public int zzmx(String str) {
        if (!zzaz("user property", str)) {
            return 6;
        }
        if (!zzc("user property", AppMeasurement.zzg.aqC, str)) {
            return 15;
        }
        return zzc("user property", zzbwd().zzbue(), str) ? 0 : 6;
    }

    public int zzmy(String str) {
        if (!zzba("user property", str)) {
            return 6;
        }
        if (!zzc("user property", AppMeasurement.zzg.aqC, str)) {
            return 15;
        }
        return zzc("user property", zzbwd().zzbue(), str) ? 0 : 6;
    }

    public int zzmz(String str) {
        if (!zzaz("event param", str)) {
            return 3;
        }
        if (!zzc("event param", (Map<String, String>) null, str)) {
            return 14;
        }
        return zzc("event param", zzbwd().zzbuf(), str) ? 0 : 3;
    }

    public Object zzn(String str, Object obj) {
        return "_ldl".equals(str) ? zza(zznd(str), obj, true) : zza(zznd(str), obj, false);
    }

    public int zzna(String str) {
        if (!zzba("event param", str)) {
            return 3;
        }
        if (!zzc("event param", (Map<String, String>) null, str)) {
            return 14;
        }
        return zzc("event param", zzbwd().zzbuf(), str) ? 0 : 3;
    }

    public boolean zznb(String str) {
        if (TextUtils.isEmpty(str)) {
            zzbwb().zzbwy().log("Measurement Service called without google_app_id");
            return false;
        } else if (!str.matches("^\\d+:.*")) {
            zzbwb().zzbxa().zzj("Measurement Service called with invalid id version", str);
            return false;
        } else if (!str.startsWith("1:")) {
            zzbwb().zzbxa().zzj("Measurement Service called with unknown id version", str);
            return true;
        } else if (zznc(str)) {
            return true;
        } else {
            zzbwb().zzbwy().zzj("Invalid google_app_id. Firebase Analytics disabled. See", "https://goo.gl/FZRIUV");
            return false;
        }
    }

    boolean zznc(String str) {
        com.google.android.gms.common.internal.zzaa.zzy(str);
        return str.matches("^1:\\d+:android:[a-f0-9]+$");
    }

    public boolean zznf(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        String zzbvn = zzbwd().zzbvn();
        zzbwd().zzayi();
        return zzbvn.equals(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zznh(String str) {
        return AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(zzbvy().zzaw(str, "measurement.upload.blacklist_internal"));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzni(String str) {
        return AppEventsConstants.EVENT_PARAM_VALUE_YES.equals(zzbvy().zzaw(str, "measurement.upload.blacklist_public"));
    }

    public Bundle zzu(@NonNull Uri uri) {
        String str;
        String str2;
        String str3;
        String str4;
        Bundle bundle = null;
        if (uri != null) {
            try {
                if (uri.isHierarchical()) {
                    str4 = uri.getQueryParameter("utm_campaign");
                    str3 = uri.getQueryParameter("utm_source");
                    str2 = uri.getQueryParameter("utm_medium");
                    str = uri.getQueryParameter("gclid");
                } else {
                    str = null;
                    str2 = null;
                    str3 = null;
                    str4 = null;
                }
                if (!TextUtils.isEmpty(str4) || !TextUtils.isEmpty(str3) || !TextUtils.isEmpty(str2) || !TextUtils.isEmpty(str)) {
                    bundle = new Bundle();
                    if (!TextUtils.isEmpty(str4)) {
                        bundle.putString("campaign", str4);
                    }
                    if (!TextUtils.isEmpty(str3)) {
                        bundle.putString(ShareConstants.FEED_SOURCE_PARAM, str3);
                    }
                    if (!TextUtils.isEmpty(str2)) {
                        bundle.putString("medium", str2);
                    }
                    if (!TextUtils.isEmpty(str)) {
                        bundle.putString("gclid", str);
                    }
                    String queryParameter = uri.getQueryParameter("utm_term");
                    if (!TextUtils.isEmpty(queryParameter)) {
                        bundle.putString("term", queryParameter);
                    }
                    String queryParameter2 = uri.getQueryParameter("utm_content");
                    if (!TextUtils.isEmpty(queryParameter2)) {
                        bundle.putString(UriUtil.LOCAL_CONTENT_SCHEME, queryParameter2);
                    }
                    String queryParameter3 = uri.getQueryParameter("aclid");
                    if (!TextUtils.isEmpty(queryParameter3)) {
                        bundle.putString("aclid", queryParameter3);
                    }
                    String queryParameter4 = uri.getQueryParameter("cp1");
                    if (!TextUtils.isEmpty(queryParameter4)) {
                        bundle.putString("cp1", queryParameter4);
                    }
                    String queryParameter5 = uri.getQueryParameter("anid");
                    if (!TextUtils.isEmpty(queryParameter5)) {
                        bundle.putString("anid", queryParameter5);
                    }
                }
            } catch (UnsupportedOperationException e) {
                zzbwb().zzbxa().zzj("Install referrer url isn't a hierarchical URI", e);
            }
        }
        return bundle;
    }

    public byte[] zzx(byte[] bArr) throws IOException {
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
            GZIPInputStream gZIPInputStream = new GZIPInputStream(byteArrayInputStream);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] bArr2 = new byte[1024];
            while (true) {
                int read = gZIPInputStream.read(bArr2);
                if (read <= 0) {
                    gZIPInputStream.close();
                    byteArrayInputStream.close();
                    return byteArrayOutputStream.toByteArray();
                }
                byteArrayOutputStream.write(bArr2, 0, read);
            }
        } catch (IOException e) {
            zzbwb().zzbwy().zzj("Failed to ungzip content", e);
            throw e;
        }
    }

    @WorkerThread
    public long zzz(byte[] bArr) {
        com.google.android.gms.common.internal.zzaa.zzy(bArr);
        zzzx();
        MessageDigest zzfl = zzfl(CommonUtils.MD5_INSTANCE);
        if (zzfl == null) {
            zzbwb().zzbwy().log("Failed to get MD5");
            return 0L;
        }
        return zzy(zzfl.digest(bArr));
    }

    @Override // com.google.android.gms.measurement.internal.zzz
    public /* bridge */ /* synthetic */ void zzzx() {
        super.zzzx();
    }
}
