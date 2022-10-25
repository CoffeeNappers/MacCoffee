.class Lcom/google/android/gms/internal/zzajc$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajc;->zzctq()Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bcg:Lcom/google/android/gms/internal/zzajc;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajc$2;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$2;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzg(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzajc$zzb;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$2;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzg(Lcom/google/android/gms/internal/zzajc;)Lcom/google/android/gms/internal/zzajc$zzb;

    move-result-object v0

    const-string/jumbo v1, "0"

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzajc$zzb;->zzsp(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$2;->bcg:Lcom/google/android/gms/internal/zzajc;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajc;->zzc(Lcom/google/android/gms/internal/zzajc;)V

    :cond_0
    return-void
.end method
