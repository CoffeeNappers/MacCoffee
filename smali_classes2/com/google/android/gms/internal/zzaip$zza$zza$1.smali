.class Lcom/google/android/gms/internal/zzaip$zza$zza$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaip$zza$zza;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lcom/google/android/gms/internal/zzaip$zza$zzb;",
        ">;"
    }
.end annotation


# instance fields
.field private bax:I

.field final synthetic bay:Lcom/google/android/gms/internal/zzaip$zza$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaip$zza$zza;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bay:Lcom/google/android/gms/internal/zzaip$zza$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bay:Lcom/google/android/gms/internal/zzaip$zza$zza;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaip$zza$zza;->zza(Lcom/google/android/gms/internal/zzaip$zza$zza;)I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bax:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bax:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public synthetic next()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->zzcse()Lcom/google/android/gms/internal/zzaip$zza$zzb;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 0

    return-void
.end method

.method public zzcse()Lcom/google/android/gms/internal/zzaip$zza$zzb;
    .locals 6

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bay:Lcom/google/android/gms/internal/zzaip$zza$zza;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzaip$zza$zza;->zzb(Lcom/google/android/gms/internal/zzaip$zza$zza;)J

    move-result-wide v2

    iget v1, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bax:I

    shl-int v1, v0, v1

    int-to-long v4, v1

    and-long/2addr v2, v4

    new-instance v1, Lcom/google/android/gms/internal/zzaip$zza$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzaip$zza$zzb;-><init>()V

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    :goto_0
    iput-boolean v0, v1, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baz:Z

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    iget v0, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bax:I

    int-to-double v4, v0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-int v0, v2

    iput v0, v1, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baA:I

    iget v0, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bax:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzaip$zza$zza$1;->bax:I

    return-object v1

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
