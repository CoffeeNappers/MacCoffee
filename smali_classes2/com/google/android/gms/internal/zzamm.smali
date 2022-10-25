.class public Lcom/google/android/gms/internal/zzamm;
.super Ljava/lang/Object;


# direct methods
.method public static zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)I
    .locals 1

    invoke-interface {p1, p3}, Lcom/google/android/gms/internal/zzaml;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzalz;->zzi(Lcom/google/android/gms/internal/zzalz;)I

    move-result v0

    goto :goto_0
.end method

.method public static zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/database/DatabaseException;
        }
    .end annotation

    :try_start_0
    instance-of v2, p0, Ljava/util/Map;

    if-eqz v2, :cond_11

    move-object v0, p0

    check-cast v0, Ljava/util/Map;

    move-object v2, v0

    const-string/jumbo v3, ".priority"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string/jumbo v3, ".priority"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p1

    :cond_0
    const-string/jumbo v3, ".value"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    const-string/jumbo v3, ".value"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v2, p0

    :goto_0
    if-nez v2, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v2

    :goto_1
    return-object v2

    :cond_1
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_2

    new-instance v3, Lcom/google/android/gms/internal/zzamr;

    check-cast v2, Ljava/lang/String;

    invoke-direct {v3, v2, p1}, Lcom/google/android/gms/internal/zzamr;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzaml;)V

    move-object v2, v3

    goto :goto_1

    :cond_2
    instance-of v3, v2, Ljava/lang/Long;

    if-eqz v3, :cond_3

    new-instance v3, Lcom/google/android/gms/internal/zzamj;

    check-cast v2, Ljava/lang/Long;

    invoke-direct {v3, v2, p1}, Lcom/google/android/gms/internal/zzamj;-><init>(Ljava/lang/Long;Lcom/google/android/gms/internal/zzaml;)V

    move-object v2, v3

    goto :goto_1

    :cond_3
    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_4

    new-instance v3, Lcom/google/android/gms/internal/zzamj;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v4, v2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v3, v2, p1}, Lcom/google/android/gms/internal/zzamj;-><init>(Ljava/lang/Long;Lcom/google/android/gms/internal/zzaml;)V

    move-object v2, v3

    goto :goto_1

    :cond_4
    instance-of v3, v2, Ljava/lang/Double;

    if-eqz v3, :cond_5

    new-instance v3, Lcom/google/android/gms/internal/zzamd;

    check-cast v2, Ljava/lang/Double;

    invoke-direct {v3, v2, p1}, Lcom/google/android/gms/internal/zzamd;-><init>(Ljava/lang/Double;Lcom/google/android/gms/internal/zzaml;)V

    move-object v2, v3

    goto :goto_1

    :cond_5
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_6

    new-instance v3, Lcom/google/android/gms/internal/zzaly;

    check-cast v2, Ljava/lang/Boolean;

    invoke-direct {v3, v2, p1}, Lcom/google/android/gms/internal/zzaly;-><init>(Ljava/lang/Boolean;Lcom/google/android/gms/internal/zzaml;)V

    move-object v2, v3

    goto :goto_1

    :cond_6
    instance-of v3, v2, Ljava/util/Map;

    if-nez v3, :cond_7

    instance-of v3, v2, Ljava/util/List;

    if-eqz v3, :cond_e

    :cond_7
    instance-of v3, v2, Ljava/util/Map;

    if-eqz v3, :cond_b

    check-cast v2, Ljava/util/Map;

    const-string/jumbo v3, ".sv"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    new-instance v3, Lcom/google/android/gms/internal/zzamc;

    invoke-direct {v3, v2, p1}, Lcom/google/android/gms/internal/zzamc;-><init>(Ljava/util/Map;Lcom/google/android/gms/internal/zzaml;)V

    move-object v2, v3

    goto :goto_1

    :cond_8
    new-instance v4, Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v3

    invoke-direct {v4, v3}, Ljava/util/HashMap;-><init>(I)V

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_9
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string/jumbo v6, "."

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_9

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v6

    invoke-interface {v6}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_9

    invoke-static {v3}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-interface {v4, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    new-instance v3, Lcom/google/firebase/database/DatabaseException;

    const-string/jumbo v4, "Failed to parse node"

    invoke-direct {v3, v4, v2}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :cond_a
    move-object v2, v4

    :goto_3
    :try_start_1
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v2

    goto/16 :goto_1

    :cond_b
    check-cast v2, Ljava/util/List;

    new-instance v3, Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    const/4 v4, 0x0

    :goto_4
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_10

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0xb

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v6

    invoke-interface {v6}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_c

    invoke-static {v5}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v5

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    :cond_d
    sget-object v3, Lcom/google/android/gms/internal/zzama;->biy:Ljava/util/Comparator;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzaih$zza;->zzb(Ljava/util/Map;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v3

    new-instance v2, Lcom/google/android/gms/internal/zzama;

    invoke-direct {v2, v3, p1}, Lcom/google/android/gms/internal/zzama;-><init>(Lcom/google/android/gms/internal/zzaih;Lcom/google/android/gms/internal/zzaml;)V

    goto/16 :goto_1

    :cond_e
    new-instance v3, Lcom/google/firebase/database/DatabaseException;

    const-string/jumbo v4, "Failed to parse node with class "

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_f

    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_5
    invoke-direct {v3, v2}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_f
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5

    :cond_10
    move-object v2, v3

    goto :goto_3

    :cond_11
    move-object v2, p0

    goto/16 :goto_0
.end method

.method public static zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/database/DatabaseException;
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/android/gms/internal/zzamm;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method
