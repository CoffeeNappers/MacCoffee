.class Lcom/google/android/gms/internal/zzgh$zzc$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh$zzc;->release()V
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
        "Lcom/google/android/gms/internal/zzgi;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzbui:Lcom/google/android/gms/internal/zzgh$zzc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$zzc$2;->zzbui:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzgi;)V
    .locals 1

    const-string/jumbo v0, "Releasing engine reference."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zzc$2;->zzbui:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh$zzc;->zza(Lcom/google/android/gms/internal/zzgh$zzc;)Lcom/google/android/gms/internal/zzgh$zzd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh$zzd;->zzoa()V

    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzgi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgh$zzc$2;->zzb(Lcom/google/android/gms/internal/zzgi;)V

    return-void
.end method