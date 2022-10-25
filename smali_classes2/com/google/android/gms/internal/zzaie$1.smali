.class Lcom/google/android/gms/internal/zzaie$1;
.super Lcom/google/android/gms/internal/zzanh;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaie;->zzb(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZL:Lcom/google/android/gms/internal/zzalw;

.field final synthetic aZM:Lcom/google/android/gms/internal/zzaie;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaie;Lcom/google/android/gms/internal/zzalw;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaie$1;->aZM:Lcom/google/android/gms/internal/zzaie;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaie$1;->aZL:Lcom/google/android/gms/internal/zzalw;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzanh;-><init>()V

    return-void
.end method


# virtual methods
.method public zzj(Ljava/lang/Throwable;)V
    .locals 3

    invoke-static {p1}, Lcom/google/android/gms/internal/zzanh;->zzl(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaie$1;->aZL:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1, v0, p1}, Lcom/google/android/gms/internal/zzalw;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v1, Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaie$1;->aZM:Lcom/google/android/gms/internal/zzaie;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaie;->zza(Lcom/google/android/gms/internal/zzaie;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/google/android/gms/internal/zzaie$1$1;

    invoke-direct {v2, p0, v0, p1}, Lcom/google/android/gms/internal/zzaie$1$1;-><init>(Lcom/google/android/gms/internal/zzaie$1;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaie$1;->zzcsj()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    return-void
.end method
