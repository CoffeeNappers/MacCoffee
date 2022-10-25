.class Lcom/google/android/gms/internal/zzdq$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzdq;->zzd(Lcom/google/android/gms/internal/zzdn;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic zzbcu:Lcom/google/android/gms/internal/zzdn;

.field final synthetic zzbcv:Lcom/google/android/gms/internal/zzdq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzdq;Lcom/google/android/gms/internal/zzdn;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzdq$1;->zzbcv:Lcom/google/android/gms/internal/zzdq;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzdq$1;->zzbcu:Lcom/google/android/gms/internal/zzdn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzdq$1;->zzbcu:Lcom/google/android/gms/internal/zzdn;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzdq$1;->zzbcv:Lcom/google/android/gms/internal/zzdq;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzdq;->zza(Lcom/google/android/gms/internal/zzdq;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzdn;->zza(Landroid/content/SharedPreferences;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
