.class final Lcom/google/android/gms/internal/zzjl$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjl;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/internal/zzjk;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzang:Landroid/content/Context;

.field final synthetic zzcno:Lcom/google/android/gms/internal/zzjk;

.field final synthetic zzcnp:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

.field final synthetic zzcnr:Lcom/google/android/gms/internal/zzjn;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjk;Landroid/content/Context;Lcom/google/android/gms/internal/zzjn;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjl$3;->zzcno:Lcom/google/android/gms/internal/zzjk;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjl$3;->zzang:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzjl$3;->zzcnr:Lcom/google/android/gms/internal/zzjn;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzjl$3;->zzcnp:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjl$3;->zzcno:Lcom/google/android/gms/internal/zzjk;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzjk;->zzcne:Lcom/google/android/gms/internal/zzjt;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$3;->zzang:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjl$3;->zzcnr:Lcom/google/android/gms/internal/zzjn;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzjl$3;->zzcnp:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v3, v3, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzari:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzjt;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzjn;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V

    return-void
.end method
