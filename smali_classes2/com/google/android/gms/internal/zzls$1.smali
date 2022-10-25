.class final Lcom/google/android/gms/internal/zzls$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzls;->zza(Lcom/google/android/gms/internal/zzlt;Lcom/google/android/gms/internal/zzls$zza;)Lcom/google/android/gms/internal/zzlt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcyh:Lcom/google/android/gms/internal/zzlq;

.field final synthetic zzcyi:Lcom/google/android/gms/internal/zzls$zza;

.field final synthetic zzcyj:Lcom/google/android/gms/internal/zzlt;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzlq;Lcom/google/android/gms/internal/zzls$zza;Lcom/google/android/gms/internal/zzlt;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzls$1;->zzcyh:Lcom/google/android/gms/internal/zzlq;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzls$1;->zzcyi:Lcom/google/android/gms/internal/zzls$zza;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzls$1;->zzcyj:Lcom/google/android/gms/internal/zzlt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzls$1;->zzcyh:Lcom/google/android/gms/internal/zzlq;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzls$1;->zzcyi:Lcom/google/android/gms/internal/zzls$zza;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzls$1;->zzcyj:Lcom/google/android/gms/internal/zzlt;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzlt;->get()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/zzls$zza;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlq;->zzh(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzls$1;->zzcyh:Lcom/google/android/gms/internal/zzlq;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzlq;->cancel(Z)Z

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_1
.end method
