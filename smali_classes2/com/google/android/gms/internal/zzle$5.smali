.class Lcom/google/android/gms/internal/zzle$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzle;->zzwe()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcwb:Lcom/google/android/gms/internal/zzle;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzle;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzle$5;->zzcwb:Lcom/google/android/gms/internal/zzle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgu()Lcom/google/android/gms/internal/zzlf;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzle$5;->zzcwb:Lcom/google/android/gms/internal/zzle;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzle;->zzd(Lcom/google/android/gms/internal/zzle;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzle$5;->zzcwb:Lcom/google/android/gms/internal/zzle;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzle;->zze(Lcom/google/android/gms/internal/zzle;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzlf;->zzk(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
