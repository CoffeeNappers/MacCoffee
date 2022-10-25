.class Lcom/google/android/gms/internal/zzaka$13;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;
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
.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;

.field final synthetic bfs:Lcom/google/android/gms/internal/zzakb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$13;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaka$13;->bfs:Lcom/google/android/gms/internal/zzakb;

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

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaka$13;->zzbym()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzbym()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$13;->bfr:Lcom/google/android/gms/internal/zzaka;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$13;->bfs:Lcom/google/android/gms/internal/zzakb;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakb;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$13;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzaku;->zzi(Lcom/google/android/gms/internal/zzall;)V

    new-instance v1, Lcom/google/android/gms/internal/zzakl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzako;->zzc(Lcom/google/android/gms/internal/zzalk;)Lcom/google/android/gms/internal/zzako;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzakl;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka$13;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v2, v0, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method
