.class public Lcom/google/android/gms/internal/zzfr;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/google/android/gms/internal/zzfq;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzbrd:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzfq;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfr;->zzbrd:Ljava/util/List;

    return-void
.end method

.method private zzg(Lcom/google/android/gms/internal/zzmd;)Lcom/google/android/gms/internal/zzfq;
    .locals 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzhj()Lcom/google/android/gms/internal/zzfr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfr;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzfq;

    iget-object v2, v0, Lcom/google/android/gms/internal/zzfq;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    if-ne v2, p1, :cond_0

    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/android/gms/internal/zzfq;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfr;->zzbrd:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzfq;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfr;->zzbrd:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public zzb(Lcom/google/android/gms/internal/zzfq;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfr;->zzbrd:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public zze(Lcom/google/android/gms/internal/zzmd;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzfr;->zzg(Lcom/google/android/gms/internal/zzmd;)Lcom/google/android/gms/internal/zzfq;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzfq;->zzbra:Lcom/google/android/gms/internal/zzfs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzfs;->abort()V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzmd;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzfr;->zzg(Lcom/google/android/gms/internal/zzmd;)Lcom/google/android/gms/internal/zzfq;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzni()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfr;->zzbrd:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
