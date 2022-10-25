.class Lcom/google/android/gms/ads/internal/cache/zza$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzcz$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/cache/zza;->initialize(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzayb:Lcom/google/android/gms/ads/internal/cache/zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/cache/zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/cache/zza$2;->zzayb:Lcom/google/android/gms/ads/internal/cache/zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzk(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/cache/zza$2;->zzayb:Lcom/google/android/gms/ads/internal/cache/zza;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/cache/zza;->zzb(Lcom/google/android/gms/ads/internal/cache/zza;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/ads/internal/cache/zza$2;->zzayb:Lcom/google/android/gms/ads/internal/cache/zza;

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/cache/zza;->zza(Lcom/google/android/gms/ads/internal/cache/zza;)V

    goto :goto_0
.end method
