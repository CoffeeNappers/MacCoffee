.class Lcom/google/android/gms/internal/zzajc$zzc$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajc$zzc;->zza(Lcom/google/android/gms/internal/zzamz;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bci:Lcom/google/android/gms/internal/zzajc$zzc;

.field final synthetic bcj:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajc$zzc;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajc$zzc$2;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajc$zzc$2;->bcj:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajc$zzc$2;->bci:Lcom/google/android/gms/internal/zzajc$zzc;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajc$zzc;->bcg:Lcom/google/android/gms/internal/zzajc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajc$zzc$2;->bcj:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajc;->zza(Lcom/google/android/gms/internal/zzajc;Ljava/lang/String;)V

    return-void
.end method
