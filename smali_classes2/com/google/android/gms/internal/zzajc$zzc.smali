.class Lcom/google/android/gms/internal/zzajc$zzc;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajc$zzb;
.implements Lcom/google/android/gms/internal/zzamw;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzajc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzc"
.end annotation


# instance fields
.field final synthetic bcg:Lcom/google/android/gms/internal/zzajc;

.field private bch:Lcom/google/android/gms/internal/zzamv;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzajc;Lcom/google/android/gms/internal/zzamv;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bch:Lcom/google/android/gms/internal/zzamv;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bch:Lcom/google/android/gms/internal/zzamv;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzamv;->zza(Lcom/google/android/gms/internal/zzamw;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzajc;Lcom/google/android/gms/internal/zzamv;Lcom/google/android/gms/internal/zzajc$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzajc$zzc;-><init>(Lcom/google/android/gms/internal/zzajc;Lcom/google/android/gms/internal/zzamv;)V

    return-void
.end method

.method private shutdown()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bch:Lcom/google/android/gms/internal/zzamv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamv;->close()V

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bch:Lcom/google/android/gms/internal/zzamv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamv;->m()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v1

    const-string/jumbo v2, "Interrupted while shutting down websocket threads"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzalw;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bch:Lcom/google/android/gms/internal/zzamv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamv;->close()V

    return-void
.end method

.method public connect()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bch:Lcom/google/android/gms/internal/zzamv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamv;->connect()V
    :try_end_0
    .catch Lcom/google/android/gms/internal/zzamx; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v1

    const-string/jumbo v2, "Error connecting"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v0, v3}, Lcom/google/android/gms/internal/zzalw;->zza(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajc$zzc;->shutdown()V

    goto :goto_0
.end method

.method public onClose()V
    .locals 2

    const-string/jumbo v0, "closed"

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzd(Lcom/google/android/gms/internal/zzajc;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajc$zzc$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzajc$zzc$3;-><init>(Lcom/google/android/gms/internal/zzajc$zzc;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzamx;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzd(Lcom/google/android/gms/internal/zzajc;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajc$zzc$4;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzajc$zzc$4;-><init>(Lcom/google/android/gms/internal/zzajc$zzc;Lcom/google/android/gms/internal/zzamx;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzamz;)V
    .locals 5

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamz;->getText()Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v2

    const-string/jumbo v3, "ws message: "

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzd(Lcom/google/android/gms/internal/zzajc;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/zzajc$zzc$2;

    invoke-direct {v2, p0, v1}, Lcom/google/android/gms/internal/zzajc$zzc$2;-><init>(Lcom/google/android/gms/internal/zzajc$zzc;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public zzctt()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzd(Lcom/google/android/gms/internal/zzajc;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajc$zzc$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzajc$zzc$1;-><init>(Lcom/google/android/gms/internal/zzajc$zzc;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public zzsp(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc;->bch:Lcom/google/android/gms/internal/zzamv;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzamv;->zzsp(Ljava/lang/String;)V

    return-void
.end method
