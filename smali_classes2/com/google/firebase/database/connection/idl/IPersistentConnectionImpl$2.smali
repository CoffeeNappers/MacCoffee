.class final Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl;->zza(Lcom/google/firebase/database/connection/idl/zzj;)Lcom/google/android/gms/internal/zzajb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bcx:Lcom/google/firebase/database/connection/idl/zzj;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/connection/idl/zzj;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$2;->bcx:Lcom/google/firebase/database/connection/idl/zzj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$2;->bcx:Lcom/google/firebase/database/connection/idl/zzj;

    invoke-interface {v0, p1, p2}, Lcom/google/firebase/database/connection/idl/zzj;->zzbn(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
