.class Lcom/google/android/gms/internal/zzgh$zzd$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh$zzd;->zzoc()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzlw$zzc",
        "<",
        "Lcom/google/android/gms/internal/zzge;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzbum:Lcom/google/android/gms/internal/zzgh$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh$zzd;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$zzd$3;->zzbum:Lcom/google/android/gms/internal/zzgh$zzd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzge;)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzgh$zzd$3$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzgh$zzd$3$1;-><init>(Lcom/google/android/gms/internal/zzgh$zzd$3;Lcom/google/android/gms/internal/zzge;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlb;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzge;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgh$zzd$3;->zza(Lcom/google/android/gms/internal/zzge;)V

    return-void
.end method
