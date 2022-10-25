.class Lcom/google/android/gms/internal/zziy$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zziy;->zzsg()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzamc:Ljava/util/concurrent/CountDownLatch;

.field final synthetic zzchf:Lcom/google/android/gms/internal/zziy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zziy;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zziy$1;->zzchf:Lcom/google/android/gms/internal/zziy;

    iput-object p2, p0, Lcom/google/android/gms/internal/zziy$1;->zzamc:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zziy$1;->zzchf:Lcom/google/android/gms/internal/zziy;

    iget-object v1, v0, Lcom/google/android/gms/internal/zziy;->zzcgi:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zziy$1;->zzchf:Lcom/google/android/gms/internal/zziy;

    iget-object v2, p0, Lcom/google/android/gms/internal/zziy$1;->zzchf:Lcom/google/android/gms/internal/zziy;

    invoke-static {v2}, Lcom/google/android/gms/internal/zziy;->zza(Lcom/google/android/gms/internal/zziy;)Lcom/google/android/gms/internal/zzmd;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zziy$1;->zzchf:Lcom/google/android/gms/internal/zziy;

    iget-object v3, v3, Lcom/google/android/gms/internal/zziy;->zzchd:Lcom/google/android/gms/internal/zzgu;

    iget-object v4, p0, Lcom/google/android/gms/internal/zziy$1;->zzamc:Ljava/util/concurrent/CountDownLatch;

    invoke-static {v2, v3, v4}, Lcom/google/android/gms/ads/internal/zzn;->zza(Lcom/google/android/gms/internal/zzmd;Lcom/google/android/gms/internal/zzgu;Ljava/util/concurrent/CountDownLatch;)Z

    move-result v2

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zziy;->zza(Lcom/google/android/gms/internal/zziy;Z)Z

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
