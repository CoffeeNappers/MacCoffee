.class public Lcom/google/android/gms/internal/zzakj;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajm;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static bge:Lcom/google/android/gms/internal/zzakj;


# instance fields
.field final bgd:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/google/android/gms/internal/zzajl;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajl;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzakj;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzakj;->$assertionsDisabled:Z

    new-instance v0, Lcom/google/android/gms/internal/zzakj;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzakj;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzakj;->bge:Lcom/google/android/gms/internal/zzakj;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    return-void
.end method

.method public static zzcwl()Lcom/google/android/gms/internal/zzakj;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzakj;->bge:Lcom/google/android/gms/internal/zzakj;

    return-object v0
.end method

.method private zzj(Lcom/google/android/gms/internal/zzajl;)V
    .locals 5

    const/4 v1, 0x0

    iget-object v4, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    monitor-enter v4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_7

    move v3, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v3, v2, :cond_6

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_1

    const/4 v2, 0x1

    invoke-interface {v0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    move v0, v2

    :goto_2
    sget-boolean v2, Lcom/google/android/gms/internal/zzakj;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcvd()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_0

    :cond_2
    :try_start_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->isDefault()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajl;->zza(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzajl;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_4

    :goto_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p1, :cond_5

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_6
    move v2, v1

    goto :goto_1

    :cond_7
    move v0, v1

    goto :goto_2
.end method


# virtual methods
.method public zzd(Lcom/google/android/gms/internal/zzajl;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzakj;->zzj(Lcom/google/android/gms/internal/zzajl;)V

    return-void
.end method

.method public zzi(Lcom/google/android/gms/internal/zzajl;)V
    .locals 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->isDefault()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajl;->zza(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzajl;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v3, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajl;->zzdb(Z)V

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/zzajl;->zza(Lcom/google/android/gms/internal/zzajm;)V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zzk(Lcom/google/android/gms/internal/zzajl;)V
    .locals 6

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    monitor-enter v3

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakj;->bgd:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->isDefault()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    move v2, v1

    :goto_0
    if-ltz v2, :cond_2

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajl;->zzcvb()V

    :cond_0
    add-int/lit8 v1, v2, -0x1

    move v2, v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajl;->zzcvb()V

    :cond_2
    monitor-exit v3

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
