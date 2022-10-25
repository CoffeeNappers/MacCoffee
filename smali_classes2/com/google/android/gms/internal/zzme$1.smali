.class Lcom/google/android/gms/internal/zzme$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzme;->zzya()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzczt:Lcom/google/android/gms/internal/zzme;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzme;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzme$1;->zzczt:Lcom/google/android/gms/internal/zzme;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme$1;->zzczt:Lcom/google/android/gms/internal/zzme;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzme$1;->zzczt:Lcom/google/android/gms/internal/zzme;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzme;->zzczo:Lcom/google/android/gms/ads/internal/safebrowsing/zzc;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzme$1;->zzczt:Lcom/google/android/gms/internal/zzme;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzme;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzmd;->getView()Landroid/view/View;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/ads/internal/safebrowsing/zzc;->zzp(Landroid/view/View;)V

    :cond_0
    return-void
.end method
