.class public Lcom/google/android/gms/internal/zzamp;
.super Ljava/lang/Object;


# direct methods
.method public static c()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    return-object v0
.end method

.method public static zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;
    .locals 4

    invoke-static {p0}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    instance-of v1, v0, Lcom/google/android/gms/internal/zzamj;

    if-eqz v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zzamd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    long-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/zzamd;-><init>(Ljava/lang/Double;Lcom/google/android/gms/internal/zzaml;)V

    move-object v0, v1

    :cond_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzamp;->zzq(Lcom/google/android/gms/internal/zzaml;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v0, Lcom/google/firebase/database/DatabaseException;

    const-string/jumbo v1, "Invalid Firebase Database priority (must be a string, double, ServerValue, or null)"

    invoke-direct {v0, v1}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-object v0
.end method

.method public static zzq(Lcom/google/android/gms/internal/zzaml;)Z
    .locals 1

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/android/gms/internal/zzamd;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/android/gms/internal/zzamr;

    if-nez v0, :cond_0

    instance-of v0, p0, Lcom/google/android/gms/internal/zzamc;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
