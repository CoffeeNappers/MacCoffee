.class Lcom/google/android/gms/internal/zzaic$3$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzaic$3;->zzb(Lcom/google/android/gms/internal/zzant;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aXc:Lcom/google/android/gms/internal/zzant;

.field final synthetic aZJ:Lcom/google/android/gms/internal/zzaic$3;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzaic$3;Lcom/google/android/gms/internal/zzant;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaic$3$1;->aZJ:Lcom/google/android/gms/internal/zzaic$3;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaic$3$1;->aXc:Lcom/google/android/gms/internal/zzant;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaic$3$1;->aZJ:Lcom/google/android/gms/internal/zzaic$3;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzaic$3;->aZI:Lcom/google/android/gms/internal/zzajf$zzb;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaic$3$1;->aXc:Lcom/google/android/gms/internal/zzant;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzant;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzajf$zzb;->zzsr(Ljava/lang/String;)V

    return-void
.end method
