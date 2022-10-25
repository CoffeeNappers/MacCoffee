.class Lcom/google/android/gms/internal/zzgh$zzd$3$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh$zzd$3;->zza(Lcom/google/android/gms/internal/zzge;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbun:Lcom/google/android/gms/internal/zzge;

.field final synthetic zzbuo:Lcom/google/android/gms/internal/zzgh$zzd$3;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh$zzd$3;Lcom/google/android/gms/internal/zzge;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$zzd$3$1;->zzbuo:Lcom/google/android/gms/internal/zzgh$zzd$3;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh$zzd$3$1;->zzbun:Lcom/google/android/gms/internal/zzge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zzd$3$1;->zzbuo:Lcom/google/android/gms/internal/zzgh$zzd$3;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgh$zzd$3;->zzbum:Lcom/google/android/gms/internal/zzgh$zzd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgh$zzd;->zza(Lcom/google/android/gms/internal/zzgh$zzd;)Lcom/google/android/gms/internal/zzlg;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgh$zzd$3$1;->zzbun:Lcom/google/android/gms/internal/zzge;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzlg;->zzd(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zzd$3$1;->zzbun:Lcom/google/android/gms/internal/zzge;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzge;->destroy()V

    return-void
.end method
