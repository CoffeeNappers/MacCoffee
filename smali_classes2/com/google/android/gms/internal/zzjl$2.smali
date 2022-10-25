.class final Lcom/google/android/gms/internal/zzjl$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzjl;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/internal/zzjk;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;)Lcom/google/android/gms/ads/internal/request/AdResponseParcel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzamm:Lcom/google/android/gms/internal/zzdz;

.field final synthetic zzanc:Lcom/google/android/gms/internal/zzgh;

.field final synthetic zzcnr:Lcom/google/android/gms/internal/zzjn;

.field final synthetic zzcns:Lcom/google/android/gms/internal/zzdx;

.field final synthetic zzcnt:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh;Lcom/google/android/gms/internal/zzjn;Lcom/google/android/gms/internal/zzdz;Lcom/google/android/gms/internal/zzdx;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzjl$2;->zzanc:Lcom/google/android/gms/internal/zzgh;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzjl$2;->zzcnr:Lcom/google/android/gms/internal/zzjn;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzjl$2;->zzamm:Lcom/google/android/gms/internal/zzdz;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzjl$2;->zzcns:Lcom/google/android/gms/internal/zzdx;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzjl$2;->zzcnt:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzjl$2;->zzanc:Lcom/google/android/gms/internal/zzgh;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh;->zzny()Lcom/google/android/gms/internal/zzgh$zzc;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2;->zzcnr:Lcom/google/android/gms/internal/zzjn;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzjn;->zzb(Lcom/google/android/gms/internal/zzgh$zzc;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2;->zzamm:Lcom/google/android/gms/internal/zzdz;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzjl$2;->zzcns:Lcom/google/android/gms/internal/zzdx;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "rwc"

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzdz;->zza(Lcom/google/android/gms/internal/zzdx;[Ljava/lang/String;)Z

    iget-object v1, p0, Lcom/google/android/gms/internal/zzjl$2;->zzamm:Lcom/google/android/gms/internal/zzdz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzdz;->zzlz()Lcom/google/android/gms/internal/zzdx;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzjl$2$1;

    invoke-direct {v2, p0, v1}, Lcom/google/android/gms/internal/zzjl$2$1;-><init>(Lcom/google/android/gms/internal/zzjl$2;Lcom/google/android/gms/internal/zzdx;)V

    new-instance v1, Lcom/google/android/gms/internal/zzjl$2$2;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzjl$2$2;-><init>(Lcom/google/android/gms/internal/zzjl$2;)V

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/zzgh$zzc;->zza(Lcom/google/android/gms/internal/zzlw$zzc;Lcom/google/android/gms/internal/zzlw$zza;)V

    return-void
.end method
