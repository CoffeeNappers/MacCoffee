.class public Lcom/google/android/gms/internal/zzanw;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final bll:Lcom/google/android/gms/internal/zzaoa;

.field public final bls:Lcom/google/android/gms/internal/zzanx;

.field public final blt:Lcom/google/android/gms/internal/zzanx;

.field public final blu:Lcom/google/android/gms/internal/zzanx;

.field public final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzanx;Lcom/google/android/gms/internal/zzanx;Lcom/google/android/gms/internal/zzanx;Lcom/google/android/gms/internal/zzaoa;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzanw;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzanw;->bls:Lcom/google/android/gms/internal/zzanx;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzanw;->blt:Lcom/google/android/gms/internal/zzanx;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzanw;->blu:Lcom/google/android/gms/internal/zzanx;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzanw;->bll:Lcom/google/android/gms/internal/zzaoa;

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzanx;)Lcom/google/android/gms/internal/zzaob$zza;
    .locals 10

    new-instance v3, Lcom/google/android/gms/internal/zzaob$zza;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzaob$zza;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzanx;->V()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzanx;->V()Ljava/util/Map;

    move-result-object v4

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v9, Lcom/google/android/gms/internal/zzaob$zzb;

    invoke-direct {v9}, Lcom/google/android/gms/internal/zzaob$zzb;-><init>()V

    iput-object v2, v9, Lcom/google/android/gms/internal/zzaob$zzb;->zzcb:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    iput-object v2, v9, Lcom/google/android/gms/internal/zzaob$zzb;->blE:[B

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/zzaob$zzd;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzaob$zzd;-><init>()V

    iput-object v0, v1, Lcom/google/android/gms/internal/zzaob$zzd;->EY:Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzaob$zzb;

    invoke-interface {v7, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzaob$zzb;

    iput-object v0, v1, Lcom/google/android/gms/internal/zzaob$zzd;->blI:[Lcom/google/android/gms/internal/zzaob$zzb;

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzaob$zzd;

    invoke-interface {v5, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzaob$zzd;

    iput-object v0, v3, Lcom/google/android/gms/internal/zzaob$zza;->blC:[Lcom/google/android/gms/internal/zzaob$zzd;

    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzanx;->getTimestamp()J

    move-result-wide v0

    iput-wide v0, v3, Lcom/google/android/gms/internal/zzaob$zza;->timestamp:J

    return-object v3
.end method


# virtual methods
.method public run()V
    .locals 10

    new-instance v2, Lcom/google/android/gms/internal/zzaob$zze;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzaob$zze;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->bls:Lcom/google/android/gms/internal/zzanx;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->bls:Lcom/google/android/gms/internal/zzanx;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzanw;->zza(Lcom/google/android/gms/internal/zzanx;)Lcom/google/android/gms/internal/zzaob$zza;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzaob$zze;->blJ:Lcom/google/android/gms/internal/zzaob$zza;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->blt:Lcom/google/android/gms/internal/zzanx;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->blt:Lcom/google/android/gms/internal/zzanx;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzanw;->zza(Lcom/google/android/gms/internal/zzanx;)Lcom/google/android/gms/internal/zzaob$zza;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzaob$zze;->blK:Lcom/google/android/gms/internal/zzaob$zza;

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->blu:Lcom/google/android/gms/internal/zzanx;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->blu:Lcom/google/android/gms/internal/zzanx;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzanw;->zza(Lcom/google/android/gms/internal/zzanx;)Lcom/google/android/gms/internal/zzaob$zza;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzaob$zze;->blL:Lcom/google/android/gms/internal/zzaob$zza;

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->bll:Lcom/google/android/gms/internal/zzaoa;

    if-eqz v0, :cond_3

    new-instance v0, Lcom/google/android/gms/internal/zzaob$zzc;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaob$zzc;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzanw;->bll:Lcom/google/android/gms/internal/zzaoa;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaoa;->getLastFetchStatus()I

    move-result v1

    iput v1, v0, Lcom/google/android/gms/internal/zzaob$zzc;->blF:I

    iget-object v1, p0, Lcom/google/android/gms/internal/zzanw;->bll:Lcom/google/android/gms/internal/zzaoa;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaoa;->isDeveloperModeEnabled()Z

    move-result v1

    iput-boolean v1, v0, Lcom/google/android/gms/internal/zzaob$zzc;->blG:Z

    iput-object v0, v2, Lcom/google/android/gms/internal/zzaob$zze;->blM:Lcom/google/android/gms/internal/zzaob$zzc;

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->bll:Lcom/google/android/gms/internal/zzaoa;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->bll:Lcom/google/android/gms/internal/zzaoa;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaoa;->Y()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_6

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzanw;->bll:Lcom/google/android/gms/internal/zzaoa;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaoa;->Y()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    new-instance v6, Lcom/google/android/gms/internal/zzaob$zzf;

    invoke-direct {v6}, Lcom/google/android/gms/internal/zzaob$zzf;-><init>()V

    iput-object v0, v6, Lcom/google/android/gms/internal/zzaob$zzf;->EY:Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzanv;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzanv;->U()J

    move-result-wide v8

    iput-wide v8, v6, Lcom/google/android/gms/internal/zzaob$zzf;->blP:J

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzanv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzanv;->T()I

    move-result v0

    iput v0, v6, Lcom/google/android/gms/internal/zzaob$zzf;->resourceId:I

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzaob$zzf;

    invoke-interface {v3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzaob$zzf;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzaob$zze;->blN:[Lcom/google/android/gms/internal/zzaob$zzf;

    :cond_6
    invoke-static {v2}, Lcom/google/android/gms/internal/zzasa;->zzf(Lcom/google/android/gms/internal/zzasa;)[B

    move-result-object v0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzanw;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "persisted_config"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "AsyncPersisterTask"

    const-string/jumbo v2, "Could not persist config."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method
