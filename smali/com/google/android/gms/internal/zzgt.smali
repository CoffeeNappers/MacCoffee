.class public Lcom/google/android/gms/internal/zzgt;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzgu$zza;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzako:Ljava/lang/Object;

.field private final zzamf:Lcom/google/android/gms/internal/zzgz;

.field private final zzanq:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

.field private final zzanr:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

.field private final zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

.field private final zzasz:Z

.field private final zzbwa:Ljava/lang/String;

.field private final zzbwb:J

.field private final zzbwc:Lcom/google/android/gms/internal/zzgq;

.field private final zzbwd:Lcom/google/android/gms/internal/zzgp;

.field private final zzbwe:Z

.field private zzbwf:Lcom/google/android/gms/internal/zzha;

.field private zzbwg:I

.field private zzbwh:Lcom/google/android/gms/internal/zzhc;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zzgq;Lcom/google/android/gms/internal/zzgp;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;ZZLcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzgz;",
            "Lcom/google/android/gms/internal/zzgq;",
            "Lcom/google/android/gms/internal/zzgp;",
            "Lcom/google/android/gms/ads/internal/client/AdRequestParcel;",
            "Lcom/google/android/gms/ads/internal/client/AdSizeParcel;",
            "Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;",
            "ZZ",
            "Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    const/4 v2, -0x2

    iput v2, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgt;->zzamf:Lcom/google/android/gms/internal/zzgz;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    const-string/jumbo v2, "com.google.ads.mediation.customevent.CustomEventAdapter"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgt;->zzof()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    :goto_0
    iput-object p4, p0, Lcom/google/android/gms/internal/zzgt;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iget-wide v2, p4, Lcom/google/android/gms/internal/zzgq;->zzbvj:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    iget-wide v2, p4, Lcom/google/android/gms/internal/zzgq;->zzbvj:J

    :goto_1
    iput-wide v2, p0, Lcom/google/android/gms/internal/zzgt;->zzbwb:J

    iput-object p6, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p7, p0, Lcom/google/android/gms/internal/zzgt;->zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iput-object p8, p0, Lcom/google/android/gms/internal/zzgt;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iput-boolean p9, p0, Lcom/google/android/gms/internal/zzgt;->zzasz:Z

    move/from16 v0, p10

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwe:Z

    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzanq:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzanr:Ljava/util/List;

    return-void

    :cond_0
    iput-object p2, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-wide/16 v2, 0x2710

    goto :goto_1
.end method

.method private zza(JJJJ)J
    .locals 3

    :goto_0
    iget v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_0

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->elapsedRealtime()J

    move-result-wide v0

    sub-long/2addr v0, p1

    return-wide v0

    :cond_0
    invoke-direct/range {p0 .. p8}, Lcom/google/android/gms/internal/zzgt;->zzb(JJJJ)V

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzgt;Lcom/google/android/gms/internal/zzha;)Lcom/google/android/gms/internal/zzha;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzgt;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/internal/zzgs;)V
    .locals 9

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbva:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzgt;->zzbr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget v0, v0, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzcyb:I

    const v1, 0x3e8fa0

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzazr:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    invoke-interface {v0, v1, v2, v4, p1}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzhb;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgt;->zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object v5, p1

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Lcom/google/android/gms/internal/zzhb;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Could not request ad from mediation adapter."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzgt;->zzad(I)V

    goto :goto_0

    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzgt;->zzasz:Z

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v5, v0, Lcom/google/android/gms/internal/zzgp;->zzbus:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/gms/internal/zzgt;->zzanq:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    iget-object v8, p0, Lcom/google/android/gms/internal/zzgt;->zzanr:Ljava/util/List;

    move-object v6, p1

    invoke-interface/range {v1 .. v8}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzhb;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzazr:Z

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v5, v0, Lcom/google/android/gms/internal/zzgp;->zzbus:Ljava/lang/String;

    move-object v6, p1

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzhb;)V

    goto :goto_0

    :cond_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwe:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbvd:Ljava/lang/String;

    if-eqz v0, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v5, v0, Lcom/google/android/gms/internal/zzgp;->zzbus:Ljava/lang/String;

    new-instance v7, Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbvh:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgt;->zzbs(Ljava/lang/String;)Lcom/google/android/gms/ads/formats/NativeAdOptions;

    move-result-object v0

    invoke-direct {v7, v0}, Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;-><init>(Lcom/google/android/gms/ads/formats/NativeAdOptions;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v8, v0, Lcom/google/android/gms/internal/zzgp;->zzbvg:Ljava/util/List;

    move-object v6, p1

    invoke-interface/range {v1 .. v8}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzhb;Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;)V

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgt;->zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzgp;->zzbus:Ljava/lang/String;

    move-object v6, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzhb;)V

    goto/16 :goto_0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/google/android/gms/dynamic/zze;->zzac(Ljava/lang/Object;)Lcom/google/android/gms/dynamic/zzd;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgt;->zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzapj:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v5, v5, Lcom/google/android/gms/internal/zzgp;->zzbus:Ljava/lang/String;

    move-object v6, p1

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/zzha;->zza(Lcom/google/android/gms/dynamic/zzd;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/zzhb;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzgt;Lcom/google/android/gms/internal/zzgs;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgt;->zza(Lcom/google/android/gms/internal/zzgs;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzgt;I)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzgt;->zzae(I)Z

    move-result v0

    return v0
.end method

.method private zzae(I)Z
    .locals 3

    const/4 v1, 0x0

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzgt;->zzasz:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzha;->zzop()Landroid/os/Bundle;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_0

    const-string/jumbo v2, "capabilities"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    and-int/2addr v0, p1

    if-ne v0, p1, :cond_3

    const/4 v0, 0x1

    :goto_1
    move v1, v0

    :cond_0
    :goto_2
    return v1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzapp:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    iget-boolean v0, v0, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzazr:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzha;->getInterstitialAdapterInfo()Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzha;->zzoo()Landroid/os/Bundle;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Could not get adapter info. Returning false"

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    move v0, v1

    goto :goto_1
.end method

.method private static zzaf(I)Lcom/google/android/gms/internal/zzhc;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzgt$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzgt$2;-><init>(I)V

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzgt;)I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    return v0
.end method

.method private zzb(JJJJ)V
    .locals 7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sub-long v2, v0, p1

    sub-long v2, p3, v2

    sub-long/2addr v0, p5

    sub-long v0, p7, v0

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-gtz v4, :cond_1

    :cond_0
    const-string/jumbo v0, "Timed out waiting for adapter."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    const/4 v0, 0x3

    iput v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    :goto_0
    return-void

    :cond_1
    :try_start_0
    iget-object v4, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    invoke-virtual {v4, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    goto :goto_0
.end method

.method private zzbr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgt;->zzoi()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzgt;->zzae(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-object p1

    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "cpm_floor_cents"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Could not remove field. Returning the original value"

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static zzbs(Ljava/lang/String;)Lcom/google/android/gms/ads/formats/NativeAdOptions;
    .locals 4

    new-instance v1, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;

    invoke-direct {v1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;-><init>()V

    if-nez p0, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->build()Lcom/google/android/gms/ads/formats/NativeAdOptions;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "multiple_images"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->setRequestMultipleImages(Z)Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;

    const-string/jumbo v2, "only_urls"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->setReturnUrlsForImageAssets(Z)Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;

    const-string/jumbo v2, "native_image_orientation"

    const-string/jumbo v3, "any"

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgt;->zzbt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->setImageOrientation(I)Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    invoke-virtual {v1}, Lcom/google/android/gms/ads/formats/NativeAdOptions$Builder;->build()Lcom/google/android/gms/ads/formats/NativeAdOptions;

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v2, "Exception occurred when creating native ad options"

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private static zzbt(Ljava/lang/String;)I
    .locals 1

    const-string/jumbo v0, "landscape"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    const-string/jumbo v0, "portrait"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzgt;)Lcom/google/android/gms/internal/zzha;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgt;->zzoh()Lcom/google/android/gms/internal/zzha;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzgt;)Lcom/google/android/gms/internal/zzha;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzgt;)Z
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgt;->zzoi()Z

    move-result v0

    return v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/zzgt;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    return-object v0
.end method

.method private zzof()Ljava/lang/String;
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbuw:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzamf:Lcom/google/android/gms/internal/zzgz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzgp;->zzbuw:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzgz;->zzbv(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "com.google.ads.mediation.customevent.CustomEventAdapter"
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Fail to determine the custom event\'s version, assuming the old one."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    :cond_1
    const-string/jumbo v0, "com.google.ads.mediation.customevent.CustomEventAdapter"

    goto :goto_0
.end method

.method private zzog()Lcom/google/android/gms/internal/zzhc;
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgt;->zzoi()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x4

    :try_start_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzgt;->zzae(I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwh:Lcom/google/android/gms/internal/zzhc;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwh:Lcom/google/android/gms/internal/zzhc;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzhc;->zzok()I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwh:Lcom/google/android/gms/internal/zzhc;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Could not get cpm value from MediationResponseMetadata"

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgt;->zzoj()I

    move-result v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzgt;->zzaf(I)Lcom/google/android/gms/internal/zzhc;

    move-result-object v0

    goto :goto_0
.end method

.method private zzoh()Lcom/google/android/gms/internal/zzha;
    .locals 4

    const-string/jumbo v1, "Instantiating mediation adapter: "

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzgt;->zzasz:Z

    if-nez v0, :cond_3

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbhh:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "com.google.ads.mediation.admob.AdMobAdapter"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/google/ads/mediation/admob/AdMobAdapter;

    invoke-direct {v0}, Lcom/google/ads/mediation/admob/AdMobAdapter;-><init>()V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzgt;->zza(Lcom/google/android/gms/ads/mediation/MediationAdapter;)Lcom/google/android/gms/internal/zzha;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbhi:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "com.google.ads.mediation.AdUrlAdapter"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/google/ads/mediation/AdUrlAdapter;

    invoke-direct {v0}, Lcom/google/ads/mediation/AdUrlAdapter;-><init>()V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzgt;->zza(Lcom/google/android/gms/ads/mediation/MediationAdapter;)Lcom/google/android/gms/internal/zzha;

    move-result-object v0

    goto :goto_1

    :cond_2
    const-string/jumbo v0, "com.google.ads.mediation.admob.AdMobCustomTabsAdapter"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Lcom/google/android/gms/internal/zzhg;

    new-instance v1, Lcom/google/android/gms/internal/zzho;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzho;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzhg;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdapter;)V

    goto :goto_1

    :cond_3
    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzamf:Lcom/google/android/gms/internal/zzgz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzgz;->zzbu(Ljava/lang/String;)Lcom/google/android/gms/internal/zzha;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v1, v0

    const-string/jumbo v2, "Could not instantiate mediation adapter: "

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzkx;->zza(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    goto :goto_1

    :cond_4
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private zzoi()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iget v0, v0, Lcom/google/android/gms/internal/zzgq;->zzbvt:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzoj()I
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbva:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :cond_0
    :goto_0
    return v0

    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgp;->zzbva:Ljava/lang/String;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string/jumbo v0, "com.google.ads.mediation.admob.AdMobAdapter"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "cpm_cents"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v0, "Could not convert to json. Returning 0"

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    move v0, v1

    goto :goto_0

    :cond_2
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzgt;->zzae(I)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "cpm_floor_cents"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    :goto_1
    if-nez v0, :cond_0

    const-string/jumbo v0, "penalized_average_cpm_cents"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    :cond_3
    move v0, v1

    goto :goto_1
.end method


# virtual methods
.method public cancel()V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzha;->destroy()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    :goto_0
    const/4 v0, -0x1

    :try_start_1
    iput v0, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v2, "Could not destroy mediation adapter."

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public zza(JJ)Lcom/google/android/gms/internal/zzgu;
    .locals 11

    iget-object v10, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    monitor-enter v10

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    new-instance v0, Lcom/google/android/gms/internal/zzgs;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzgs;-><init>()V

    sget-object v1, Lcom/google/android/gms/internal/zzlb;->zzcvl:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgt$1;

    invoke-direct {v4, p0, v0}, Lcom/google/android/gms/internal/zzgt$1;-><init>(Lcom/google/android/gms/internal/zzgt;Lcom/google/android/gms/internal/zzgs;)V

    invoke-virtual {v1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzgt;->zzbwb:J

    move-object v1, p0

    move-wide v6, p1

    move-wide v8, p3

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/internal/zzgt;->zza(JJJJ)J

    move-result-wide v8

    new-instance v1, Lcom/google/android/gms/internal/zzgu;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzgt;->zzbwd:Lcom/google/android/gms/internal/zzgp;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzgt;->zzbwf:Lcom/google/android/gms/internal/zzha;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzgt;->zzbwa:Ljava/lang/String;

    iget v6, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzgt;->zzog()Lcom/google/android/gms/internal/zzhc;

    move-result-object v7

    move-object v5, v0

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/internal/zzgu;-><init>(Lcom/google/android/gms/internal/zzgp;Lcom/google/android/gms/internal/zzha;Ljava/lang/String;Lcom/google/android/gms/internal/zzgs;ILcom/google/android/gms/internal/zzhc;J)V

    monitor-exit v10

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected zza(Lcom/google/android/gms/ads/mediation/MediationAdapter;)Lcom/google/android/gms/internal/zzha;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzhg;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzhg;-><init>(Lcom/google/android/gms/ads/mediation/MediationAdapter;)V

    return-object v0
.end method

.method public zza(ILcom/google/android/gms/internal/zzhc;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgt;->zzbwh:Lcom/google/android/gms/internal/zzhc;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzad(I)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/zzgt;->zzbwg:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgt;->zzako:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
