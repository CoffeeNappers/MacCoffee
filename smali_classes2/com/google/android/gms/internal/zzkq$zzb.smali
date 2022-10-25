.class Lcom/google/android/gms/internal/zzkq$zzb;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzkq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zzb"
.end annotation


# instance fields
.field final synthetic zzcto:Lcom/google/android/gms/internal/zzkq;

.field final zzctp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzkq$zza;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzkq;)V
    .locals 1

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkq$zzb;->zzcto:Lcom/google/android/gms/internal/zzkq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkq$zzb;->zzctp:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzkq$zza;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkq$zzb;->zzctp:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
