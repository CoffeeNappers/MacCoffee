.class Lcom/google/android/gms/measurement/internal/zzac$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzac;->zzcj(Z)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic auS:Lcom/google/android/gms/measurement/internal/zzac;

.field final synthetic avb:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic avc:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzac;Ljava/util/concurrent/atomic/AtomicReference;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzac$6;->auS:Lcom/google/android/gms/measurement/internal/zzac;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzac$6;->avb:Ljava/util/concurrent/atomic/AtomicReference;

    iput-boolean p3, p0, Lcom/google/android/gms/measurement/internal/zzac$6;->avc:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzac$6;->auS:Lcom/google/android/gms/measurement/internal/zzac;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzac;->zzbvt()Lcom/google/android/gms/measurement/internal/zzae;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzac$6;->avb:Ljava/util/concurrent/atomic/AtomicReference;

    iget-boolean v2, p0, Lcom/google/android/gms/measurement/internal/zzac$6;->avc:Z

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzae;->zza(Ljava/util/concurrent/atomic/AtomicReference;Z)V

    return-void
.end method
