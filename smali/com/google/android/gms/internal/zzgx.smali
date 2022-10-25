.class public Lcom/google/android/gms/internal/zzgx;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzgo;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzako:Ljava/lang/Object;

.field private final zzalt:Lcom/google/android/gms/internal/zzdz;

.field private final zzamf:Lcom/google/android/gms/internal/zzgz;

.field private final zzasz:Z

.field private final zzbwc:Lcom/google/android/gms/internal/zzgq;

.field private final zzbwe:Z

.field private final zzbws:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

.field private final zzbwt:J

.field private final zzbwu:J

.field private zzbww:Z

.field private zzbwy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzgu;",
            ">;"
        }
    .end annotation
.end field

.field private zzbxc:Lcom/google/android/gms/internal/zzgt;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zzgq;ZZJJLcom/google/android/gms/internal/zzdz;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzako:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgx;->zzbww:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzbwy:Ljava/util/List;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgx;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgx;->zzbws:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzgx;->zzamf:Lcom/google/android/gms/internal/zzgz;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzgx;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    iput-boolean p5, p0, Lcom/google/android/gms/internal/zzgx;->zzasz:Z

    iput-boolean p6, p0, Lcom/google/android/gms/internal/zzgx;->zzbwe:Z

    iput-wide p7, p0, Lcom/google/android/gms/internal/zzgx;->zzbwt:J

    iput-wide p9, p0, Lcom/google/android/gms/internal/zzgx;->zzbwu:J

    iput-object p11, p0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgx;->zzako:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgx;->zzbww:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzbxc:Lcom/google/android/gms/internal/zzgt;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzbxc:Lcom/google/android/gms/internal/zzgt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgt;->cancel()V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzd(Ljava/util/List;)Lcom/google/android/gms/internal/zzgu;
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzgp;",
            ">;)",
            "Lcom/google/android/gms/internal/zzgu;"
        }
    .end annotation

    const-string/jumbo v2, "Starting mediation."

    invoke-static {v2}, Lcom/google/android/gms/internal/zzkx;->zzdg(Ljava/lang/String;)V

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzdz;->zzlz()Lcom/google/android/gms/internal/zzdx;

    move-result-object v16

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/gms/internal/zzgp;

    const-string/jumbo v3, "Trying mediation network: "

    iget-object v2, v7, Lcom/google/android/gms/internal/zzgp;->zzbut:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-static {v2}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    iget-object v2, v7, Lcom/google/android/gms/internal/zzgp;->zzbuu:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_1
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzdz;->zzlz()Lcom/google/android/gms/internal/zzdx;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgx;->zzako:Ljava/lang/Object;

    move-object/from16 v20, v0

    monitor-enter v20

    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/google/android/gms/internal/zzgx;->zzbww:Z

    if-eqz v2, :cond_3

    new-instance v2, Lcom/google/android/gms/internal/zzgu;

    const/4 v3, -0x1

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzgu;-><init>(I)V

    monitor-exit v20
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_2
    return-object v2

    :cond_2
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    :try_start_1
    new-instance v2, Lcom/google/android/gms/internal/zzgt;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgx;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/gms/internal/zzgx;->zzamf:Lcom/google/android/gms/internal/zzgz;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/gms/internal/zzgx;->zzbwc:Lcom/google/android/gms/internal/zzgq;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzgx;->zzbws:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v8, v8, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzcju:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/gms/internal/zzgx;->zzbws:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v9, v9, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzarm:Lcom/google/android/gms/ads/internal/client/AdSizeParcel;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/gms/internal/zzgx;->zzbws:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v10, v10, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzari:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/google/android/gms/internal/zzgx;->zzasz:Z

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/google/android/gms/internal/zzgx;->zzbwe:Z

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/gms/internal/zzgx;->zzbws:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v13, v13, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzasa:Lcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/gms/internal/zzgx;->zzbws:Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;

    iget-object v14, v14, Lcom/google/android/gms/ads/internal/request/AdRequestInfoParcel;->zzase:Ljava/util/List;

    invoke-direct/range {v2 .. v14}, Lcom/google/android/gms/internal/zzgt;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/internal/zzgz;Lcom/google/android/gms/internal/zzgq;Lcom/google/android/gms/internal/zzgp;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;ZZLcom/google/android/gms/ads/internal/formats/NativeAdOptionsParcel;Ljava/util/List;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/google/android/gms/internal/zzgx;->zzbxc:Lcom/google/android/gms/internal/zzgt;

    monitor-exit v20
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgx;->zzbxc:Lcom/google/android/gms/internal/zzgt;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/google/android/gms/internal/zzgx;->zzbwt:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/google/android/gms/internal/zzgx;->zzbwu:J

    invoke-virtual {v2, v8, v9, v10, v11}, Lcom/google/android/gms/internal/zzgt;->zza(JJ)Lcom/google/android/gms/internal/zzgu;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgx;->zzbwy:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget v3, v2, Lcom/google/android/gms/internal/zzgu;->zzbwl:I

    if-nez v3, :cond_5

    const-string/jumbo v3, "Adapter succeeded."

    invoke-static {v3}, Lcom/google/android/gms/internal/zzkx;->zzdg(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    const-string/jumbo v5, "mediation_network_succeed"

    invoke-virtual {v3, v5, v4}, Lcom/google/android/gms/internal/zzdz;->zzg(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    const-string/jumbo v4, "mediation_networks_fail"

    const-string/jumbo v5, ","

    invoke-static {v5, v15}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/internal/zzdz;->zzg(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "mls"

    aput-object v6, v4, v5

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v4}, Lcom/google/android/gms/internal/zzdz;->zza(Lcom/google/android/gms/internal/zzdx;[Ljava/lang/String;)Z

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "ttm"

    aput-object v6, v4, v5

    move-object/from16 v0, v16

    invoke-virtual {v3, v0, v4}, Lcom/google/android/gms/internal/zzdz;->zza(Lcom/google/android/gms/internal/zzdx;[Ljava/lang/String;)Z

    goto/16 :goto_2

    :catchall_0
    move-exception v2

    :try_start_2
    monitor-exit v20
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    :cond_5
    invoke-interface {v15, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v6, "mlf"

    aput-object v6, v4, v5

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v4}, Lcom/google/android/gms/internal/zzdz;->zza(Lcom/google/android/gms/internal/zzdx;[Ljava/lang/String;)Z

    iget-object v3, v2, Lcom/google/android/gms/internal/zzgu;->zzbwn:Lcom/google/android/gms/internal/zzha;

    if-eqz v3, :cond_1

    sget-object v3, Lcom/google/android/gms/internal/zzlb;->zzcvl:Landroid/os/Handler;

    new-instance v4, Lcom/google/android/gms/internal/zzgx$1;

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v2}, Lcom/google/android/gms/internal/zzgx$1;-><init>(Lcom/google/android/gms/internal/zzgx;Lcom/google/android/gms/internal/zzgu;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_1

    :cond_6
    invoke-interface {v15}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzgx;->zzalt:Lcom/google/android/gms/internal/zzdz;

    const-string/jumbo v3, "mediation_networks_fail"

    const-string/jumbo v4, ","

    invoke-static {v4, v15}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/internal/zzdz;->zzg(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    new-instance v2, Lcom/google/android/gms/internal/zzgu;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/zzgu;-><init>(I)V

    goto/16 :goto_2
.end method

.method public zzoe()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzgu;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgx;->zzbwy:Ljava/util/List;

    return-object v0
.end method
