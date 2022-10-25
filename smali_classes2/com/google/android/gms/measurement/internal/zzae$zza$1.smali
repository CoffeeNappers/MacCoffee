.class Lcom/google/android/gms/measurement/internal/zzae$zza$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzae$zza;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avG:Lcom/google/android/gms/measurement/internal/zzm;

.field final synthetic avH:Lcom/google/android/gms/measurement/internal/zzae$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzae$zza;Lcom/google/android/gms/measurement/internal/zzm;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avG:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/google/android/gms/measurement/internal/zzae$zza;->zza(Lcom/google/android/gms/measurement/internal/zzae$zza;Z)Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzae$zza;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzae$zza;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzae;->zzbwb()Lcom/google/android/gms/measurement/internal/zzq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzq;->zzbxe()Lcom/google/android/gms/measurement/internal/zzq$zza;

    move-result-object v0

    const-string/jumbo v2, "Connected to service"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/measurement/internal/zzq$zza;->log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avH:Lcom/google/android/gms/measurement/internal/zzae$zza;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzae$zza;->avz:Lcom/google/android/gms/measurement/internal/zzae;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzae$zza$1;->avG:Lcom/google/android/gms/measurement/internal/zzm;

    invoke-static {v0, v2}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Lcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/internal/zzm;)V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
