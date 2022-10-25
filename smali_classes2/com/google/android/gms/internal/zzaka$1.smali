.class Lcom/google/android/gms/internal/zzaka$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;JZZ)Ljava/util/List;
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
.field final synthetic bdc:Lcom/google/android/gms/internal/zzajq;

.field final synthetic bex:J

.field final synthetic bfn:Z

.field final synthetic bfo:Lcom/google/android/gms/internal/zzaml;

.field final synthetic bfp:Lcom/google/android/gms/internal/zzaml;

.field final synthetic bfq:Z

.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaka;ZLcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;JLcom/google/android/gms/internal/zzaml;Z)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$1;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzaka$1;->bfn:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaka$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzaka$1;->bfo:Lcom/google/android/gms/internal/zzaml;

    iput-wide p5, p0, Lcom/google/android/gms/internal/zzaka$1;->bex:J

    iput-object p7, p0, Lcom/google/android/gms/internal/zzaka$1;->bfp:Lcom/google/android/gms/internal/zzaml;

    iput-boolean p8, p0, Lcom/google/android/gms/internal/zzaka$1;->bfq:Z

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

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaka$1;->zzbym()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzbym()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaka$1;->bfn:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$1;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$1;->bfo:Lcom/google/android/gms/internal/zzaml;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaka$1;->bex:J

    invoke-interface {v0, v1, v2, v4, v5}, Lcom/google/android/gms/internal/zzaku;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;J)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$1;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzc(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakh;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$1;->bfp:Lcom/google/android/gms/internal/zzaml;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaka$1;->bex:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iget-boolean v4, p0, Lcom/google/android/gms/internal/zzaka$1;->bfq:Z

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Ljava/lang/Long;Z)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaka$1;->bfq:Z

    if-nez v0, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$1;->bfr:Lcom/google/android/gms/internal/zzaka;

    new-instance v1, Lcom/google/android/gms/internal/zzakp;

    sget-object v2, Lcom/google/android/gms/internal/zzako;->bgp:Lcom/google/android/gms/internal/zzako;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$1;->bdc:Lcom/google/android/gms/internal/zzajq;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaka$1;->bfp:Lcom/google/android/gms/internal/zzaml;

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzakp;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method
