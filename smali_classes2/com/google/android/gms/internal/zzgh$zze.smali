.class public Lcom/google/android/gms/internal/zzgh$zze;
.super Lcom/google/android/gms/internal/zzlx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzgh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zze"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzlx",
        "<",
        "Lcom/google/android/gms/internal/zzgi;",
        ">;"
    }
.end annotation


# instance fields
.field private zzbup:Lcom/google/android/gms/internal/zzgh$zzc;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzgh$zzc;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlx;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$zze;->zzbup:Lcom/google/android/gms/internal/zzgh$zzc;

    return-void
.end method


# virtual methods
.method public finalize()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zze;->zzbup:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh$zzc;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgh$zze;->zzbup:Lcom/google/android/gms/internal/zzgh$zzc;

    return-void
.end method

.method public getStatus()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zze;->zzbup:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh$zzc;->getStatus()I

    move-result v0

    return v0
.end method

.method public reject()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zze;->zzbup:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh$zzc;->reject()V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzlw$zzc;Lcom/google/android/gms/internal/zzlw$zza;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzlw$zzc",
            "<",
            "Lcom/google/android/gms/internal/zzgi;",
            ">;",
            "Lcom/google/android/gms/internal/zzlw$zza;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zze;->zzbup:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzgh$zzc;->zza(Lcom/google/android/gms/internal/zzlw$zzc;Lcom/google/android/gms/internal/zzlw$zza;)V

    return-void
.end method

.method public zzf(Lcom/google/android/gms/internal/zzgi;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zze;->zzbup:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzgh$zzc;->zzg(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic zzg(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzgi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgh$zze;->zzf(Lcom/google/android/gms/internal/zzgi;)V

    return-void
.end method
