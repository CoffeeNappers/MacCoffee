.class public Lcom/google/android/gms/internal/zzsz;
.super Ljava/lang/Object;


# static fields
.field private static GQ:Lcom/google/android/gms/internal/zzsz;


# instance fields
.field private GP:Lcom/google/android/gms/internal/zzsy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzsz;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzsz;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzsz;->GQ:Lcom/google/android/gms/internal/zzsz;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzsz;->GP:Lcom/google/android/gms/internal/zzsy;

    return-void
.end method

.method public static zzco(Landroid/content/Context;)Lcom/google/android/gms/internal/zzsy;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzsz;->GQ:Lcom/google/android/gms/internal/zzsz;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzsz;->zzcn(Landroid/content/Context;)Lcom/google/android/gms/internal/zzsy;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized zzcn(Landroid/content/Context;)Lcom/google/android/gms/internal/zzsy;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzsz;->GP:Lcom/google/android/gms/internal/zzsy;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_1

    :goto_0
    new-instance v0, Lcom/google/android/gms/internal/zzsy;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzsy;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzsz;->GP:Lcom/google/android/gms/internal/zzsy;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzsz;->GP:Lcom/google/android/gms/internal/zzsy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object p1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
