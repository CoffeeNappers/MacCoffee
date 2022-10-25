.class public final Lcom/google/android/gms/internal/zznb;
.super Lcom/google/android/gms/analytics/zzg;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/analytics/zzg",
        "<",
        "Lcom/google/android/gms/internal/zznb;",
        ">;"
    }
.end annotation


# instance fields
.field private ci:Ljava/lang/String;

.field private cj:Ljava/lang/String;

.field private ck:Ljava/lang/String;

.field private cl:Ljava/lang/String;

.field private cm:Z

.field private cn:Ljava/lang/String;

.field private co:Z

.field private cp:D


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/zzg;-><init>()V

    return-void
.end method


# virtual methods
.method public getUserId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->ck:Ljava/lang/String;

    return-object v0
.end method

.method public setClientId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zznb;->cj:Ljava/lang/String;

    return-void
.end method

.method public setSampleRate(D)V
    .locals 3

    const-wide/16 v0, 0x0

    cmpl-double v0, p1, v0

    if-ltz v0, :cond_0

    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    cmpg-double v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string/jumbo v1, "Sample rate must be between 0% and 100%"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzaa;->zzb(ZLjava/lang/Object;)V

    iput-wide p1, p0, Lcom/google/android/gms/internal/zznb;->cp:D

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zznb;->ck:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "hitType"

    iget-object v2, p0, Lcom/google/android/gms/internal/zznb;->ci:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "clientId"

    iget-object v2, p0, Lcom/google/android/gms/internal/zznb;->cj:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "userId"

    iget-object v2, p0, Lcom/google/android/gms/internal/zznb;->ck:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "androidAdId"

    iget-object v2, p0, Lcom/google/android/gms/internal/zznb;->cl:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "AdTargetingEnabled"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zznb;->cm:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "sessionControl"

    iget-object v2, p0, Lcom/google/android/gms/internal/zznb;->cn:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "nonInteraction"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zznb;->co:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "sampleRate"

    iget-wide v2, p0, Lcom/google/android/gms/internal/zznb;->cp:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/google/android/gms/internal/zznb;->zzj(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zznb;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->ci:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->ci:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zznb;->zzeh(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cj:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cj:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zznb;->setClientId(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->ck:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->ck:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zznb;->setUserId(Ljava/lang/String;)V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zznb;->zzei(Ljava/lang/String;)V

    :cond_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zznb;->cm:Z

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zznb;->zzas(Z)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cn:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cn:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zznb;->zzej(Ljava/lang/String;)V

    :cond_5
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zznb;->co:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zznb;->co:Z

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zznb;->zzat(Z)V

    :cond_6
    iget-wide v0, p0, Lcom/google/android/gms/internal/zznb;->cp:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_7

    iget-wide v0, p0, Lcom/google/android/gms/internal/zznb;->cp:D

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zznb;->setSampleRate(D)V

    :cond_7
    return-void
.end method

.method public zzaba()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->ci:Ljava/lang/String;

    return-object v0
.end method

.method public zzabb()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cl:Ljava/lang/String;

    return-object v0
.end method

.method public zzabc()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zznb;->cm:Z

    return v0
.end method

.method public zzabd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cn:Ljava/lang/String;

    return-object v0
.end method

.method public zzabe()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zznb;->co:Z

    return v0
.end method

.method public zzabf()D
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zznb;->cp:D

    return-wide v0
.end method

.method public zzas(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zznb;->cm:Z

    return-void
.end method

.method public zzat(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zznb;->co:Z

    return-void
.end method

.method public synthetic zzb(Lcom/google/android/gms/analytics/zzg;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zznb;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zznb;->zza(Lcom/google/android/gms/internal/zznb;)V

    return-void
.end method

.method public zzeh(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zznb;->ci:Ljava/lang/String;

    return-void
.end method

.method public zzei(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zznb;->cl:Ljava/lang/String;

    return-void
.end method

.method public zzej(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zznb;->cn:Ljava/lang/String;

    return-void
.end method

.method public zzze()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zznb;->cj:Ljava/lang/String;

    return-object v0
.end method
