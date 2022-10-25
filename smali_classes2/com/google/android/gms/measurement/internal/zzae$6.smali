.class Lcom/google/android/gms/measurement/internal/zzae$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzae;->zza(Ljava/util/concurrent/atomic/AtomicReference;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avC:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic avc:Z

.field final synthetic avz:Lcom/google/android/gms/measurement/internal/zzae;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzae;Ljava/util/concurrent/atomic/AtomicReference;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avC:Ljava/util/concurrent/atomic/AtomicReference;

    iput-boolean p3, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avc:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avC:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzc(Lcom/google/android/gms/measurement/internal/zzae;)Lcom/google/android/gms/measurement/internal/zzm;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Failed to get user properties"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avC:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    return-void

    :cond_0
    :try_start_2
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avC:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzae;->zzbvr()Lcom/google/android/gms/measurement/internal/zzn;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/google/android/gms/measurement/internal/zzn;->zzmi(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/AppMetadata;

    move-result-object v3

    iget-boolean v4, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avc:Z

    invoke-interface {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzm;->zza(Lcom/google/android/gms/measurement/internal/AppMetadata;Z)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzd(Lcom/google/android/gms/measurement/internal/zzae;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avC:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    :goto_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    :try_start_4
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzbwy()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v2

    const-string/jumbo v3, "Failed to get user properties"

    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzq$zza;->zzj(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avC:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    goto :goto_1

    :catchall_1
    move-exception v0

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$6;->avC:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method
