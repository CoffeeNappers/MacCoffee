.class Lcom/google/android/gms/internal/zzfx$3$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfx$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfx$3;->zza(Lcom/google/android/gms/internal/zzif;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbrw:Lcom/google/android/gms/internal/zzif;

.field final synthetic zzbrx:Lcom/google/android/gms/internal/zzfx$3;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfx$3;Lcom/google/android/gms/internal/zzif;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfx$3$1;->zzbrx:Lcom/google/android/gms/internal/zzfx$3;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfx$3$1;->zzbrw:Lcom/google/android/gms/internal/zzif;

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

    iget-object v0, p1, Lcom/google/android/gms/internal/zzfy;->zzbsg:Lcom/google/android/gms/internal/zzig;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/google/android/gms/internal/zzfy;->zzbsg:Lcom/google/android/gms/internal/zzig;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfx$3$1;->zzbrw:Lcom/google/android/gms/internal/zzif;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzig;->zza(Lcom/google/android/gms/internal/zzif;)V

    :cond_0
    return-void
.end method
