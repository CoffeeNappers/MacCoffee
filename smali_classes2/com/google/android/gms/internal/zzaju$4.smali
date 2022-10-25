.class Lcom/google/android/gms/internal/zzaju$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaju;->zzg(Lcom/google/android/gms/internal/zzajj;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic beT:Lcom/google/android/gms/internal/zzajj;

.field final synthetic beU:Lcom/google/android/gms/internal/zzaju;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaju;Lcom/google/android/gms/internal/zzajj;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaju$4;->beU:Lcom/google/android/gms/internal/zzaju;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaju$4;->beT:Lcom/google/android/gms/internal/zzajj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaju$4;->beU:Lcom/google/android/gms/internal/zzaju;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaju;->zza(Lcom/google/android/gms/internal/zzaju;)Ljava/util/Map;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaju$4;->beU:Lcom/google/android/gms/internal/zzaju;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaju;->zza(Lcom/google/android/gms/internal/zzaju;)Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaju$4;->beT:Lcom/google/android/gms/internal/zzajj;

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaju$4;->beU:Lcom/google/android/gms/internal/zzaju;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaju;->zza(Lcom/google/android/gms/internal/zzaju;)Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaju$4;->beT:Lcom/google/android/gms/internal/zzajj;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajs;->resume()V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void
.end method
