.class Lcom/google/android/gms/internal/zzme$zzd;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/internal/overlay/zzg;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzme;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzd"
.end annotation


# instance fields
.field private zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

.field private zzczu:Lcom/google/android/gms/internal/zzmd;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzmd;Lcom/google/android/gms/ads/internal/overlay/zzg;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme$zzd;->zzczu:Lcom/google/android/gms/internal/zzmd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzme$zzd;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    return-void
.end method


# virtual methods
.method public onPause()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public zzeq()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme$zzd;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;->zzeq()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme$zzd;->zzczu:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzww()V

    return-void
.end method

.method public zzer()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme$zzd;->zzczd:Lcom/google/android/gms/ads/internal/overlay/zzg;

    invoke-interface {v0}, Lcom/google/android/gms/ads/internal/overlay/zzg;->zzer()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme$zzd;->zzczu:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzmd;->zzps()V

    return-void
.end method
