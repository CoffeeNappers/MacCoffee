.class Lcom/google/android/gms/internal/zzfx$4$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfx$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfx$4;->zza(Lcom/google/android/gms/internal/zzec;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbry:Lcom/google/android/gms/internal/zzec;

.field final synthetic zzbrz:Lcom/google/android/gms/internal/zzfx$4;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfx$4;Lcom/google/android/gms/internal/zzec;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfx$4$1;->zzbrz:Lcom/google/android/gms/internal/zzfx$4;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfx$4$1;->zzbry:Lcom/google/android/gms/internal/zzec;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzfy;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p1, Lcom/google/android/gms/internal/zzfy;->zzbsh:Lcom/google/android/gms/internal/zzed;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/google/android/gms/internal/zzfy;->zzbsh:Lcom/google/android/gms/internal/zzed;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfx$4$1;->zzbry:Lcom/google/android/gms/internal/zzec;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzed;->zza(Lcom/google/android/gms/internal/zzec;)V

    :cond_0
    return-void
.end method
