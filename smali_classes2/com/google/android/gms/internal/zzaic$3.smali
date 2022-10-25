.class Lcom/google/android/gms/internal/zzaic$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/firebase/FirebaseApp$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaic;->zzb(Lcom/google/android/gms/internal/zzajf$zzb;)Lcom/google/firebase/FirebaseApp$zza;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZH:Lcom/google/android/gms/internal/zzaic;

.field final synthetic aZI:Lcom/google/android/gms/internal/zzajf$zzb;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaic;Lcom/google/android/gms/internal/zzajf$zzb;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaic$3;->aZH:Lcom/google/android/gms/internal/zzaic;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaic$3;->aZI:Lcom/google/android/gms/internal/zzajf$zzb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzant;)V
    .locals 2
    .param p1    # Lcom/google/android/gms/internal/zzant;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaic$3;->aZH:Lcom/google/android/gms/internal/zzaic;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaic;->zza(Lcom/google/android/gms/internal/zzaic;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzaic$3$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzaic$3$1;-><init>(Lcom/google/android/gms/internal/zzaic$3;Lcom/google/android/gms/internal/zzant;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
