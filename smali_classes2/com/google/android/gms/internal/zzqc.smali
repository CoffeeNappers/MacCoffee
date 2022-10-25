.class public Lcom/google/android/gms/internal/zzqc;
.super Lcom/google/android/gms/common/api/zzc;

# interfaces
.implements Lcom/google/android/gms/clearcut/zzb;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqc$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/zzc",
        "<",
        "Lcom/google/android/gms/common/api/Api$ApiOptions$NoOptions;",
        ">;",
        "Lcom/google/android/gms/clearcut/zzb;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/google/android/gms/clearcut/zza;->API:Lcom/google/android/gms/common/api/Api;

    const/4 v1, 0x0

    new-instance v2, Lcom/google/android/gms/internal/zzqk;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzqk;-><init>()V

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/google/android/gms/common/api/zzc;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/internal/zzsb;)V

    return-void
.end method

.method static zzb(Lcom/google/android/gms/clearcut/LogEventParcelable;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wD:Lcom/google/android/gms/clearcut/zza$zzc;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wC:Lcom/google/android/gms/internal/zzasf$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    array-length v0, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wC:Lcom/google/android/gms/internal/zzasf$zzc;

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wD:Lcom/google/android/gms/clearcut/zza$zzc;

    invoke-interface {v1}, Lcom/google/android/gms/clearcut/zza$zzc;->zzaqi()[B

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wE:Lcom/google/android/gms/clearcut/zza$zzc;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wC:Lcom/google/android/gms/internal/zzasf$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    array-length v0, v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wC:Lcom/google/android/gms/internal/zzasf$zzc;

    iget-object v1, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wE:Lcom/google/android/gms/clearcut/zza$zzc;

    invoke-interface {v1}, Lcom/google/android/gms/clearcut/zza$zzc;->zzaqi()[B

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->wC:Lcom/google/android/gms/internal/zzasf$zzc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzasa;->zzf(Lcom/google/android/gms/internal/zzasa;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/clearcut/LogEventParcelable;->ww:[B

    return-void
.end method

.method public static zzbi(Landroid/content/Context;)Lcom/google/android/gms/clearcut/zzb;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/google/android/gms/internal/zzqc;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzqc;-><init>(Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/clearcut/LogEventParcelable;)Lcom/google/android/gms/common/api/PendingResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/clearcut/LogEventParcelable;",
            ")",
            "Lcom/google/android/gms/common/api/PendingResult",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzqc$zza;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzqc;->asGoogleApiClient()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzqc$zza;-><init>(Lcom/google/android/gms/clearcut/LogEventParcelable;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzqc;->doBestEffortWrite(Lcom/google/android/gms/internal/zzqo$zza;)Lcom/google/android/gms/internal/zzqo$zza;

    move-result-object v0

    return-object v0
.end method
