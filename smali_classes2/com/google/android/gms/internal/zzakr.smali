.class public Lcom/google/android/gms/internal/zzakr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaku;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final aZR:Lcom/google/android/gms/internal/zzalw;

.field private final bgA:Lcom/google/android/gms/internal/zzaky;

.field private final bgB:Lcom/google/android/gms/internal/zzakq;

.field private bgC:J

.field private final bgz:Lcom/google/android/gms/internal/zzakv;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzakr;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzakr;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzakv;Lcom/google/android/gms/internal/zzakq;)V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzang;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzang;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/google/android/gms/internal/zzakr;-><init>(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzakv;Lcom/google/android/gms/internal/zzakq;Lcom/google/android/gms/internal/zzanf;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzakv;Lcom/google/android/gms/internal/zzakq;Lcom/google/android/gms/internal/zzanf;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzakr;->bgC:J

    iput-object p2, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    const-string/jumbo v0, "Persistence"

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    new-instance v0, Lcom/google/android/gms/internal/zzaky;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-direct {v0, v1, v2, p4}, Lcom/google/android/gms/internal/zzaky;-><init>(Lcom/google/android/gms/internal/zzakv;Lcom/google/android/gms/internal/zzalw;Lcom/google/android/gms/internal/zzanf;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzakr;->bgB:Lcom/google/android/gms/internal/zzakq;

    return-void
.end method

.method private zzcwy()V
    .locals 8

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzakr;->bgC:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzakr;->bgC:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgB:Lcom/google/android/gms/internal/zzakq;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzakr;->bgC:J

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzakq;->zzcl(J)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Reached prune check threshold."

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzakr;->bgC:J

    const/4 v0, 0x1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzakv;->zzcrf()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x20

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "Cache size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v1, [Ljava/lang/Object;

    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzakr;->bgB:Lcom/google/android/gms/internal/zzakq;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzaky;->zzcxc()J

    move-result-wide v6

    invoke-interface {v4, v2, v3, v6, v7}, Lcom/google/android/gms/internal/zzakq;->zzi(JJ)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakr;->bgB:Lcom/google/android/gms/internal/zzakq;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzaky;->zza(Lcom/google/android/gms/internal/zzakq;)Lcom/google/android/gms/internal/zzakw;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzakw;->zzcwz()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakw;)V

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzakv;->zzcrf()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gms/internal/zzakr;->aZR:Lcom/google/android/gms/internal/zzalw;

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x2c

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "Cache size after prune: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v6, v1, [Ljava/lang/Object;

    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;J)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;J)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;J)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;J)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzaml;)V
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzakr;->zzi(Lcom/google/android/gms/internal/zzall;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzakr;->zzcwy()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lcom/google/android/gms/internal/zzakv;->zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzall;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            ">;)V"
        }
    .end annotation

    sget-boolean v0, Lcom/google/android/gms/internal/zzakr;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "We should only track keys for filtered queries."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    sget-boolean v1, Lcom/google/android/gms/internal/zzakr;->$assertionsDisabled:Z

    if-nez v1, :cond_2

    if-eqz v0, :cond_1

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    if-nez v1, :cond_2

    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "We only expect tracked keys for currently-active queries."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    iget-wide v2, v0, Lcom/google/android/gms/internal/zzakx;->id:J

    invoke-interface {v1, v2, v3, p2}, Lcom/google/android/gms/internal/zzakv;->zza(JLjava/util/Set;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;Ljava/util/Set;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzall;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            ">;)V"
        }
    .end annotation

    sget-boolean v0, Lcom/google/android/gms/internal/zzakr;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "We should only track keys for filtered queries."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    sget-boolean v1, Lcom/google/android/gms/internal/zzakr;->$assertionsDisabled:Z

    if-nez v1, :cond_2

    if-eqz v0, :cond_1

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zzakx;->bgO:Z

    if-nez v1, :cond_2

    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "We only expect tracked keys for currently-active queries."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    iget-wide v2, v0, Lcom/google/android/gms/internal/zzakx;->id:J

    invoke-interface {v1, v2, v3, p2, p3}, Lcom/google/android/gms/internal/zzakv;->zza(JLjava/util/Set;Ljava/util/Set;)V

    return-void
.end method

.method public zzby(J)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzakv;->zzby(J)V

    return-void
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V
    .locals 3

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzajh;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzajq;->zzh(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/internal/zzakr;->zzk(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public zzcre()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzake;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzakv;->zzcre()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzcrh()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzakv;->zzcrh()V

    return-void
.end method

.method public zzd(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzakr;->zzcwy()V

    return-void
.end method

.method public zzf(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzald;
    .locals 7

    const/4 v3, 0x0

    const/4 v2, 0x1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzo(Lcom/google/android/gms/internal/zzall;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzl(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakx;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    iget-boolean v1, v0, Lcom/google/android/gms/internal/zzakx;->bgN:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    iget-wide v4, v0, Lcom/google/android/gms/internal/zzakx;->id:J

    invoke-interface {v1, v4, v5}, Lcom/google/android/gms/internal/zzakv;->zzcb(J)Ljava/util/Set;

    move-result-object v0

    :goto_0
    move v1, v2

    :goto_1
    iget-object v4, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v4

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    invoke-interface {v4, v0}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v6

    invoke-interface {v3, v0, v6}, Lcom/google/android/gms/internal/zzaml;->zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    move-object v3, v0

    goto :goto_2

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaky;->zzab(Lcom/google/android/gms/internal/zzajq;)Ljava/util/Set;

    move-result-object v0

    move v1, v3

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/google/android/gms/internal/zzald;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v3

    invoke-direct {v0, v3, v1, v2}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    :goto_3
    return-object v0

    :cond_3
    new-instance v0, Lcom/google/android/gms/internal/zzald;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    goto :goto_3
.end method

.method public zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzakv;->beginTransaction()V

    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzakv;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzakv;->endTransaction()V

    return-object v0

    :catch_0
    move-exception v0

    :try_start_1
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzakv;->endTransaction()V

    throw v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzall;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzg(Lcom/google/android/gms/internal/zzall;)V

    return-void
.end method

.method public zzh(Lcom/google/android/gms/internal/zzall;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzh(Lcom/google/android/gms/internal/zzall;)V

    return-void
.end method

.method public zzi(Lcom/google/android/gms/internal/zzall;)V
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaky;->zzaa(Lcom/google/android/gms/internal/zzajq;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzn(Lcom/google/android/gms/internal/zzall;)V

    goto :goto_0
.end method

.method public zzk(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzad(Lcom/google/android/gms/internal/zzajq;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgz:Lcom/google/android/gms/internal/zzakv;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzakv;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakr;->bgA:Lcom/google/android/gms/internal/zzaky;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaky;->zzac(Lcom/google/android/gms/internal/zzajq;)V

    :cond_0
    return-void
.end method
