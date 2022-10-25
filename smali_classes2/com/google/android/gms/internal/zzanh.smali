.class public abstract Lcom/google/android/gms/internal/zzanh;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajv;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzanh$zza;
    }
.end annotation


# instance fields
.field private bkc:Ljava/util/concurrent/ScheduledThreadPoolExecutor;


# direct methods
.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzanh$zza;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzanh$zza;-><init>(Lcom/google/android/gms/internal/zzanh;Lcom/google/android/gms/internal/zzanh$1;)V

    new-instance v1, Lcom/google/android/gms/internal/zzanh$1;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2, v0}, Lcom/google/android/gms/internal/zzanh$1;-><init>(Lcom/google/android/gms/internal/zzanh;ILjava/util/concurrent/ThreadFactory;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzanh;->bkc:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanh;->bkc:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const-wide/16 v2, 0x3

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setKeepAliveTime(JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public static zzl(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 3

    instance-of v0, p0, Ljava/lang/OutOfMemoryError;

    if-eqz v0, :cond_0

    const-string/jumbo v0, "Firebase Database encountered an OutOfMemoryError. You may need to reduce the amount of data you are syncing to the client (e.g. by using queries or syncing a deeper path). See https://firebase.google.com/docs/database/ios/structure-data#best_practices_for_data_structure and https://firebase.google.com/docs/database/android/retrieve-data#filtering_data"

    :goto_0
    return-object v0

    :cond_0
    instance-of v0, p0, Lcom/google/firebase/database/DatabaseException;

    if-eqz v0, :cond_1

    const-string/jumbo v0, ""

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/firebase/database/FirebaseDatabase;->getSdkVersion()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x68

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Uncaught exception in Firebase Database runloop ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "). Please report to firebase-database-client@google.com"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method protected getThreadFactory()Ljava/util/concurrent/ThreadFactory;
    .locals 1

    invoke-static {}, Ljava/util/concurrent/Executors;->defaultThreadFactory()Ljava/util/concurrent/ThreadFactory;

    move-result-object v0

    return-object v0
.end method

.method public restart()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanh;->bkc:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setCorePoolSize(I)V

    return-void
.end method

.method public shutdown()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanh;->bkc:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setCorePoolSize(I)V

    return-void
.end method

.method public zzcsj()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanh;->bkc:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    return-object v0
.end method

.method protected zzcvf()Lcom/google/android/gms/internal/zzakc;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzakc;->bfH:Lcom/google/android/gms/internal/zzakc;

    return-object v0
.end method

.method public abstract zzj(Ljava/lang/Throwable;)V
.end method

.method public zzs(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanh;->bkc:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
