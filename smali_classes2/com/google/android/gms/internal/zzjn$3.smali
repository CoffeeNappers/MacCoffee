.class Lcom/google/android/gms/internal/zzjn$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzfe;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzjn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcof:Lcom/google/android/gms/internal/zzjn;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzjn;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjn$3;->zzcof:Lcom/google/android/gms/internal/zzjn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzmd;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzmd;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjn$3;->zzcof:Lcom/google/android/gms/internal/zzjn;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzjn;->zza(Lcom/google/android/gms/internal/zzjn;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzjn$3;->zzcof:Lcom/google/android/gms/internal/zzjn;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzjn;->zzb(Lcom/google/android/gms/internal/zzjn;)Lcom/google/android/gms/internal/zzlq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlq;->isDone()Z

    move-result v0

    if-eqz v0, :cond_0

    monitor-exit v1

    :goto_0
    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzjq;

    const/4 v2, -0x2

    invoke-direct {v0, v2, p2}, Lcom/google/android/gms/internal/zzjq;-><init>(ILjava/util/Map;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjn$3;->zzcof:Lcom/google/android/gms/internal/zzjn;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzjn;->zzc(Lcom/google/android/gms/internal/zzjn;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzjq;->getRequestId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :try_start_1
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzjq;->zztq()Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjn$3;->zzcof:Lcom/google/android/gms/internal/zzjn;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzjn;->zzb(Lcom/google/android/gms/internal/zzjn;)Lcom/google/android/gms/internal/zzlq;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzlq;->zzh(Ljava/lang/Object;)V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method
