.class Lcom/google/android/gms/internal/zzjb$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjb;->zze(Lorg/json/JSONObject;)Lcom/google/android/gms/internal/zzjb$zza;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcia:Lcom/google/android/gms/internal/zzjb;

.field final synthetic zzcic:Lcom/google/android/gms/internal/zzlq;

.field final synthetic zzcid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjb;Lcom/google/android/gms/internal/zzlq;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjb$2;->zzcia:Lcom/google/android/gms/internal/zzjb;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjb$2;->zzcic:Lcom/google/android/gms/internal/zzlq;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzjb$2;->zzcid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjb$2;->zzcic:Lcom/google/android/gms/internal/zzlq;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjb$2;->zzcia:Lcom/google/android/gms/internal/zzjb;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzjb;->zzb(Lcom/google/android/gms/internal/zzjb;)Lcom/google/android/gms/ads/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/internal/zzq;->zzfv()Landroid/support/v4/util/SimpleArrayMap;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjb$2;->zzcid:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzet;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzlq;->zzh(Ljava/lang/Object;)V

    return-void
.end method
