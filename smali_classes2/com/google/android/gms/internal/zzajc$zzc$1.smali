.class Lcom/google/android/gms/internal/zzajc$zzc$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajc$zzc;->zzctt()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bci:Lcom/google/android/gms/internal/zzajc$zzc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajc$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajc$zzc$1;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$1;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zza(Lcom/google/android/gms/internal/zzajc;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$1;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajc;->zza(Lcom/google/android/gms/internal/zzajc;Z)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$1;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$1;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    const-string/jumbo v1, "websocket opened"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$1;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Lcom/google/android/gms/internal/zzajc;)V

    return-void
.end method
