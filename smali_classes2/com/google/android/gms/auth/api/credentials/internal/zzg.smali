.class public final Lcom/google/android/gms/auth/api/credentials/internal/zzg;
.super Lcom/google/android/gms/common/internal/zzj;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/internal/zzj",
        "<",
        "Lcom/google/android/gms/auth/api/credentials/internal/zzk;",
        ">;"
    }
.end annotation


# instance fields
.field private final iV:Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .locals 7

    const/16 v3, 0x44

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/common/internal/zzj;-><init>(Landroid/content/Context;Landroid/os/Looper;ILcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    iput-object p4, p0, Lcom/google/android/gms/auth/api/credentials/internal/zzg;->iV:Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;

    return-void
.end method


# virtual methods
.method protected zzahv()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/auth/api/credentials/internal/zzg;->iV:Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/auth/api/credentials/internal/zzg;->iV:Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;->zzahv()Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0
.end method

.method zzaim()Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/auth/api/credentials/internal/zzg;->iV:Lcom/google/android/gms/auth/api/Auth$AuthCredentialsOptions;

    return-object v0
.end method

.method protected zzce(Landroid/os/IBinder;)Lcom/google/android/gms/auth/api/credentials/internal/zzk;
    .locals 1

    invoke-static {p1}, Lcom/google/android/gms/auth/api/credentials/internal/zzk$zza;->zzcg(Landroid/os/IBinder;)Lcom/google/android/gms/auth/api/credentials/internal/zzk;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic zzh(Landroid/os/IBinder;)Landroid/os/IInterface;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/auth/api/credentials/internal/zzg;->zzce(Landroid/os/IBinder;)Lcom/google/android/gms/auth/api/credentials/internal/zzk;

    move-result-object v0

    return-object v0
.end method

.method protected zzjx()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "com.google.android.gms.auth.api.credentials.service.START"

    return-object v0
.end method

.method protected zzjy()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "com.google.android.gms.auth.api.credentials.internal.ICredentialsService"

    return-object v0
.end method
