.class public final Lcom/google/android/gms/measurement/AppMeasurementInstallReferrerReceiver;
.super Landroid/content/BroadcastReceiver;

# interfaces
.implements Lcom/google/android/gms/measurement/internal/zzu$zza;


# instance fields
.field private aqD:Lcom/google/android/gms/measurement/internal/zzu;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private zzbte()Lcom/google/android/gms/measurement/internal/zzu;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/AppMeasurementInstallReferrerReceiver;->aqD:Lcom/google/android/gms/measurement/internal/zzu;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzu;

    invoke-direct {v0, p0}, Lcom/google/android/gms/measurement/internal/zzu;-><init>(Lcom/google/android/gms/measurement/internal/zzu$zza;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/AppMeasurementInstallReferrerReceiver;->aqD:Lcom/google/android/gms/measurement/internal/zzu;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/AppMeasurementInstallReferrerReceiver;->aqD:Lcom/google/android/gms/measurement/internal/zzu;

    return-object v0
.end method


# virtual methods
.method public doStartService(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/measurement/AppMeasurementInstallReferrerReceiver;->zzbte()Lcom/google/android/gms/measurement/internal/zzu;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzu;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
