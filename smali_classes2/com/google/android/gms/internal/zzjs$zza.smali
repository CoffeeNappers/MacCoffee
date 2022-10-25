.class Lcom/google/android/gms/internal/zzjs$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzjs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zza"
.end annotation


# instance fields
.field public final zzcqq:J

.field public final zzcqr:Lcom/google/android/gms/internal/zzjr;

.field final synthetic zzcqs:Lcom/google/android/gms/internal/zzjs;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzjs;Lcom/google/android/gms/internal/zzjr;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjs$zza;->zzcqs:Lcom/google/android/gms/internal/zzjs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzjs$zza;->zzcqq:J

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjs$zza;->zzcqr:Lcom/google/android/gms/internal/zzjr;

    return-void
.end method


# virtual methods
.method public hasExpired()Z
    .locals 4

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzjs$zza;->zzcqq:J

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbgw:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    add-long/2addr v0, v2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
