package com.google.android.gms.internal;

import android.app.AlertDialog;
import android.app.DownloadManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import android.webkit.URLUtil;
import com.google.android.gms.R;
import java.util.Map;
@zzji
/* loaded from: classes.dex */
public class zzhs extends zzhv {
    private final Context mContext;
    private final Map<String, String> zzbly;

    public zzhs(zzmd zzmdVar, Map<String, String> map) {
        super(zzmdVar, "storePicture");
        this.zzbly = map;
        this.mContext = zzmdVar.zzwy();
    }

    public void execute() {
        if (this.mContext == null) {
            zzcb("Activity context is not available");
        } else if (!com.google.android.gms.ads.internal.zzu.zzgm().zzac(this.mContext).zzll()) {
            zzcb("Feature is not supported by the device.");
        } else {
            final String str = this.zzbly.get("iurl");
            if (TextUtils.isEmpty(str)) {
                zzcb("Image url cannot be empty.");
            } else if (!URLUtil.isValidUrl(str)) {
                String valueOf = String.valueOf(str);
                zzcb(valueOf.length() != 0 ? "Invalid image url: ".concat(valueOf) : new String("Invalid image url: "));
            } else {
                final String zzca = zzca(str);
                if (!com.google.android.gms.ads.internal.zzu.zzgm().zzdb(zzca)) {
                    String valueOf2 = String.valueOf(zzca);
                    zzcb(valueOf2.length() != 0 ? "Image type not recognized: ".concat(valueOf2) : new String("Image type not recognized: "));
                    return;
                }
                Resources resources = com.google.android.gms.ads.internal.zzu.zzgq().getResources();
                AlertDialog.Builder zzab = com.google.android.gms.ads.internal.zzu.zzgm().zzab(this.mContext);
                zzab.setTitle(resources != null ? resources.getString(R.string.store_picture_title) : "Save image");
                zzab.setMessage(resources != null ? resources.getString(R.string.store_picture_message) : "Allow Ad to store image in Picture gallery?");
                zzab.setPositiveButton(resources != null ? resources.getString(R.string.accept) : "Accept", new DialogInterface.OnClickListener() { // from class: com.google.android.gms.internal.zzhs.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialogInterface, int i) {
                        try {
                            ((DownloadManager) zzhs.this.mContext.getSystemService("download")).enqueue(zzhs.this.zzj(str, zzca));
                        } catch (IllegalStateException e) {
                            zzhs.this.zzcb("Could not store picture.");
                        }
                    }
                });
                zzab.setNegativeButton(resources != null ? resources.getString(R.string.decline) : "Decline", new DialogInterface.OnClickListener() { // from class: com.google.android.gms.internal.zzhs.2
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialogInterface, int i) {
                        zzhs.this.zzcb("User canceled the download.");
                    }
                });
                zzab.create().show();
            }
        }
    }

    String zzca(String str) {
        return Uri.parse(str).getLastPathSegment();
    }

    DownloadManager.Request zzj(String str, String str2) {
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(str));
        request.setDestinationInExternalPublicDir(Environment.DIRECTORY_PICTURES, str2);
        com.google.android.gms.ads.internal.zzu.zzgo().zza(request);
        return request;
    }
}
