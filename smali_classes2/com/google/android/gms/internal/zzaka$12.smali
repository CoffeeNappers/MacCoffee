.class Lcom/google/android/gms/internal/zzaka$12;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaka;->zzt(Lcom/google/android/gms/internal/zzajq;)Ljava/util/List;
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

.field final synthetic bfr:Lcom/google/android/gms/internal/zzaka;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka$12;->bfr:Lcom/google/android/gms/internal/zzaka;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaka$12;->bdc:Lcom/google/android/gms/internal/zzajq;

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

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaka$12;->zzbym()Ljava/util/List;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$12;->bfr:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka$12;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzi(Lcom/google/android/gms/internal/zzall;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka$12;->bfr:Lcom/google/android/gms/internal/zzaka;

    new-instance v1, Lcom/google/android/gms/internal/zzakl;

    sget-object v2, Lcom/google/android/gms/internal/zzako;->bgq:Lcom/google/android/gms/internal/zzako;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka$12;->bdc:Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/internal/zzakl;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
