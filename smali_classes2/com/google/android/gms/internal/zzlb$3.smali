.class Lcom/google/android/gms/internal/zzlb$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/ads/internal/util/client/zza$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzlb;->zza(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzang:Landroid/content/Context;

.field final synthetic zzcvq:Lcom/google/android/gms/internal/zzlb;

.field final synthetic zzcvr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzlb;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzlb$3;->zzcvq:Lcom/google/android/gms/internal/zzlb;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzlb$3;->zzang:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzlb$3;->zzcvr:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzv(Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzlb$3;->zzang:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzlb$3;->zzcvr:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1}, Lcom/google/android/gms/internal/zzlb;->zzc(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
