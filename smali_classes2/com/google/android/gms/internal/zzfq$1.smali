.class Lcom/google/android/gms/internal/zzfq$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzfq;->zzfp()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbrc:Lcom/google/android/gms/internal/zzfq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzfq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfq$1;->zzbrc:Lcom/google/android/gms/internal/zzfq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzhj()Lcom/google/android/gms/internal/zzfr;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfq$1;->zzbrc:Lcom/google/android/gms/internal/zzfq;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfr;->zzb(Lcom/google/android/gms/internal/zzfq;)V

    return-void
.end method
