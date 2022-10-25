.class public Lcom/google/android/gms/internal/zzalj;
.super Ljava/lang/Object;


# instance fields
.field private final aZR:Lcom/google/android/gms/internal/zzalw;

.field private final bdk:Lcom/google/android/gms/internal/zzajn;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajj;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajj;->zzcur()Lcom/google/android/gms/internal/zzajn;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalj;->bdk:Lcom/google/android/gms/internal/zzajn;

    const-string/jumbo v0, "EventRaiser"

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalj;->aZR:Lcom/google/android/gms/internal/zzalw;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzalj;)Lcom/google/android/gms/internal/zzalw;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalj;->aZR:Lcom/google/android/gms/internal/zzalw;

    return-object v0
.end method


# virtual methods
.method public zzax(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalj;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalj;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x1c

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Raising "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " event(s)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalj;->bdk:Lcom/google/android/gms/internal/zzajn;

    new-instance v2, Lcom/google/android/gms/internal/zzalj$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzalj$1;-><init>(Lcom/google/android/gms/internal/zzalj;Ljava/util/ArrayList;)V

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/zzajn;->zzq(Ljava/lang/Runnable;)V

    return-void
.end method
