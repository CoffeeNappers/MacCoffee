.class Lcom/google/android/gms/internal/zzjb$4;
.super Lcom/google/android/gms/internal/zzja$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjb;->zza(Lcom/google/android/gms/ads/internal/formats/zzi$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcia:Lcom/google/android/gms/internal/zzjb;

.field final synthetic zzcif:Lcom/google/android/gms/internal/zzfe;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjb;Lcom/google/android/gms/internal/zzfe;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjb$4;->zzcia:Lcom/google/android/gms/internal/zzjb;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjb$4;->zzcif:Lcom/google/android/gms/internal/zzfe;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzja$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zze(Lcom/google/android/gms/internal/zzgi;)V
    .locals 2

    const-string/jumbo v0, "/nativeAdCustomClick"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjb$4;->zzcif:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    return-void
.end method
