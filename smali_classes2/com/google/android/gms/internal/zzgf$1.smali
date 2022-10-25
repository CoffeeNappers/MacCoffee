.class Lcom/google/android/gms/internal/zzgf$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgf;->zza(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/ads/internal/zzd;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzang:Landroid/content/Context;

.field final synthetic zzbtc:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field final synthetic zzbtd:Lcom/google/android/gms/internal/zzgf$zza;

.field final synthetic zzbte:Lcom/google/android/gms/internal/zzav;

.field final synthetic zzbtf:Lcom/google/android/gms/ads/internal/zzd;

.field final synthetic zzbtg:Ljava/lang/String;

.field final synthetic zzbth:Lcom/google/android/gms/internal/zzgf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgf;Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzgf$zza;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/ads/internal/zzd;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbth:Lcom/google/android/gms/internal/zzgf;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgf$1;->zzang:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtc:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtd:Lcom/google/android/gms/internal/zzgf$zza;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbte:Lcom/google/android/gms/internal/zzav;

    iput-object p6, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtf:Lcom/google/android/gms/ads/internal/zzd;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbth:Lcom/google/android/gms/internal/zzgf;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgf$1;->zzang:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtc:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtd:Lcom/google/android/gms/internal/zzgf$zza;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbte:Lcom/google/android/gms/internal/zzav;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtf:Lcom/google/android/gms/ads/internal/zzd;

    invoke-static/range {v0 .. v5}, Lcom/google/android/gms/internal/zzgf;->zza(Lcom/google/android/gms/internal/zzgf;Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzgf$zza;Lcom/google/android/gms/internal/zzav;Lcom/google/android/gms/ads/internal/zzd;)Lcom/google/android/gms/internal/zzge;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgf$1;->zzbtg:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzge;->zzbp(Ljava/lang/String;)V

    return-void
.end method
