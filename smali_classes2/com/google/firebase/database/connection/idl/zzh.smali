.class public interface abstract Lcom/google/firebase/database/connection/idl/zzh;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/database/connection/idl/zzh$zza;
    }
.end annotation


# virtual methods
.method public abstract compareAndPut(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Ljava/lang/String;Lcom/google/firebase/database/connection/idl/zzj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/dynamic/zzd;",
            "Ljava/lang/String;",
            "Lcom/google/firebase/database/connection/idl/zzj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract initialize()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract interrupt(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract isInterrupted(Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract listen(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzg;JLcom/google/firebase/database/connection/idl/zzj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/dynamic/zzd;",
            "Lcom/google/firebase/database/connection/idl/zzg;",
            "J",
            "Lcom/google/firebase/database/connection/idl/zzj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract merge(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/dynamic/zzd;",
            "Lcom/google/firebase/database/connection/idl/zzj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract onDisconnectCancel(Ljava/util/List;Lcom/google/firebase/database/connection/idl/zzj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/firebase/database/connection/idl/zzj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract onDisconnectMerge(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/dynamic/zzd;",
            "Lcom/google/firebase/database/connection/idl/zzj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract onDisconnectPut(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/dynamic/zzd;",
            "Lcom/google/firebase/database/connection/idl/zzj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract purgeOutstandingWrites()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract put(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzj;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/dynamic/zzd;",
            "Lcom/google/firebase/database/connection/idl/zzj;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract refreshAuthToken()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract refreshAuthToken2(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract resume(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract setup(Lcom/google/firebase/database/connection/idl/ConnectionConfig;Lcom/google/firebase/database/connection/idl/zze;Lcom/google/android/gms/dynamic/zzd;Lcom/google/firebase/database/connection/idl/zzi;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract shutdown()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract unlisten(Ljava/util/List;Lcom/google/android/gms/dynamic/zzd;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/dynamic/zzd;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
