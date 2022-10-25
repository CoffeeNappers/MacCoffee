.class Lcom/google/android/gms/internal/zzgh$zzd$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh$zzd;->zznz()Lcom/google/android/gms/internal/zzgh$zzc;
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
.field final synthetic zzbul:Lcom/google/android/gms/internal/zzgh$zzc;

.field final synthetic zzbum:Lcom/google/android/gms/internal/zzgh$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh$zzd;Lcom/google/android/gms/internal/zzgh$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$zzd$1;->zzbum:Lcom/google/android/gms/internal/zzgh$zzd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh$zzd$1;->zzbul:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzge;)V
    .locals 2

    const-string/jumbo v0, "Getting a new session for JS Engine."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zzd$1;->zzbul:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzge;->zznw()Lcom/google/android/gms/internal/zzgj;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzgh$zzc;->zzg(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzge;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzgh$zzd$1;->zza(Lcom/google/android/gms/internal/zzge;)V

    return-void
.end method
