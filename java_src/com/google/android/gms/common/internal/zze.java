package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.support.annotation.BinderThread;
import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.util.Log;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.CommonStatusCodes;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zzs;
import com.google.android.gms.common.internal.zzt;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public abstract class zze<T extends IInterface> {
    public static final String[] DB = {"service_esmobile", "service_googleme"};
    protected AtomicInteger DA;
    private int Dj;
    private long Dk;
    private long Dl;
    private int Dm;
    private long Dn;
    private final zzl Do;
    private final Object Dp;
    private zzt Dq;
    protected zzf Dr;
    private T Ds;
    private final ArrayList<AbstractC0049zze<?>> Dt;
    private zzh Du;
    private int Dv;
    private final zzb Dw;
    private final zzc Dx;
    private final int Dy;
    private final String Dz;
    private final Context mContext;
    final Handler mHandler;
    private final com.google.android.gms.common.zzc zm;
    private final Looper zzajy;
    private final Object zzako;

    /* loaded from: classes2.dex */
    private abstract class zza extends AbstractC0049zze<Boolean> {
        public final Bundle DC;
        public final int statusCode;

        @BinderThread
        protected zza(int i, Bundle bundle) {
            super(true);
            this.statusCode = i;
            this.DC = bundle;
        }

        protected abstract boolean zzavj();

        @Override // com.google.android.gms.common.internal.zze.AbstractC0049zze
        protected void zzavk() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.common.internal.zze.AbstractC0049zze
        /* renamed from: zzc */
        public void zzv(Boolean bool) {
            PendingIntent pendingIntent = null;
            if (bool == null) {
                zze.this.zzb(1, null);
                return;
            }
            switch (this.statusCode) {
                case 0:
                    if (zzavj()) {
                        return;
                    }
                    zze.this.zzb(1, null);
                    zzm(new ConnectionResult(8, null));
                    return;
                case 10:
                    zze.this.zzb(1, null);
                    throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
                default:
                    zze.this.zzb(1, null);
                    if (this.DC != null) {
                        pendingIntent = (PendingIntent) this.DC.getParcelable("pendingIntent");
                    }
                    zzm(new ConnectionResult(this.statusCode, pendingIntent));
                    return;
            }
        }

        protected abstract void zzm(ConnectionResult connectionResult);
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        void onConnected(@Nullable Bundle bundle);

        void onConnectionSuspended(int i);
    }

    /* loaded from: classes2.dex */
    public interface zzc {
        void onConnectionFailed(@NonNull ConnectionResult connectionResult);
    }

    /* loaded from: classes2.dex */
    final class zzd extends Handler {
        public zzd(Looper looper) {
            super(looper);
        }

        private void zza(Message message) {
            AbstractC0049zze abstractC0049zze = (AbstractC0049zze) message.obj;
            abstractC0049zze.zzavk();
            abstractC0049zze.unregister();
        }

        private boolean zzb(Message message) {
            return message.what == 2 || message.what == 1 || message.what == 5;
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            PendingIntent pendingIntent = null;
            if (zze.this.DA.get() != message.arg1) {
                if (!zzb(message)) {
                    return;
                }
                zza(message);
            } else if ((message.what == 1 || message.what == 5) && !zze.this.isConnecting()) {
                zza(message);
            } else if (message.what == 3) {
                if (message.obj instanceof PendingIntent) {
                    pendingIntent = (PendingIntent) message.obj;
                }
                ConnectionResult connectionResult = new ConnectionResult(message.arg2, pendingIntent);
                zze.this.Dr.zzg(connectionResult);
                zze.this.onConnectionFailed(connectionResult);
            } else if (message.what == 4) {
                zze.this.zzb(4, null);
                if (zze.this.Dw != null) {
                    zze.this.Dw.onConnectionSuspended(message.arg2);
                }
                zze.this.onConnectionSuspended(message.arg2);
                zze.this.zza(4, 1, (int) null);
            } else if (message.what == 2 && !zze.this.isConnected()) {
                zza(message);
            } else if (zzb(message)) {
                ((AbstractC0049zze) message.obj).zzavl();
            } else {
                Log.wtf("GmsClient", new StringBuilder(45).append("Don't know how to handle message: ").append(message.what).toString(), new Exception());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: com.google.android.gms.common.internal.zze$zze  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public abstract class AbstractC0049zze<TListener> {
        private boolean DE = false;
        private TListener mListener;

        public AbstractC0049zze(TListener tlistener) {
            this.mListener = tlistener;
        }

        public void unregister() {
            zzavm();
            synchronized (zze.this.Dt) {
                zze.this.Dt.remove(this);
            }
        }

        protected abstract void zzavk();

        public void zzavl() {
            TListener tlistener;
            synchronized (this) {
                tlistener = this.mListener;
                if (this.DE) {
                    String valueOf = String.valueOf(this);
                    Log.w("GmsClient", new StringBuilder(String.valueOf(valueOf).length() + 47).append("Callback proxy ").append(valueOf).append(" being reused. This is not safe.").toString());
                }
            }
            if (tlistener != null) {
                try {
                    zzv(tlistener);
                } catch (RuntimeException e) {
                    zzavk();
                    throw e;
                }
            } else {
                zzavk();
            }
            synchronized (this) {
                this.DE = true;
            }
            unregister();
        }

        public void zzavm() {
            synchronized (this) {
                this.mListener = null;
            }
        }

        protected abstract void zzv(TListener tlistener);
    }

    /* loaded from: classes2.dex */
    public interface zzf {
        void zzg(@NonNull ConnectionResult connectionResult);
    }

    /* loaded from: classes2.dex */
    public static final class zzg extends zzs.zza {
        private zze DF;
        private final int DG;

        public zzg(@NonNull zze zzeVar, int i) {
            this.DF = zzeVar;
            this.DG = i;
        }

        private void zzavn() {
            this.DF = null;
        }

        @Override // com.google.android.gms.common.internal.zzs
        @BinderThread
        public void zza(int i, @NonNull IBinder iBinder, @Nullable Bundle bundle) {
            zzaa.zzb(this.DF, "onPostInitComplete can be called only once per call to getRemoteService");
            this.DF.zza(i, iBinder, bundle, this.DG);
            zzavn();
        }

        @Override // com.google.android.gms.common.internal.zzs
        @BinderThread
        public void zzb(int i, @Nullable Bundle bundle) {
            Log.wtf("GmsClient", "received deprecated onAccountValidationComplete callback, ignoring", new Exception());
        }
    }

    /* loaded from: classes2.dex */
    public final class zzh implements ServiceConnection {
        private final int DG;

        public zzh(int i) {
            this.DG = i;
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            if (iBinder == null) {
                zze.this.zzl(new ConnectionResult(8, null, "ServiceBroker IBinder is null"));
                return;
            }
            synchronized (zze.this.Dp) {
                zze.this.Dq = zzt.zza.zzdu(iBinder);
            }
            zze.this.zza(0, (Bundle) null, this.DG);
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName componentName) {
            synchronized (zze.this.Dp) {
                zze.this.Dq = null;
            }
            zze.this.mHandler.sendMessage(zze.this.mHandler.obtainMessage(4, this.DG, 1));
        }
    }

    /* loaded from: classes2.dex */
    protected class zzi implements zzf {
        public zzi() {
        }

        @Override // com.google.android.gms.common.internal.zze.zzf
        public void zzg(@NonNull ConnectionResult connectionResult) {
            if (connectionResult.isSuccess()) {
                zze.this.zza((zzp) null, zze.this.zzavi());
            } else if (zze.this.Dx == null) {
            } else {
                zze.this.Dx.onConnectionFailed(connectionResult);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public final class zzj extends zza {
        public final IBinder DH;

        @BinderThread
        public zzj(int i, IBinder iBinder, Bundle bundle) {
            super(i, bundle);
            this.DH = iBinder;
        }

        @Override // com.google.android.gms.common.internal.zze.zza
        protected boolean zzavj() {
            try {
                String interfaceDescriptor = this.DH.getInterfaceDescriptor();
                if (!zze.this.zzjy().equals(interfaceDescriptor)) {
                    String valueOf = String.valueOf(zze.this.zzjy());
                    Log.e("GmsClient", new StringBuilder(String.valueOf(valueOf).length() + 34 + String.valueOf(interfaceDescriptor).length()).append("service descriptor mismatch: ").append(valueOf).append(" vs. ").append(interfaceDescriptor).toString());
                    return false;
                }
                IInterface zzh = zze.this.zzh(this.DH);
                if (zzh == null || !zze.this.zza(2, 3, (int) zzh)) {
                    return false;
                }
                Bundle zzapn = zze.this.zzapn();
                if (zze.this.Dw != null) {
                    zze.this.Dw.onConnected(zzapn);
                }
                return true;
            } catch (RemoteException e) {
                Log.w("GmsClient", "service probably died");
                return false;
            }
        }

        @Override // com.google.android.gms.common.internal.zze.zza
        protected void zzm(ConnectionResult connectionResult) {
            if (zze.this.Dx != null) {
                zze.this.Dx.onConnectionFailed(connectionResult);
            }
            zze.this.onConnectionFailed(connectionResult);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public final class zzk extends zza {
        @BinderThread
        public zzk(int i, Bundle bundle) {
            super(i, bundle);
        }

        @Override // com.google.android.gms.common.internal.zze.zza
        protected boolean zzavj() {
            zze.this.Dr.zzg(ConnectionResult.wO);
            return true;
        }

        @Override // com.google.android.gms.common.internal.zze.zza
        protected void zzm(ConnectionResult connectionResult) {
            zze.this.Dr.zzg(connectionResult);
            zze.this.onConnectionFailed(connectionResult);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zze(Context context, Looper looper, int i, zzb zzbVar, zzc zzcVar, String str) {
        this(context, looper, zzl.zzcc(context), com.google.android.gms.common.zzc.zzaql(), i, (zzb) zzaa.zzy(zzbVar), (zzc) zzaa.zzy(zzcVar), str);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zze(Context context, Looper looper, zzl zzlVar, com.google.android.gms.common.zzc zzcVar, int i, zzb zzbVar, zzc zzcVar2, String str) {
        this.zzako = new Object();
        this.Dp = new Object();
        this.Dt = new ArrayList<>();
        this.Dv = 1;
        this.DA = new AtomicInteger(0);
        this.mContext = (Context) zzaa.zzb(context, "Context must not be null");
        this.zzajy = (Looper) zzaa.zzb(looper, "Looper must not be null");
        this.Do = (zzl) zzaa.zzb(zzlVar, "Supervisor must not be null");
        this.zm = (com.google.android.gms.common.zzc) zzaa.zzb(zzcVar, "API availability must not be null");
        this.mHandler = new zzd(looper);
        this.Dy = i;
        this.Dw = zzbVar;
        this.Dx = zzcVar2;
        this.Dz = str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean zza(int i, int i2, T t) {
        boolean z;
        synchronized (this.zzako) {
            if (this.Dv != i) {
                z = false;
            } else {
                zzb(i2, t);
                z = true;
            }
        }
        return z;
    }

    private void zzavb() {
        if (this.Du != null) {
            String valueOf = String.valueOf(zzjx());
            String valueOf2 = String.valueOf(zzauz());
            Log.e("GmsClient", new StringBuilder(String.valueOf(valueOf).length() + 70 + String.valueOf(valueOf2).length()).append("Calling connect() while still connected, missing disconnect() for ").append(valueOf).append(" on ").append(valueOf2).toString());
            this.Do.zzb(zzjx(), zzauz(), this.Du, zzava());
            this.DA.incrementAndGet();
        }
        this.Du = new zzh(this.DA.get());
        if (!this.Do.zza(zzjx(), zzauz(), this.Du, zzava())) {
            String valueOf3 = String.valueOf(zzjx());
            String valueOf4 = String.valueOf(zzauz());
            Log.e("GmsClient", new StringBuilder(String.valueOf(valueOf3).length() + 34 + String.valueOf(valueOf4).length()).append("unable to connect to service: ").append(valueOf3).append(" on ").append(valueOf4).toString());
            zza(16, (Bundle) null, this.DA.get());
        }
    }

    private void zzavc() {
        if (this.Du != null) {
            this.Do.zzb(zzjx(), zzauz(), this.Du, zzava());
            this.Du = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzb(int i, T t) {
        boolean z = true;
        if ((i == 3) != (t != null)) {
            z = false;
        }
        zzaa.zzbt(z);
        synchronized (this.zzako) {
            this.Dv = i;
            this.Ds = t;
            zzc(i, t);
            switch (i) {
                case 1:
                    zzavc();
                    break;
                case 2:
                    zzavb();
                    break;
                case 3:
                    zza((zze<T>) t);
                    break;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzl(ConnectionResult connectionResult) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(3, this.DA.get(), connectionResult.getErrorCode(), connectionResult.getResolution()));
    }

    public void disconnect() {
        this.DA.incrementAndGet();
        synchronized (this.Dt) {
            int size = this.Dt.size();
            for (int i = 0; i < size; i++) {
                this.Dt.get(i).zzavm();
            }
            this.Dt.clear();
        }
        synchronized (this.Dp) {
            this.Dq = null;
        }
        zzb(1, null);
    }

    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int i;
        T t;
        synchronized (this.zzako) {
            i = this.Dv;
            t = this.Ds;
        }
        printWriter.append((CharSequence) str).append("mConnectState=");
        switch (i) {
            case 1:
                printWriter.print("DISCONNECTED");
                break;
            case 2:
                printWriter.print("CONNECTING");
                break;
            case 3:
                printWriter.print("CONNECTED");
                break;
            case 4:
                printWriter.print("DISCONNECTING");
                break;
            default:
                printWriter.print("UNKNOWN");
                break;
        }
        printWriter.append(" mService=");
        if (t == null) {
            printWriter.println("null");
        } else {
            printWriter.append((CharSequence) zzjy()).append("@").println(Integer.toHexString(System.identityHashCode(t.asBinder())));
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
        if (this.Dl > 0) {
            PrintWriter append = printWriter.append((CharSequence) str).append("lastConnectedTime=");
            long j = this.Dl;
            String valueOf = String.valueOf(simpleDateFormat.format(new Date(this.Dl)));
            append.println(new StringBuilder(String.valueOf(valueOf).length() + 21).append(j).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf).toString());
        }
        if (this.Dk > 0) {
            printWriter.append((CharSequence) str).append("lastSuspendedCause=");
            switch (this.Dj) {
                case 1:
                    printWriter.append("CAUSE_SERVICE_DISCONNECTED");
                    break;
                case 2:
                    printWriter.append("CAUSE_NETWORK_LOST");
                    break;
                default:
                    printWriter.append((CharSequence) String.valueOf(this.Dj));
                    break;
            }
            PrintWriter append2 = printWriter.append(" lastSuspendedTime=");
            long j2 = this.Dk;
            String valueOf2 = String.valueOf(simpleDateFormat.format(new Date(this.Dk)));
            append2.println(new StringBuilder(String.valueOf(valueOf2).length() + 21).append(j2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf2).toString());
        }
        if (this.Dn > 0) {
            printWriter.append((CharSequence) str).append("lastFailedStatus=").append((CharSequence) CommonStatusCodes.getStatusCodeString(this.Dm));
            PrintWriter append3 = printWriter.append(" lastFailedTime=");
            long j3 = this.Dn;
            String valueOf3 = String.valueOf(simpleDateFormat.format(new Date(this.Dn)));
            append3.println(new StringBuilder(String.valueOf(valueOf3).length() + 21).append(j3).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(valueOf3).toString());
        }
    }

    public Account getAccount() {
        return null;
    }

    public final Context getContext() {
        return this.mContext;
    }

    public final Looper getLooper() {
        return this.zzajy;
    }

    public boolean isConnected() {
        boolean z;
        synchronized (this.zzako) {
            z = this.Dv == 3;
        }
        return z;
    }

    public boolean isConnecting() {
        boolean z;
        synchronized (this.zzako) {
            z = this.Dv == 2;
        }
        return z;
    }

    @CallSuper
    protected void onConnectionFailed(ConnectionResult connectionResult) {
        this.Dm = connectionResult.getErrorCode();
        this.Dn = System.currentTimeMillis();
    }

    @CallSuper
    protected void onConnectionSuspended(int i) {
        this.Dj = i;
        this.Dk = System.currentTimeMillis();
    }

    protected void zza(int i, @Nullable Bundle bundle, int i2) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(5, i2, -1, new zzk(i, bundle)));
    }

    @BinderThread
    protected void zza(int i, IBinder iBinder, Bundle bundle, int i2) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(1, i2, -1, new zzj(i, iBinder, bundle)));
    }

    @CallSuper
    protected void zza(@NonNull T t) {
        this.Dl = System.currentTimeMillis();
    }

    public void zza(@NonNull zzf zzfVar) {
        this.Dr = (zzf) zzaa.zzb(zzfVar, "Connection progress callbacks cannot be null.");
        zzb(2, null);
    }

    public void zza(zzf zzfVar, ConnectionResult connectionResult) {
        this.Dr = (zzf) zzaa.zzb(zzfVar, "Connection progress callbacks cannot be null.");
        this.mHandler.sendMessage(this.mHandler.obtainMessage(3, this.DA.get(), connectionResult.getErrorCode(), connectionResult.getResolution()));
    }

    @WorkerThread
    public void zza(zzp zzpVar, Set<Scope> set) {
        GetServiceRequest zzo = new GetServiceRequest(this.Dy).zzhv(this.mContext.getPackageName()).zzo(zzahv());
        if (set != null) {
            zzo.zzf(set);
        }
        if (zzain()) {
            zzo.zze(zzave()).zzb(zzpVar);
        } else if (zzavh()) {
            zzo.zze(getAccount());
        }
        try {
            synchronized (this.Dp) {
                if (this.Dq != null) {
                    this.Dq.zza(new zzg(this, this.DA.get()), zzo);
                } else {
                    Log.w("GmsClient", "mServiceBroker is null, client disconnected");
                }
            }
        } catch (DeadObjectException e) {
            Log.w("GmsClient", "service died");
            zzgk(1);
        } catch (RemoteException e2) {
            Log.w("GmsClient", "Remote exception occurred", e2);
        } catch (SecurityException e3) {
            throw e3;
        } catch (RuntimeException e4) {
            Log.w("GmsClient", "IGmsServiceBroker.getService failed", e4);
            zzl(new ConnectionResult(8, null, "IGmsServiceBroker.getService failed."));
        }
    }

    protected Bundle zzahv() {
        return new Bundle();
    }

    public boolean zzain() {
        return false;
    }

    public boolean zzajc() {
        return false;
    }

    public Intent zzajd() {
        throw new UnsupportedOperationException("Not a sign in API");
    }

    public Bundle zzapn() {
        return null;
    }

    public boolean zzaqx() {
        return true;
    }

    @Nullable
    public IBinder zzaqy() {
        IBinder asBinder;
        synchronized (this.Dp) {
            asBinder = this.Dq == null ? null : this.Dq.asBinder();
        }
        return asBinder;
    }

    protected String zzauz() {
        return "com.google.android.gms";
    }

    @Nullable
    protected final String zzava() {
        return this.Dz == null ? this.mContext.getClass().getName() : this.Dz;
    }

    public void zzavd() {
        int isGooglePlayServicesAvailable = this.zm.isGooglePlayServicesAvailable(this.mContext);
        if (isGooglePlayServicesAvailable == 0) {
            zza(new zzi());
            return;
        }
        zzb(1, null);
        this.Dr = new zzi();
        this.mHandler.sendMessage(this.mHandler.obtainMessage(3, this.DA.get(), isGooglePlayServicesAvailable));
    }

    public final Account zzave() {
        return getAccount() != null ? getAccount() : new Account("<<default account>>", "com.google");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void zzavf() {
        if (!isConnected()) {
            throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
        }
    }

    public final T zzavg() throws DeadObjectException {
        T t;
        synchronized (this.zzako) {
            if (this.Dv == 4) {
                throw new DeadObjectException();
            }
            zzavf();
            zzaa.zza(this.Ds != null, "Client is connected but service is null");
            t = this.Ds;
        }
        return t;
    }

    public boolean zzavh() {
        return false;
    }

    protected Set<Scope> zzavi() {
        return Collections.EMPTY_SET;
    }

    void zzc(int i, T t) {
    }

    public void zzgk(int i) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(4, this.DA.get(), i));
    }

    @Nullable
    protected abstract T zzh(IBinder iBinder);

    @NonNull
    protected abstract String zzjx();

    @NonNull
    protected abstract String zzjy();
}
