.class final Lcom/google/firebase/database/connection/idl/zzc$2;
.super Lcom/google/firebase/database/connection/idl/zzj$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/connection/idl/zzc;->zza(Lcom/google/android/gms/internal/zzajb;)Lcom/google/firebase/database/connection/idl/zzj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bct:Lcom/google/android/gms/internal/zzajb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/connection/idl/zzc$2;->bct:Lcom/google/android/gms/internal/zzajb;

    invoke-direct {p0}, Lcom/google/firebase/database/connection/idl/zzj$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/zzc$2;->bct:Lcom/google/android/gms/internal/zzajb;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
