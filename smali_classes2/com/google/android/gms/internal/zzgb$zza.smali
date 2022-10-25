.class Lcom/google/android/gms/internal/zzgb$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzgb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zza"
.end annotation


# instance fields
.field zzbss:Lcom/google/android/gms/ads/internal/zzl;

.field zzbst:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field zzbsu:Lcom/google/android/gms/internal/zzfx;

.field zzbsv:J

.field zzbsw:Z

.field zzbsx:Z

.field final synthetic zzbsy:Lcom/google/android/gms/internal/zzgb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgb;Lcom/google/android/gms/internal/zzfw;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsy:Lcom/google/android/gms/internal/zzgb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzgb;->zza(Lcom/google/android/gms/internal/zzgb;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzfw;->zzbk(Ljava/lang/String;)Lcom/google/android/gms/ads/internal/zzl;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    new-instance v0, Lcom/google/android/gms/internal/zzfx;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzfx;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsu:Lcom/google/android/gms/internal/zzfx;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsu:Lcom/google/android/gms/internal/zzfx;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfx;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzgb;Lcom/google/android/gms/internal/zzfw;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzgb$zza;-><init>(Lcom/google/android/gms/internal/zzgb;Lcom/google/android/gms/internal/zzfw;)V

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbst:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    return-void
.end method


# virtual methods
.method zznt()V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsw:Z

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbst:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbst:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    :goto_1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzfz;->zzl(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbss:Lcom/google/android/gms/ads/internal/zzl;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/internal/zzl;->zzb(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsx:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsw:Z

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsv:J

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsy:Lcom/google/android/gms/internal/zzgb;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgb;->zzb(Lcom/google/android/gms/internal/zzgb;)Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-result-object v0

    goto :goto_1
.end method
