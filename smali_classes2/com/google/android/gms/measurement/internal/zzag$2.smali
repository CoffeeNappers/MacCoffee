.class Lcom/google/android/gms/measurement/internal/zzag$2;
.super Lcom/google/android/gms/measurement/internal/zzf;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/measurement/internal/zzag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic avP:Lcom/google/android/gms/measurement/internal/zzag;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzag;Lcom/google/android/gms/measurement/internal/zzx;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzag$2;->avP:Lcom/google/android/gms/measurement/internal/zzag;

    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzf;-><init>(Lcom/google/android/gms/measurement/internal/zzx;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzag$2;->avP:Lcom/google/android/gms/measurement/internal/zzag;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzag;->zza(Lcom/google/android/gms/measurement/internal/zzag;)V

    return-void
.end method
