.class Lcom/google/android/gms/measurement/internal/zzq$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzq;->zzb(ILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic asK:Ljava/lang/String;

.field final synthetic asL:Lcom/google/android/gms/measurement/internal/zzq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzq;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzq$1;->asL:Lcom/google/android/gms/measurement/internal/zzq;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzq$1;->asK:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzq$1;->asL:Lcom/google/android/gms/measurement/internal/zzq;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzq;->aqw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbwc()Lcom/google/android/gms/measurement/internal/zzt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->isInitialized()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzt;->zzbyn()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzq$1;->asL:Lcom/google/android/gms/measurement/internal/zzq;

    const/4 v1, 0x6

    const-string/jumbo v2, "Persisted config not initialized . Not logging error/warn."

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzq;->zzn(ILjava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzt;->asY:Lcom/google/android/gms/measurement/internal/zzt$zzc;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzq$1;->asK:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzt$zzc;->zzfg(Ljava/lang/String;)V

    goto :goto_0
.end method
