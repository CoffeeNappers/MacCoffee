.class Lcom/google/android/gms/internal/zzjb$1;
.super Lcom/google/android/gms/internal/zzja$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjb;->zzcj(Ljava/lang/String;)Lorg/json/JSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzchx:Ljava/lang/String;

.field final synthetic zzchy:Lcom/google/android/gms/internal/zzjb$zzb;

.field final synthetic zzchz:Lcom/google/android/gms/internal/zzlq;

.field final synthetic zzcia:Lcom/google/android/gms/internal/zzjb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjb;Ljava/lang/String;Lcom/google/android/gms/internal/zzjb$zzb;Lcom/google/android/gms/internal/zzlq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjb$1;->zzcia:Lcom/google/android/gms/internal/zzjb;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjb$1;->zzchx:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzjb$1;->zzchy:Lcom/google/android/gms/internal/zzjb$zzb;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzjb$1;->zzchz:Lcom/google/android/gms/internal/zzlq;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzja$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zze(Lcom/google/android/gms/internal/zzgi;)V
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzjb$1$1;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzjb$1$1;-><init>(Lcom/google/android/gms/internal/zzjb$1;Lcom/google/android/gms/internal/zzgi;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjb$1;->zzchy:Lcom/google/android/gms/internal/zzjb$zzb;

    iput-object v0, v1, Lcom/google/android/gms/internal/zzjb$zzb;->zzciq:Lcom/google/android/gms/internal/zzfe;

    const-string/jumbo v1, "/nativeAdPreProcess"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjb$1;->zzcia:Lcom/google/android/gms/internal/zzjb;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzjb;->zza(Lcom/google/android/gms/internal/zzjb;)Lcom/google/android/gms/internal/zzko$zza;

    move-result-object v1

    iget-object v1, v1, Lcom/google/android/gms/internal/zzko$zza;->zzcsu:Lcom/google/android/gms/ads/internal/request/AdResponseParcel;

    iget-object v1, v1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->body:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "ads_id"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjb$1;->zzchx:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v1, "google.afma.nativeAds.preProcessJsonGmsg"

    invoke-interface {p1, v1, v0}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Exception occurred while invoking javascript"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjb$1;->zzchz:Lcom/google/android/gms/internal/zzlq;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlq;->zzh(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public zzsr()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjb$1;->zzchz:Lcom/google/android/gms/internal/zzlq;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlq;->zzh(Ljava/lang/Object;)V

    return-void
.end method
