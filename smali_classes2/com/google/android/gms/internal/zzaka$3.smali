.class Lcom/google/android/gms/internal/zzaka$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zzg(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/util/List",
        "<+",
        "Lcom/google/android/gms/internal/zzalh;",
        ">;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;

.field final synthetic bfu:Lcom/google/android/gms/internal/zzajl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzaka$3;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzajl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaka$3;->bfu:Lcom/google/android/gms/internal/zzajl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaka$3;->zzbym()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzbym()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$3;->bfu:Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v6

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    move-object v5, v6

    move-object v7, v0

    move v3, v2

    :goto_0
    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzakz;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    if-eqz v0, :cond_12

    if-eqz v4, :cond_1

    :goto_1
    if-nez v3, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->zzcvy()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    move v0, v1

    :goto_2
    move-object v3, v4

    :goto_3
    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v4, ""

    invoke-static {v4}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v4

    :goto_4
    invoke-virtual {v7, v4}, Lcom/google/android/gms/internal/zzakz;->zze(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v7

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    move-object v5, v4

    move-object v4, v3

    move v3, v0

    goto :goto_0

    :cond_1
    invoke-virtual {v0, v5}, Lcom/google/android/gms/internal/zzajz;->zzs(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v4

    goto :goto_1

    :cond_2
    move v0, v2

    goto :goto_2

    :cond_3
    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v4

    goto :goto_4

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    if-nez v0, :cond_5

    new-instance v0, Lcom/google/android/gms/internal/zzajz;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/google/android/gms/internal/zzajz;-><init>(Lcom/google/android/gms/internal/zzaku;)V

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    iget-object v7, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v7

    invoke-virtual {v7, v6, v0}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakz;)Lcom/google/android/gms/internal/zzakz;

    move-object v11, v0

    move-object v0, v4

    move v4, v3

    move-object v3, v11

    :goto_5
    iget-object v5, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v5

    invoke-interface {v5, v8}, Lcom/google/android/gms/internal/zzaku;->zzg(Lcom/google/android/gms/internal/zzall;)V

    if-eqz v0, :cond_9

    new-instance v5, Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/zzall;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    invoke-direct {v5, v0, v1, v2}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    move-object v0, v5

    :goto_6
    invoke-virtual {v3, v8}, Lcom/google/android/gms/internal/zzajz;->zzc(Lcom/google/android/gms/internal/zzall;)Z

    move-result v1

    if-nez v1, :cond_f

    invoke-virtual {v8}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v2

    if-nez v2, :cond_f

    sget-boolean v2, Lcom/google/android/gms/internal/zzaka$3;->$assertionsDisabled:Z

    if-nez v2, :cond_e

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaka;->zze(Lcom/google/android/gms/internal/zzaka;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "View does not exist but we have a tag"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_5
    if-nez v3, :cond_6

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->zzcvy()Z

    move-result v3

    if-eqz v3, :cond_7

    :cond_6
    move v3, v1

    :goto_7
    if-eqz v4, :cond_8

    :goto_8
    move-object v11, v0

    move-object v0, v4

    move v4, v3

    move-object v3, v11

    goto :goto_5

    :cond_7
    move v3, v2

    goto :goto_7

    :cond_8
    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/google/android/gms/internal/zzajz;->zzs(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v4

    goto :goto_8

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v0

    invoke-interface {v0, v8}, Lcom/google/android/gms/internal/zzaku;->zzf(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzald;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v0

    if-eqz v0, :cond_a

    move-object v0, v7

    goto :goto_6

    :cond_a
    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/google/android/gms/internal/zzakz;->zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->zzcxf()Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_9
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzajz;

    if-eqz v1, :cond_11

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v10

    invoke-virtual {v1, v10}, Lcom/google/android/gms/internal/zzajz;->zzs(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    invoke-interface {v5, v0, v1}, Lcom/google/android/gms/internal/zzaml;->zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_a
    move-object v5, v0

    goto :goto_9

    :cond_b
    invoke-virtual {v7}, Lcom/google/android/gms/internal/zzald;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_c
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v7

    invoke-interface {v5, v7}, Lcom/google/android/gms/internal/zzaml;->zzk(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v7

    if-nez v7, :cond_c

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v7

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v5, v7, v0}, Lcom/google/android/gms/internal/zzaml;->zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v5

    goto :goto_b

    :cond_d
    new-instance v0, Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v8}, Lcom/google/android/gms/internal/zzall;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v1

    invoke-static {v5, v1}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    invoke-direct {v0, v1, v2, v2}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    goto/16 :goto_6

    :cond_e
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaka;->zzf(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakb;

    move-result-object v2

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzaka;->zze(Lcom/google/android/gms/internal/zzaka;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v5}, Lcom/google/android/gms/internal/zzaka;->zzg(Lcom/google/android/gms/internal/zzaka;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaka;->zzc(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakh;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/google/android/gms/internal/zzakh;->zzu(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaki;

    move-result-object v2

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaka$3;->bfu:Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v3, v5, v2, v0}, Lcom/google/android/gms/internal/zzajz;->zza(Lcom/google/android/gms/internal/zzajl;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzald;)Ljava/util/List;

    move-result-object v0

    if-nez v1, :cond_10

    if-nez v4, :cond_10

    invoke-virtual {v3, v8}, Lcom/google/android/gms/internal/zzajz;->zzb(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzalm;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$3;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2, v8, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzalm;)V

    :cond_10
    return-object v0

    :cond_11
    move-object v0, v5

    goto :goto_a

    :cond_12
    move v0, v3

    move-object v3, v4

    goto/16 :goto_3
.end method
