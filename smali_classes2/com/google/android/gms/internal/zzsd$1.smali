.class Lcom/google/android/gms/internal/zzsd$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzsd;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzro;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic Bj:Lcom/google/android/gms/internal/zzro;

.field final synthetic Bu:Lcom/google/android/gms/internal/zzsd;

.field final synthetic zzap:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzsd;Lcom/google/android/gms/internal/zzro;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzsd$1;->Bu:Lcom/google/android/gms/internal/zzsd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzsd$1;->Bj:Lcom/google/android/gms/internal/zzro;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzsd$1;->zzap:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bu:Lcom/google/android/gms/internal/zzsd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsd;->zza(Lcom/google/android/gms/internal/zzsd;)I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzsd$1;->Bj:Lcom/google/android/gms/internal/zzro;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bu:Lcom/google/android/gms/internal/zzsd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsd;->zzb(Lcom/google/android/gms/internal/zzsd;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bu:Lcom/google/android/gms/internal/zzsd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsd;->zzb(Lcom/google/android/gms/internal/zzsd;)Landroid/os/Bundle;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzsd$1;->zzap:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzro;->onCreate(Landroid/os/Bundle;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bu:Lcom/google/android/gms/internal/zzsd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsd;->zza(Lcom/google/android/gms/internal/zzsd;)I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bj:Lcom/google/android/gms/internal/zzro;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzro;->onStart()V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bu:Lcom/google/android/gms/internal/zzsd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsd;->zza(Lcom/google/android/gms/internal/zzsd;)I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bj:Lcom/google/android/gms/internal/zzro;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzro;->onStop()V

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bu:Lcom/google/android/gms/internal/zzsd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzsd;->zza(Lcom/google/android/gms/internal/zzsd;)I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzsd$1;->Bj:Lcom/google/android/gms/internal/zzro;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzro;->onDestroy()V

    :cond_3
    return-void

    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method
