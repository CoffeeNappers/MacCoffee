.class Lcom/google/android/gms/internal/zzaka$7;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;Lcom/google/android/gms/internal/zzajh;JZ)Ljava/util/List;
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

.field final synthetic bfA:Lcom/google/android/gms/internal/zzajh;

.field final synthetic bfn:Z

.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;

.field final synthetic bfz:Lcom/google/android/gms/internal/zzajh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaka;ZLcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;JLcom/google/android/gms/internal/zzajh;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$7;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzaka$7;->bfn:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaka$7;->bdc:Lcom/google/android/gms/internal/zzajq;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzaka$7;->bfz:Lcom/google/android/gms/internal/zzajh;

    iput-wide p5, p0, Lcom/google/android/gms/internal/zzaka$7;->bex:J

    iput-object p7, p0, Lcom/google/android/gms/internal/zzaka$7;->bfA:Lcom/google/android/gms/internal/zzajh;

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

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaka$7;->zzbym()Ljava/util/List;

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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaka$7;->bfn:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$7;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$7;->bdc:Lcom/google/android/gms/internal/zzajq;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$7;->bfz:Lcom/google/android/gms/internal/zzajh;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaka$7;->bex:J

    invoke-interface {v0, v1, v2, v4, v5}, Lcom/google/android/gms/internal/zzaku;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;J)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$7;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzc(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakh;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$7;->bdc:Lcom/google/android/gms/internal/zzajq;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$7;->bfA:Lcom/google/android/gms/internal/zzajh;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaka$7;->bex:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;Ljava/lang/Long;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$7;->bfr:Lcom/google/android/gms/internal/zzaka;

    new-instance v1, Lcom/google/android/gms/internal/zzakm;

    sget-object v2, Lcom/google/android/gms/internal/zzako;->bgp:Lcom/google/android/gms/internal/zzako;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$7;->bdc:Lcom/google/android/gms/internal/zzajq;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaka$7;->bfA:Lcom/google/android/gms/internal/zzajh;

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzakm;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
