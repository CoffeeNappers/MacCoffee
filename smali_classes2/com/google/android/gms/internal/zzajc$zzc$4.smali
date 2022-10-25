.class Lcom/google/android/gms/internal/zzajc$zzc$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajc$zzc;->zza(Lcom/google/android/gms/internal/zzamx;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bci:Lcom/google/android/gms/internal/zzajc$zzc;

.field final synthetic bck:Lcom/google/android/gms/internal/zzamx;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajc$zzc;Lcom/google/android/gms/internal/zzamx;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bck:Lcom/google/android/gms/internal/zzamx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bck:Lcom/google/android/gms/internal/zzamx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamx;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bck:Lcom/google/android/gms/internal/zzamx;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamx;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    instance-of v0, v0, Ljava/io/EOFException;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    const-string/jumbo v1, "WebSocket reached EOF."

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zze(Lcom/google/android/gms/internal/zzajc;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzb(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    const-string/jumbo v1, "WebSocket error."

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajc$zzc$4;->bck:Lcom/google/android/gms/internal/zzamx;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zza(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
