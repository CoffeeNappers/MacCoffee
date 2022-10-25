.class public Lcom/google/android/gms/internal/zzajw;
.super Ljava/lang/Object;


# direct methods
.method public static zza(Lcom/google/android/gms/internal/zzajh;Ljava/util/Map;)Lcom/google/android/gms/internal/zzajh;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajh;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/internal/zzajh;"
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzajh;->zzcue()Lcom/google/android/gms/internal/zzajh;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajh;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v2, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzajq;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaml;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/internal/zzajh;->zze(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v0

    move-object v2, v0

    goto :goto_0

    :cond_0
    return-object v2
.end method

.method public static zza(Lcom/google/android/gms/internal/zzajy;Ljava/util/Map;)Lcom/google/android/gms/internal/zzajy;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajy;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/internal/zzajy;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzajy;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzajy;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    const-string/jumbo v2, ""

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/internal/zzajw$1;

    invoke-direct {v2, v0, p1}, Lcom/google/android/gms/internal/zzajw$1;-><init>(Lcom/google/android/gms/internal/zzajy;Ljava/util/Map;)V

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/internal/zzajy;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajy$zzb;)V

    return-object v0
.end method

.method public static zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaml;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/internal/zzaml;"
        }
    .end annotation

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v0, v1, Ljava/util/Map;

    if-eqz v0, :cond_0

    move-object v0, v1

    check-cast v0, Ljava/util/Map;

    const-string/jumbo v2, ".sv"

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v1, ".sv"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    :cond_0
    invoke-static {v1}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/google/android/gms/internal/zzajw;->zza(Ljava/lang/Object;Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzamm;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p0

    :cond_2
    :goto_0
    return-object p0

    :cond_3
    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    check-cast p0, Lcom/google/android/gms/internal/zzama;

    new-instance v1, Lcom/google/android/gms/internal/zzajx;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzajx;-><init>(Lcom/google/android/gms/internal/zzaml;)V

    new-instance v2, Lcom/google/android/gms/internal/zzajw$2;

    invoke-direct {v2, p1, v1}, Lcom/google/android/gms/internal/zzajw$2;-><init>(Ljava/util/Map;Lcom/google/android/gms/internal/zzajx;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/zzama;->zza(Lcom/google/android/gms/internal/zzama$zza;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajx;->zzcvw()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajx;->zzcvw()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzaml;->zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p0

    goto :goto_0

    :cond_4
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajx;->zzcvw()Lcom/google/android/gms/internal/zzaml;

    move-result-object p0

    goto :goto_0
.end method

.method public static zza(Ljava/lang/Object;Ljava/util/Map;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Ljava/util/Map;

    const-string/jumbo v1, ".sv"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, ".sv"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzanf;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "timestamp"

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzanf;->z()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
