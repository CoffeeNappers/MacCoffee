.class public Lcom/google/android/gms/internal/zzkr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzcz$zzb;
.implements Lcom/google/android/gms/internal/zzkz$zzb;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private final zzako:Ljava/lang/Object;

.field private zzama:Lcom/google/android/gms/internal/zzco;

.field private zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

.field private zzaoz:Z

.field private zzawi:Lcom/google/android/gms/internal/zzcy;

.field private zzbre:Ljava/lang/String;

.field private zzcot:Z

.field private zzcou:Z

.field private zzcov:Z

.field private zzcpd:Z

.field private final zzctq:Ljava/lang/String;

.field private final zzctr:Lcom/google/android/gms/internal/zzks;

.field private zzcts:Ljava/math/BigInteger;

.field private final zzctt:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzkp;",
            ">;"
        }
    .end annotation
.end field

.field private final zzctu:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzku;",
            ">;"
        }
    .end annotation
.end field

.field private zzctv:Z

.field private zzctw:I

.field private zzctx:Lcom/google/android/gms/internal/zzdt;

.field private zzcty:Lcom/google/android/gms/internal/zzda;

.field private zzctz:Ljava/lang/String;

.field private zzcua:Ljava/lang/String;

.field private zzcub:Ljava/lang/Boolean;

.field private zzcuc:Z

.field private zzcud:Z

.field private zzcue:Z

.field private zzcuf:Ljava/lang/String;

.field private zzcug:J

.field private zzcuh:J

.field private zzcui:I


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzlb;)V
    .locals 6

    const-wide/16 v4, 0x0

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    sget-object v0, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcts:Ljava/math/BigInteger;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctt:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctu:Ljava/util/HashMap;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzkr;->zzctv:Z

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzkr;->zzcot:Z

    iput v1, p0, Lcom/google/android/gms/internal/zzkr;->zzctw:I

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzkr;->zzaoz:Z

    iput-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzctx:Lcom/google/android/gms/internal/zzdt;

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzkr;->zzcou:Z

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzkr;->zzcov:Z

    iput-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcty:Lcom/google/android/gms/internal/zzda;

    iput-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzawi:Lcom/google/android/gms/internal/zzcy;

    iput-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcub:Ljava/lang/Boolean;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzkr;->zzcuc:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzkr;->zzcud:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzkr;->zzcpd:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzkr;->zzcue:Z

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcuf:Ljava/lang/String;

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzkr;->zzcug:J

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzkr;->zzcuh:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcui:I

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzlb;->zzvs()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctq:Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/internal/zzks;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzctq:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzks;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctr:Lcom/google/android/gms/internal/zzks;

    return-void
.end method


# virtual methods
.method public getResources()Landroid/content/res/Resources;
    .locals 4

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-boolean v1, v1, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzcyc:Z

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/google/android/gms/internal/zztl;->Qm:Lcom/google/android/gms/internal/zztl$zzb;

    const-string/jumbo v3, "com.google.android.gms.ads.dynamite"

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zztl;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zztl$zzb;Ljava/lang/String;)Lcom/google/android/gms/internal/zztl;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zztl;->zzbdt()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    :try_end_0
    .catch Lcom/google/android/gms/internal/zztl$zza; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string/jumbo v2, "Cannot load resource from dynamite apk or local jar"

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getSessionId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctq:Ljava/lang/String;

    return-object v0
.end method

.method public zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzkt;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 6

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v0, "app"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzctr:Lcom/google/android/gms/internal/zzks;

    invoke-virtual {v1, p1, p3}, Lcom/google/android/gms/internal/zzks;->zze(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctu:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzctu:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzku;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzku;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    const-string/jumbo v0, "slots"

    invoke-virtual {v3, v0, v4}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctt:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzkp;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkp;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const-string/jumbo v0, "ads"

    invoke-virtual {v3, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctt:Ljava/util/HashSet;

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/zzkt;->zza(Ljava/util/HashSet;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctt:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v3
.end method

.method public zza(Lcom/google/android/gms/internal/zzkp;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctt:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzku;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctu:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zza(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzjg;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzjh;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzjh;->zza(Ljava/lang/Throwable;Ljava/lang/String;)V

    return-void
.end method

.method public zzaf(Z)V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcou:Z

    if-eq v0, p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkz;->zze(Landroid/content/Context;Z)Ljava/util/concurrent/Future;

    :cond_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcou:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzkr;->zzw(Landroid/content/Context;)Lcom/google/android/gms/internal/zzda;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzda;->isAlive()Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "start fetching content..."

    invoke-static {v2}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzda;->zzjh()V

    :cond_1
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzag(Z)V
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcov:Z

    if-eq v0, p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkz;->zze(Landroid/content/Context;Z)Ljava/util/concurrent/Future;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkz;->zze(Landroid/content/Context;Z)Ljava/util/concurrent/Future;

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcov:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzkr;->zzw(Landroid/content/Context;)Lcom/google/android/gms/internal/zzda;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzda;->isAlive()Z

    move-result v2

    if-nez v2, :cond_1

    const-string/jumbo v2, "start fetching content..."

    invoke-static {v2}, Lcom/google/android/gms/internal/zzkx;->zzdh(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzda;->zzjh()V

    :cond_1
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzah(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcue:Z

    return-void
.end method

.method public zzai(Z)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcuc:Z

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzb(Ljava/lang/Boolean;)V
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcub:Ljava/lang/Boolean;

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzb(Ljava/util/HashSet;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzkp;",
            ">;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctt:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzbf(I)Ljava/util/concurrent/Future;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcui:I

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkz;->zza(Landroid/content/Context;I)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzc(Landroid/content/Context;Z)Ljava/util/concurrent/Future;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcot:Z

    if-eq p2, v0, :cond_0

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzkr;->zzcot:Z

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzkz;->zzc(Landroid/content/Context;Z)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzc(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzaoz:Z

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkr;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgp()Lcom/google/android/gms/internal/zzcz;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzcz;->zza(Lcom/google/android/gms/internal/zzcz$zzb;)V

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzkz;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzkz$zzb;)Ljava/util/concurrent/Future;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzkz;->zzb(Landroid/content/Context;Lcom/google/android/gms/internal/zzkz$zzb;)Ljava/util/concurrent/Future;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzkz;->zzc(Landroid/content/Context;Lcom/google/android/gms/internal/zzkz$zzb;)Ljava/util/concurrent/Future;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzkz;->zzd(Landroid/content/Context;Lcom/google/android/gms/internal/zzkz$zzb;)Ljava/util/concurrent/Future;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzkz;->zze(Landroid/content/Context;Lcom/google/android/gms/internal/zzkz$zzb;)Ljava/util/concurrent/Future;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzkz;->zzf(Landroid/content/Context;Lcom/google/android/gms/internal/zzkz$zzb;)Ljava/util/concurrent/Future;

    invoke-static {p1, p0}, Lcom/google/android/gms/internal/zzkz;->zzg(Landroid/content/Context;Lcom/google/android/gms/internal/zzkz$zzb;)Ljava/util/concurrent/Future;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzkr;->zzvh()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v0

    iget-object v2, p2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzda:Ljava/lang/String;

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/internal/zzlb;->zzh(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzbre:Ljava/lang/String;

    invoke-static {}, Lcom/google/android/gms/common/util/zzs;->zzayy()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/security/NetworkSecurityPolicy;->getInstance()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {v0}, Landroid/security/NetworkSecurityPolicy;->isCleartextTrafficPermitted()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcud:Z

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzco;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzkr;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgm()Lcom/google/android/gms/internal/zzlb;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Lcom/google/android/gms/internal/zzlb;->zzd(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzgh;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Lcom/google/android/gms/internal/zzco;-><init>(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Lcom/google/android/gms/internal/zzgh;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzama:Lcom/google/android/gms/internal/zzco;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzkr;->zzvj()V

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzha()Lcom/google/android/gms/ads/internal/purchase/zzi;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/internal/purchase/zzi;->zzr(Landroid/content/Context;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzaoz:Z

    :cond_1
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzcw(Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctz:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkr;->zzctz:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkz;->zzf(Landroid/content/Context;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzcx(Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcua:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcua:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzkz;->zzg(Landroid/content/Context;Ljava/lang/String;)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzd(Landroid/content/Context;Ljava/lang/String;)Ljava/util/concurrent/Future;
    .locals 4

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcug:J

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    if-eqz p2, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcuf:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p2, p0, Lcom/google/android/gms/internal/zzkr;->zzcuf:Ljava/lang/String;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcug:J

    invoke-static {p1, p2, v2, v3}, Lcom/google/android/gms/internal/zzkz;->zza(Landroid/content/Context;Ljava/lang/String;J)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzd(Landroid/content/Context;Z)Ljava/util/concurrent/Future;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcpd:Z

    if-eq p2, v0, :cond_0

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzkr;->zzcpd:Z

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzkz;->zzf(Landroid/content/Context;Z)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzh(Landroid/os/Bundle;)V
    .locals 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    const-string/jumbo v0, "use_https"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcot:Z

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcot:Z

    const-string/jumbo v0, "webview_cache_version"

    iget v2, p0, Lcom/google/android/gms/internal/zzkr;->zzctw:I

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctw:I

    const-string/jumbo v0, "content_url_opted_out"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "content_url_opted_out"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzkr;->zzaf(Z)V

    :cond_0
    const-string/jumbo v0, "content_url_hashes"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "content_url_hashes"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctz:Ljava/lang/String;

    :cond_1
    const-string/jumbo v0, "auto_collect_location"

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcpd:Z

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcpd:Z

    const-string/jumbo v0, "content_vertical_opted_out"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "content_vertical_opted_out"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzkr;->zzag(Z)V

    :cond_2
    const-string/jumbo v0, "content_vertical_hashes"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "content_vertical_hashes"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcua:Ljava/lang/String;

    :cond_3
    const-string/jumbo v0, "app_settings_json"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string/jumbo v0, "app_settings_json"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcuf:Ljava/lang/String;

    const-string/jumbo v0, "app_settings_last_update_ms"

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcug:J

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcug:J

    const-string/jumbo v0, "app_last_background_time_ms"

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcuh:J

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcuh:J

    const-string/jumbo v0, "request_in_session_count"

    iget v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcui:I

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcui:I

    monitor-exit v1

    return-void

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcuf:Ljava/lang/String;

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzk(Z)V
    .locals 4

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcuh:J

    sub-long v2, v0, v2

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbgb:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long v0, v2, v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctr:Lcom/google/android/gms/internal/zzks;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzks;->zzbg(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctr:Lcom/google/android/gms/internal/zzks;

    iget v1, p0, Lcom/google/android/gms/internal/zzkr;->zzcui:I

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzks;->zzbg(I)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgs()Lcom/google/android/gms/common/util/zze;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/zze;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzkr;->zzo(J)Ljava/util/concurrent/Future;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctr:Lcom/google/android/gms/internal/zzks;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzks;->zzvd()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzkr;->zzbf(I)Ljava/util/concurrent/Future;

    goto :goto_0
.end method

.method public zzo(J)Ljava/util/concurrent/Future;
    .locals 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcuh:J

    cmp-long v0, v2, p1

    if-gez v0, :cond_0

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzkr;->zzcuh:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/zzkz;->zza(Landroid/content/Context;J)Ljava/util/concurrent/Future;

    move-result-object v0

    monitor-exit v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzuq()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcou:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzur()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcov:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzus()Ljava/lang/String;
    .locals 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcts:Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcts:Ljava/math/BigInteger;

    sget-object v3, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcts:Ljava/math/BigInteger;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzut()Lcom/google/android/gms/internal/zzks;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctr:Lcom/google/android/gms/internal/zzks;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzuu()Lcom/google/android/gms/internal/zzdt;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctx:Lcom/google/android/gms/internal/zzdt;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzuv()Z
    .locals 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctv:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzkr;->zzctv:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzuw()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcot:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcud:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzux()Ljava/lang/String;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzbre:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzuy()Ljava/lang/String;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctz:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzuz()Ljava/lang/String;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcua:Ljava/lang/String;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzva()Ljava/lang/Boolean;
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcub:Ljava/lang/Boolean;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzvb()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcpd:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzvc()J
    .locals 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcuh:J

    monitor-exit v1

    return-wide v2

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzvd()I
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcui:I

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzve()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcue:Z

    return v0
.end method

.method public zzvf()Lcom/google/android/gms/internal/zzkq;
    .locals 6

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    new-instance v0, Lcom/google/android/gms/internal/zzkq;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzcuf:Ljava/lang/String;

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzkr;->zzcug:J

    invoke-direct {v0, v2, v4, v5}, Lcom/google/android/gms/internal/zzkq;-><init>(Ljava/lang/String;J)V

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzvg()Lcom/google/android/gms/internal/zzco;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzama:Lcom/google/android/gms/internal/zzco;

    return-object v0
.end method

.method public zzvh()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzjg;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzjh;

    return-void
.end method

.method public zzvi()Z
    .locals 2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcuc:Z

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method zzvj()V
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzds;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    iget-object v2, v2, Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;->zzda:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzds;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgt()Lcom/google/android/gms/internal/zzdu;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzdu;->zza(Lcom/google/android/gms/internal/zzds;)Lcom/google/android/gms/internal/zzdt;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzctx:Lcom/google/android/gms/internal/zzdt;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "Cannot initialize CSI reporter."

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzkx;->zzc(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public zzw(Landroid/content/Context;)Lcom/google/android/gms/internal/zzda;
    .locals 5

    const/4 v1, 0x0

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbeu:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/common/util/zzs;->zzayq()Z

    move-result v0

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbfc:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbfa:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    move-object v0, v1

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzkr;->zzuq()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzkr;->zzur()Z

    move-result v0

    if-eqz v0, :cond_3

    move-object v0, v1

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzkr;->zzako:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_4

    if-nez p1, :cond_5

    :cond_4
    monitor-exit v2

    move-object v0, v1

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzawi:Lcom/google/android/gms/internal/zzcy;

    if-nez v0, :cond_6

    new-instance v0, Lcom/google/android/gms/internal/zzcy;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzcy;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzawi:Lcom/google/android/gms/internal/zzcy;

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcty:Lcom/google/android/gms/internal/zzda;

    if-nez v0, :cond_7

    new-instance v0, Lcom/google/android/gms/internal/zzda;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzkr;->zzawi:Lcom/google/android/gms/internal/zzcy;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzkr;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzkr;->zzanu:Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzjg;->zzb(Landroid/content/Context;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;)Lcom/google/android/gms/internal/zzjh;

    move-result-object v3

    invoke-direct {v0, v1, v3}, Lcom/google/android/gms/internal/zzda;-><init>(Lcom/google/android/gms/internal/zzcy;Lcom/google/android/gms/internal/zzjh;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcty:Lcom/google/android/gms/internal/zzda;

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcty:Lcom/google/android/gms/internal/zzda;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzda;->zzjh()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzkr;->zzcty:Lcom/google/android/gms/internal/zzda;

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
