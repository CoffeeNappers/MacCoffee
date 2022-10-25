.class Lcom/google/android/gms/internal/zzaka$8;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;
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


# instance fields
.field final synthetic bex:J

.field final synthetic bfB:Z

.field final synthetic bfC:Lcom/google/android/gms/internal/zzanf;

.field final synthetic bfn:Z

.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaka;ZJZLcom/google/android/gms/internal/zzanf;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$8;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzaka$8;->bfn:Z

    iput-wide p3, p0, Lcom/google/android/gms/internal/zzaka$8;->bex:J

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzaka$8;->bfB:Z

    iput-object p6, p0, Lcom/google/android/gms/internal/zzaka$8;->bfC:Lcom/google/android/gms/internal/zzanf;

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

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaka$8;->zzbym()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzbym()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    const/4 v6, 0x1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaka$8;->bfn:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$8;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaka$8;->bex:J

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzaku;->zzby(J)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$8;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzc(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakh;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaka$8;->bex:J

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzakh;->zzcj(J)Lcom/google/android/gms/internal/zzake;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$8;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzc(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakh;

    move-result-object v0

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaka$8;->bex:J

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/zzakh;->zzck(J)Z

    move-result v0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzaka$8;->bfB:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$8;->bfC:Lcom/google/android/gms/internal/zzanf;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcwg()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcwe()Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$8;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v3

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lcom/google/android/gms/internal/zzaku;->zzk(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    :cond_1
    :goto_0
    if-nez v0, :cond_3

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_2
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcwf()Lcom/google/android/gms/internal/zzajh;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzajh;Ljava/util/Map;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$8;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v3

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lcom/google/android/gms/internal/zzaku;->zzc(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V

    goto :goto_0

    :cond_3
    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcwg()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$8;->bfr:Lcom/google/android/gms/internal/zzaka;

    new-instance v3, Lcom/google/android/gms/internal/zzakk;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-boolean v4, p0, Lcom/google/android/gms/internal/zzaka$8;->bfB:Z

    invoke-direct {v3, v2, v1, v4}, Lcom/google/android/gms/internal/zzakk;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;Z)V

    invoke-static {v0, v3}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;

    move-result-object v0

    goto :goto_1

    :cond_5
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcwf()Lcom/google/android/gms/internal/zzajh;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajh;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move-object v1, v0

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajq;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v1, v0, v4}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    move-object v1, v0

    goto :goto_2
.end method
