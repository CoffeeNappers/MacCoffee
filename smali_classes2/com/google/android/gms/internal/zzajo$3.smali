.class Lcom/google/android/gms/internal/zzajo$3;
.super Lcom/google/android/gms/internal/zzanh;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajo;->zzb(Lcom/google/android/gms/internal/zzajj;)Lcom/google/android/gms/internal/zzajv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZL:Lcom/google/android/gms/internal/zzalw;

.field final synthetic bdB:Lcom/google/android/gms/internal/zzajo;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajo;Lcom/google/android/gms/internal/zzalw;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajo$3;->bdB:Lcom/google/android/gms/internal/zzajo;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajo$3;->aZL:Lcom/google/android/gms/internal/zzalw;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzanh;-><init>()V

    return-void
.end method


# virtual methods
.method protected getThreadFactory()Ljava/util/concurrent/ThreadFactory;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzajo;->bdy:Ljava/util/concurrent/ThreadFactory;

    return-object v0
.end method

.method protected zzcvf()Lcom/google/android/gms/internal/zzakc;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzajo;->bdz:Lcom/google/android/gms/internal/zzakc;

    return-object v0
.end method

.method public zzj(Ljava/lang/Throwable;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajo$3;->aZL:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzanh;->zzl(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/internal/zzalw;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
