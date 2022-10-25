.class Lcom/google/android/gms/internal/zzkw$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzkw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcut:Lcom/google/android/gms/internal/zzkw;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzkw;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkw$1;->zzcut:Lcom/google/android/gms/internal/zzkw;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkw$1;->zzcut:Lcom/google/android/gms/internal/zzkw;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzkw;->zza(Lcom/google/android/gms/internal/zzkw;Ljava/lang/Thread;)Ljava/lang/Thread;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkw$1;->zzcut:Lcom/google/android/gms/internal/zzkw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkw;->zzfp()V

    return-void
.end method
