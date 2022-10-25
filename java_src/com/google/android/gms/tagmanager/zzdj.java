package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Logger;
import com.google.android.gms.analytics.Tracker;
/* loaded from: classes2.dex */
public class zzdj {
    private Tracker aE;
    private GoogleAnalytics aG;
    private Context mContext;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza implements Logger {
        zza() {
        }

        private static int zzaai(int i) {
            switch (i) {
                case 2:
                    return 0;
                case 3:
                case 4:
                    return 1;
                case 5:
                    return 2;
                case 6:
                default:
                    return 3;
            }
        }

        @Override // com.google.android.gms.analytics.Logger
        public void error(Exception exc) {
            zzbo.zzb("", exc);
        }

        @Override // com.google.android.gms.analytics.Logger
        public void error(String str) {
            zzbo.e(str);
        }

        @Override // com.google.android.gms.analytics.Logger
        public int getLogLevel() {
            return zzaai(zzbo.getLogLevel());
        }

        @Override // com.google.android.gms.analytics.Logger
        public void info(String str) {
            zzbo.zzdh(str);
        }

        @Override // com.google.android.gms.analytics.Logger
        public void setLogLevel(int i) {
            zzbo.zzdi("GA uses GTM logger. Please use TagManager.setLogLevel(int) instead.");
        }

        @Override // com.google.android.gms.analytics.Logger
        public void verbose(String str) {
            zzbo.v(str);
        }

        @Override // com.google.android.gms.analytics.Logger
        public void warn(String str) {
            zzbo.zzdi(str);
        }
    }

    public zzdj(Context context) {
        this.mContext = context;
    }

    private synchronized void zzpv(String str) {
        if (this.aG == null) {
            this.aG = GoogleAnalytics.getInstance(this.mContext);
            this.aG.setLogger(new zza());
            this.aE = this.aG.newTracker(str);
        }
    }

    public Tracker zzpu(String str) {
        zzpv(str);
        return this.aE;
    }
}
