.class Lcom/google/android/gms/internal/zzkc$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzkc;->zzfp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzanw:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

.field final synthetic zzcrl:Lcom/google/android/gms/internal/zzha;

.field final synthetic zzcrm:Lcom/google/android/gms/internal/zzkc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzkc;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzha;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkc$1;->zzcrm:Lcom/google/android/gms/internal/zzkc;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkc$1;->zzanw:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzkc$1;->zzcrl:Lcom/google/android/gms/internal/zzha;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkc$1;->zzcrm:Lcom/google/android/gms/internal/zzkc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkc$1;->zzanw:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkc$1;->zzcrl:Lcom/google/android/gms/internal/zzha;

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/zzkc;->zza(Lcom/google/android/gms/internal/zzkc;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/internal/zzha;)V

    return-void
.end method
