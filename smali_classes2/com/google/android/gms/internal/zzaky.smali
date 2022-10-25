.class public Lcom/google/android/gms/internal/zzaky;
.super Ljava/lang/Object;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final bgP:Lcom/google/android/gms/internal/zzala;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzala",
            "<",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzalk;",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final bgQ:Lcom/google/android/gms/internal/zzala;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzala",
            "<",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzalk;",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final bgR:Lcom/google/android/gms/internal/zzala;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzala",
            "<",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;"
        }
    .end annotation
.end field

.field private static final bgS:Lcom/google/android/gms/internal/zzala;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzala",
            "<",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final aZR:Lcom/google/android/gms/internal/zzalw;

.field private bgT:Lcom/google/android/gms/internal/zzakz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzalk;",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;>;"
        }
    .end annotation
.end field

.field private final bgU:Lcom/google/android/gms/internal/zzanf;

.field private bgV:J

.field private final bgz:Lcom/google/android/gms/internal/zzakv;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzaky;->$assertionsDisabled:Z

    new-instance v0, Lcom/google/android/gms/internal/zzaky$1;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaky$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzaky;->bgP:Lcom/google/android/gms/internal/zzala;

    new-instance v0, Lcom/google/android/gms/internal/zzaky$2;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaky$2;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzaky;->bgQ:Lcom/google/android/gms/internal/zzala;

    new-instance v0, Lcom/google/android/gms/internal/zzaky$3;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaky$3;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzaky;->bgR:Lcom/google/android/gms/internal/zzala;

    new-instance v0, Lcom/google/android/gms/internal/zzaky$4;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaky$4;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzaky;->bgS:Lcom/google/android/gms/internal/zzala;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzakv;Lcom/google/android/gms/internal/zzalw;Lcom/google/android/gms/internal/zzanf;)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzaky;->bgV:J

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaky;->aZR:Lcom/google/android/gms/internal/zzalw;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaky;->bgU:Lcom/google/android/gms/internal/zzanf;

    new-instance v0, Lcom/google/android/gms/internal/zzakz;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaky;->zzcxb()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzakv;->zzcrg()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    iget-wide v2, v0, Lcom/google/android/gms/internal/zzakx;->id:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaky;->bgV:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzaky;->bgV:J

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zzb(Lcom/google/android/gms/internal/zzakx;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static zza(Lcom/google/android/gms/internal/zzakq;J)J
    .locals 5

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzakq;->zzcww()F

    move-result v1

    sub-float/2addr v0, v1

    long-to-float v1, p1

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-long v0, v0

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzakq;->zzcwx()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    sub-long v0, p1, v0

    return-wide v0
.end method

.method private zza(Lcom/google/android/gms/internal/zzala;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzala",
            "<",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzakx;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method private zza(Lcom/google/android/gms/internal/zzakx;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaky;->zzb(Lcom/google/android/gms/internal/zzakx;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzakx;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaky;Lcom/google/android/gms/internal/zzakx;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzakx;)V

    return-void
.end method

.method private zzae(Lcom/google/android/gms/internal/zzajq;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzaky;->bgP:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzaf(Lcom/google/android/gms/internal/zzajq;)Ljava/util/Set;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    iget-object v3, v0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v3

    if-nez v3, :cond_0

    iget-wide v4, v0, Lcom/google/android/gms/internal/zzakx;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method private zzb(Lcom/google/android/gms/internal/zzakx;)V
    .locals 6

    iget-object v0, p1, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaky;->zzj(Lcom/google/android/gms/internal/zzall;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    move-object v1, v0

    :goto_0
    iget-object v0, p1, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    if-eqz v0, :cond_0

    iget-wide v2, v0, Lcom/google/android/gms/internal/zzakx;->id:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzakx;->id:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzann;->zzcx(Z)V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    move-object v1, v0

    goto :goto_0
.end method

.method private zzb(Lcom/google/android/gms/internal/zzall;Z)V
    .locals 8

    invoke-static {p1}, Lcom/google/android/gms/internal/zzaky;->zzk(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/zzaky;->zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaky;->bgU:Lcom/google/android/gms/internal/zzanf;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzanf;->z()J

    move-result-wide v4

    if-eqz v0, :cond_0

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/zzakx;->zzcm(J)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzakx;->zzdc(Z)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    :goto_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzakx;)V

    return-void

    :cond_0
    sget-boolean v0, Lcom/google/android/gms/internal/zzaky;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "If we\'re setting the query to inactive, we should already be tracking it!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzakx;

    iget-wide v1, p0, Lcom/google/android/gms/internal/zzaky;->bgV:J

    const-wide/16 v6, 0x1

    add-long/2addr v6, v1

    iput-wide v6, p0, Lcom/google/android/gms/internal/zzaky;->bgV:J

    const/4 v6, 0x0

    move v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzakx;-><init>(JLcom/google/android/gms/internal/zzall;JZZ)V

    goto :goto_0
.end method

.method private zzcxb()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzakv;->beginTransaction()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaky;->bgU:Lcom/google/android/gms/internal/zzanf;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzanf;->z()J

    move-result-wide v2

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzakv;->zzca(J)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzakv;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzakv;->endTransaction()V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzakv;->endTransaction()V

    throw v0
.end method

.method static synthetic zzcxd()Lcom/google/android/gms/internal/zzala;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzaky;->bgR:Lcom/google/android/gms/internal/zzala;

    return-object v0
.end method

.method private static zzj(Lcom/google/android/gms/internal/zzall;)V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzall;->isDefault()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string/jumbo v1, "Can\'t have tracked non-default query that loads all data"

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static zzk(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object p0

    :cond_0
    return-object p0
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzakq;)Lcom/google/android/gms/internal/zzakw;
    .locals 10

    const/4 v3, 0x0

    sget-object v0, Lcom/google/android/gms/internal/zzaky;->bgR:Lcom/google/android/gms/internal/zzala;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzala;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-static {p1, v0, v1}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzakq;J)J

    move-result-wide v6

    new-instance v1, Lcom/google/android/gms/internal/zzakw;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzakw;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v8, 0x50

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v8, "Pruning old queries.  Prunable: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v5, " Count to prune: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v5}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzaky$6;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzaky$6;-><init>(Lcom/google/android/gms/internal/zzaky;)V

    invoke-static {v4, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    move v2, v3

    :goto_0
    int-to-long v8, v2

    cmp-long v0, v8, v6

    if-gez v0, :cond_1

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    iget-object v5, v0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/zzakw;->zzy(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakw;

    move-result-object v1

    iget-object v0, v0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zzm(Lcom/google/android/gms/internal/zzall;)V

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    long-to-int v0, v6

    move-object v2, v1

    move v1, v0

    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzakw;->zzz(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakw;

    move-result-object v2

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    :cond_2
    sget-object v0, Lcom/google/android/gms/internal/zzaky;->bgS:Lcom/google/android/gms/internal/zzala;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzala;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaky;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaky;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x1f

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "Unprunable queries: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v4, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzakx;->bgL:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzakw;->zzz(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakw;

    move-result-object v2

    goto :goto_2

    :cond_4
    return-object v2
.end method

.method public zzaa(Lcom/google/android/gms/internal/zzajq;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzaky$5;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzaky$5;-><init>(Lcom/google/android/gms/internal/zzaky;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzakz$zza;)V

    return-void
.end method

.method public zzab(Lcom/google/android/gms/internal/zzajq;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            ">;"
        }
    .end annotation

    sget-boolean v0, Lcom/google/android/gms/internal/zzaky;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zzo(Lcom/google/android/gms/internal/zzall;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Path is fully complete."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaky;->zzaf(Lcom/google/android/gms/internal/zzajq;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzakv;->zzh(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->zzcxf()Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzalz;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    sget-object v4, Lcom/google/android/gms/internal/zzaky;->bgP:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v4, v0}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-object v2
.end method

.method public zzac(Lcom/google/android/gms/internal/zzajq;)V
    .locals 8

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaky;->zzae(Lcom/google/android/gms/internal/zzajq;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/google/android/gms/internal/zzaky;->zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzakx;

    iget-wide v1, p0, Lcom/google/android/gms/internal/zzaky;->bgV:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v1

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzaky;->bgV:J

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaky;->bgU:Lcom/google/android/gms/internal/zzanf;

    invoke-interface {v4}, Lcom/google/android/gms/internal/zzanf;->z()J

    move-result-wide v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/google/android/gms/internal/zzakx;-><init>(JLcom/google/android/gms/internal/zzall;JZZ)V

    :goto_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzakx;)V

    :cond_0
    return-void

    :cond_1
    sget-boolean v1, Lcom/google/android/gms/internal/zzaky;->$assertionsDisabled:Z

    if-nez v1, :cond_2

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    if-eqz v1, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "This should have been handled above!"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakx;->zzcxa()Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    goto :goto_0
.end method

.method public zzad(Lcom/google/android/gms/internal/zzajq;)Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    sget-object v1, Lcom/google/android/gms/internal/zzaky;->bgQ:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcxc()J
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzaky;->bgR:Lcom/google/android/gms/internal/zzala;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzala;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzall;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzaky;->zzb(Lcom/google/android/gms/internal/zzall;Z)V

    return-void
.end method

.method public zzh(Lcom/google/android/gms/internal/zzall;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzaky;->zzb(Lcom/google/android/gms/internal/zzall;Z)V

    return-void
.end method

.method public zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;
    .locals 3

    invoke-static {p1}, Lcom/google/android/gms/internal/zzaky;->zzk(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzm(Lcom/google/android/gms/internal/zzall;)V
    .locals 6

    invoke-static {p1}, Lcom/google/android/gms/internal/zzaky;->zzk(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzaky;->zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    sget-boolean v2, Lcom/google/android/gms/internal/zzaky;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Query must exist to be removed."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaky;->bgz:Lcom/google/android/gms/internal/zzakv;

    iget-wide v4, v0, Lcom/google/android/gms/internal/zzakx;->id:J

    invoke-interface {v2, v4, v5}, Lcom/google/android/gms/internal/zzakv;->zzbz(J)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zzaj(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    :cond_1
    return-void
.end method

.method public zzn(Lcom/google/android/gms/internal/zzall;)V
    .locals 2

    invoke-static {p1}, Lcom/google/android/gms/internal/zzaky;->zzk(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakx;->zzcxa()Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzakx;)V

    :cond_0
    return-void
.end method

.method public zzo(Lcom/google/android/gms/internal/zzall;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaky;->zzae(Lcom/google/android/gms/internal/zzajq;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_1

    move v1, v2

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaky;->bgT:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakx;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1
.end method
