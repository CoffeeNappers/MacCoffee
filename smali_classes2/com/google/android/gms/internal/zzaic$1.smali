.class Lcom/google/android/gms/internal/zzaic$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaic;->zza(ZLcom/google/android/gms/internal/zzajf$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZG:Lcom/google/android/gms/internal/zzajf$zza;

.field final synthetic aZH:Lcom/google/android/gms/internal/zzaic;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaic;Lcom/google/android/gms/internal/zzajf$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaic$1;->aZH:Lcom/google/android/gms/internal/zzaic;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaic$1;->aZG:Lcom/google/android/gms/internal/zzajf$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private zzb(Ljava/lang/Exception;)Z
    .locals 1

    instance-of v0, p1, Lcom/google/firebase/FirebaseApiNotAvailableException;

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/google/android/gms/internal/zzanu;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onFailure(Ljava/lang/Exception;)V
    .locals 2
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaic$1;->zzb(Ljava/lang/Exception;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaic$1;->aZG:Lcom/google/android/gms/internal/zzajf$zza;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzajf$zza;->zzsi(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaic$1;->aZG:Lcom/google/android/gms/internal/zzajf$zza;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzajf$zza;->onError(Ljava/lang/String;)V

    goto :goto_0
.end method
