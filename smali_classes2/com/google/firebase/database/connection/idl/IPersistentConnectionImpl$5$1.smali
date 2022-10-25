.class Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzait$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5;->zza(ZLcom/google/firebase/database/connection/idl/zzf;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bcB:Lcom/google/firebase/database/connection/idl/zzf;

.field final synthetic bcC:Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5;Lcom/google/firebase/database/connection/idl/zzf;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5$1;->bcC:Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5;

    iput-object p2, p0, Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5$1;->bcB:Lcom/google/firebase/database/connection/idl/zzf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5$1;->bcB:Lcom/google/firebase/database/connection/idl/zzf;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/connection/idl/zzf;->onError(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public zzsi(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/firebase/database/connection/idl/IPersistentConnectionImpl$5$1;->bcB:Lcom/google/firebase/database/connection/idl/zzf;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/connection/idl/zzf;->zzsi(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
