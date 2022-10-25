.class Lcom/google/android/gms/internal/zzfx$4;
.super Lcom/google/android/gms/internal/zzed$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfx;->zzc(Lcom/google/android/gms/ads/internal/zzl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbrr:Lcom/google/android/gms/internal/zzfx;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfx;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfx$4;->zzbrr:Lcom/google/android/gms/internal/zzfx;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzed$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzec;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx$4;->zzbrr:Lcom/google/android/gms/internal/zzfx;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzfx;->zza(Lcom/google/android/gms/internal/zzfx;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzfx$4$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzfx$4$1;-><init>(Lcom/google/android/gms/internal/zzfx$4;Lcom/google/android/gms/internal/zzec;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
