.class Lcom/google/android/gms/ads/internal/formats/zzj$2;
.super Lcom/google/android/gms/internal/zzja$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/ads/internal/formats/zzj;->zzb(Landroid/view/View;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbod:Lorg/json/JSONObject;

.field final synthetic zzboe:Lcom/google/android/gms/ads/internal/formats/zzj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/formats/zzj;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zzj$2;->zzboe:Lcom/google/android/gms/ads/internal/formats/zzj;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zzj$2;->zzbod:Lorg/json/JSONObject;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzja$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zze(Lcom/google/android/gms/internal/zzgi;)V
    .locals 2

    const-string/jumbo v0, "google.afma.nativeAds.handleImpressionPing"

    iget-object v1, p0, Lcom/google/android/gms/ads/internal/formats/zzj$2;->zzbod:Lorg/json/JSONObject;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method
