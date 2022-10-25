.class Lcom/google/android/gms/internal/zzaie$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaie$1;->zzj(Ljava/lang/Throwable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZN:Ljava/lang/Throwable;

.field final synthetic aZO:Lcom/google/android/gms/internal/zzaie$1;

.field final synthetic zzbrm:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaie$1;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaie$1$1;->aZO:Lcom/google/android/gms/internal/zzaie$1;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaie$1$1;->zzbrm:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaie$1$1;->aZN:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    new-instance v0, Ljava/lang/RuntimeException;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaie$1$1;->zzbrm:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaie$1$1;->aZN:Ljava/lang/Throwable;

    invoke-direct {v0, v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method
