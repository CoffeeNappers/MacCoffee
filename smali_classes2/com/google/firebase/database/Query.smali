.class public Lcom/google/firebase/database/Query;
.super Ljava/lang/Object;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected final aZj:Lcom/google/android/gms/internal/zzajs;

.field protected final aZr:Lcom/google/android/gms/internal/zzajq;

.field protected final aZv:Lcom/google/android/gms/internal/zzalk;

.field private final aZw:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/firebase/database/Query;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/firebase/database/Query;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    sget-object v0, Lcom/google/android/gms/internal/zzalk;->bhG:Lcom/google/android/gms/internal/zzalk;

    iput-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/firebase/database/Query;->aZw:Z

    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/firebase/database/DatabaseException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iput-object p3, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    iput-boolean p4, p0, Lcom/google/firebase/database/Query;->aZw:Z

    invoke-virtual {p3}, Lcom/google/android/gms/internal/zzalk;->isValid()Z

    move-result v0

    const-string/jumbo v1, "Validation of queries failed."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 5

    invoke-static {p2}, Lcom/google/android/gms/internal/zzano;->zztm(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can only use simple values for startAt()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t call startAt() or equalTo() multiple times"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    if-eqz p2, :cond_2

    invoke-static {p2}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v1, p1, v0}, Lcom/google/android/gms/internal/zzalk;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzalk;)V

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzalk;)V

    sget-boolean v1, Lcom/google/firebase/database/Query;->$assertionsDisabled:Z

    if-nez v1, :cond_3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->isValid()Z

    move-result v1

    if-nez v1, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    new-instance v1, Lcom/google/firebase/database/Query;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-boolean v4, p0, Lcom/google/firebase/database/Query;->aZw:Z

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v1
.end method

.method private zza(Lcom/google/android/gms/internal/zzajl;)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/internal/zzakj;->zzcwl()Lcom/google/android/gms/internal/zzakj;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakj;->zzk(Lcom/google/android/gms/internal/zzajl;)V

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v1, Lcom/google/firebase/database/Query$2;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/database/Query$2;-><init>(Lcom/google/firebase/database/Query;Lcom/google/android/gms/internal/zzajl;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzalk;)V
    .locals 4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzamh;->zzczx()Lcom/google/android/gms/internal/zzamh;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string/jumbo v0, "You must use startAt(String value), endAt(String value) or equalTo(String value) in combination with orderByKey(). Other type of values or using the version with 2 parameters is not supported"

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxt()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxu()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyx()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    if-ne v2, v3, :cond_0

    instance-of v1, v1, Lcom/google/android/gms/internal/zzamr;

    if-nez v1, :cond_1

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxw()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxx()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcyy()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    if-ne v2, v3, :cond_2

    instance-of v1, v1, Lcom/google/android/gms/internal/zzamr;

    if-nez v1, :cond_6

    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzamo;->b()Lcom/google/android/gms/internal/zzamo;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxt()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamp;->zzq(Lcom/google/android/gms/internal/zzaml;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxw()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamp;->zzq(Lcom/google/android/gms/internal/zzaml;)Z

    move-result v0

    if-nez v0, :cond_6

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "When using orderByPriority(), values provided to startAt(), endAt(), or equalTo() must be valid priorities."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    return-void
.end method

.method private zzb(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 5

    invoke-static {p2}, Lcom/google/android/gms/internal/zzano;->zztm(Ljava/lang/String;)V

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can only use simple values for endAt()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    if-eqz p2, :cond_1

    invoke-static {p2}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t call endAt() or equalTo() multiple times"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v1, p1, v0}, Lcom/google/android/gms/internal/zzalk;->zzb(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzalk;)V

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzalk;)V

    sget-boolean v1, Lcom/google/firebase/database/Query;->$assertionsDisabled:Z

    if-nez v1, :cond_3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->isValid()Z

    move-result v1

    if-nez v1, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_3
    new-instance v1, Lcom/google/firebase/database/Query;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-boolean v4, p0, Lcom/google/firebase/database/Query;->aZw:Z

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v1
.end method

.method private zzb(Lcom/google/android/gms/internal/zzajl;)V
    .locals 2

    invoke-static {}, Lcom/google/android/gms/internal/zzakj;->zzcwl()Lcom/google/android/gms/internal/zzakj;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakj;->zzi(Lcom/google/android/gms/internal/zzajl;)V

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v1, Lcom/google/firebase/database/Query$3;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/database/Query$3;-><init>(Lcom/google/firebase/database/Query;Lcom/google/android/gms/internal/zzajl;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    return-void
.end method

.method private zzb(Lcom/google/android/gms/internal/zzalk;)V
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcxz()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t combine startAt(), endAt() and limit(). Use limitToFirst() or limitToLast() instead"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method

.method private zzcra()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->zzcxs()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t call equalTo() and startAt() combined"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->zzcxv()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t call equalTo() and endAt() combined"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method

.method private zzcrb()V
    .locals 2

    iget-boolean v0, p0, Lcom/google/firebase/database/Query;->aZw:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "You can\'t combine multiple orderBy calls!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    return-void
.end method


# virtual methods
.method public addChildEventListener(Lcom/google/firebase/database/ChildEventListener;)Lcom/google/firebase/database/ChildEventListener;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzajg;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p0}, Lcom/google/firebase/database/Query;->zzcrd()Lcom/google/android/gms/internal/zzall;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lcom/google/android/gms/internal/zzajg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ChildEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzajl;)V

    return-object p1
.end method

.method public addListenerForSingleValueEvent(Lcom/google/firebase/database/ValueEventListener;)V
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzakg;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v2, Lcom/google/firebase/database/Query$1;

    invoke-direct {v2, p0, p1}, Lcom/google/firebase/database/Query$1;-><init>(Lcom/google/firebase/database/Query;Lcom/google/firebase/database/ValueEventListener;)V

    invoke-virtual {p0}, Lcom/google/firebase/database/Query;->zzcrd()Lcom/google/android/gms/internal/zzall;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzajl;)V

    return-void
.end method

.method public addValueEventListener(Lcom/google/firebase/database/ValueEventListener;)Lcom/google/firebase/database/ValueEventListener;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzakg;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p0}, Lcom/google/firebase/database/Query;->zzcrd()Lcom/google/android/gms/internal/zzall;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzajl;)V

    return-object p1
.end method

.method public endAt(D)Lcom/google/firebase/database/Query;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/firebase/database/Query;->endAt(DLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public endAt(DLjava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzamd;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamd;-><init>(Ljava/lang/Double;Lcom/google/android/gms/internal/zzaml;)V

    invoke-direct {p0, v0, p3}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public endAt(Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/database/Query;->endAt(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public endAt(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 2

    if-eqz p1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzamr;

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzamr;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzaml;)V

    :goto_0
    invoke-direct {p0, v0, p2}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    goto :goto_0
.end method

.method public endAt(Z)Lcom/google/firebase/database/Query;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/database/Query;->endAt(ZLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public endAt(ZLjava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzaly;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzaly;-><init>(Ljava/lang/Boolean;Lcom/google/android/gms/internal/zzaml;)V

    invoke-direct {p0, v0, p2}, Lcom/google/firebase/database/Query;->zzb(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public equalTo(D)Lcom/google/firebase/database/Query;
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcra()V

    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/database/Query;->startAt(D)Lcom/google/firebase/database/Query;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/database/Query;->endAt(D)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public equalTo(DLjava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcra()V

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/firebase/database/Query;->startAt(DLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/google/firebase/database/Query;->endAt(DLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public equalTo(Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcra()V

    invoke-virtual {p0, p1}, Lcom/google/firebase/database/Query;->startAt(Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/database/Query;->endAt(Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public equalTo(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcra()V

    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/database/Query;->startAt(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/database/Query;->endAt(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public equalTo(Z)Lcom/google/firebase/database/Query;
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcra()V

    invoke-virtual {p0, p1}, Lcom/google/firebase/database/Query;->startAt(Z)Lcom/google/firebase/database/Query;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/firebase/database/Query;->endAt(Z)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public equalTo(ZLjava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 1

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcra()V

    invoke-virtual {p0, p1, p2}, Lcom/google/firebase/database/Query;->startAt(ZLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/google/firebase/database/Query;->endAt(ZLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public getRef()Lcom/google/firebase/database/DatabaseReference;
    .locals 3

    new-instance v0, Lcom/google/firebase/database/DatabaseReference;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p0}, Lcom/google/firebase/database/Query;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/database/DatabaseReference;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V

    return-object v0
.end method

.method public keepSynced(Z)V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzalz;->zzcza()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/firebase/database/DatabaseException;

    const-string/jumbo v1, "Can\'t call keepSynced() on .info paths."

    invoke-direct {v0, v1}, Lcom/google/firebase/database/DatabaseException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v1, Lcom/google/firebase/database/Query$4;

    invoke-direct {v1, p0, p1}, Lcom/google/firebase/database/Query$4;-><init>(Lcom/google/firebase/database/Query;Z)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    return-void
.end method

.method public limitToFirst(I)Lcom/google/firebase/database/Query;
    .locals 5

    if-gtz p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Limit must be a positive integer!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t call limitToLast on query with previously set limit!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Lcom/google/firebase/database/Query;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v3, p1}, Lcom/google/android/gms/internal/zzalk;->zzafy(I)Lcom/google/android/gms/internal/zzalk;

    move-result-object v3

    iget-boolean v4, p0, Lcom/google/firebase/database/Query;->aZw:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v0
.end method

.method public limitToLast(I)Lcom/google/firebase/database/Query;
    .locals 5

    if-gtz p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Limit must be a positive integer!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalk;->zzcxy()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t call limitToLast on query with previously set limit!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Lcom/google/firebase/database/Query;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v3, p1}, Lcom/google/android/gms/internal/zzalk;->zzafz(I)Lcom/google/android/gms/internal/zzalk;

    move-result-object v3

    iget-boolean v4, p0, Lcom/google/firebase/database/Query;->aZw:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v0
.end method

.method public orderByChild(Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 5

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Key can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    const-string/jumbo v0, "$key"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, ".key"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x36

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Can\'t use \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' as path, please use orderByKey() instead!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    const-string/jumbo v0, "$priority"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string/jumbo v0, ".priority"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x3b

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Can\'t use \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' as path, please use orderByPriority() instead!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    const-string/jumbo v0, "$value"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string/jumbo v0, ".value"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x38

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Can\'t use \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' as path, please use orderByValue() instead!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    invoke-static {p1}, Lcom/google/android/gms/internal/zzano;->zzti(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcrb()V

    new-instance v0, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->size()I

    move-result v1

    if-nez v1, :cond_7

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t use empty path, use orderByValue() instead!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    new-instance v1, Lcom/google/android/gms/internal/zzamn;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/zzamn;-><init>(Lcom/google/android/gms/internal/zzajq;)V

    new-instance v0, Lcom/google/firebase/database/Query;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-object v4, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-virtual {v4, v1}, Lcom/google/android/gms/internal/zzalk;->zza(Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzalk;

    move-result-object v1

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v1, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v0
.end method

.method public orderByKey()Lcom/google/firebase/database/Query;
    .locals 5

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcrb()V

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-static {}, Lcom/google/android/gms/internal/zzamh;->zzczx()Lcom/google/android/gms/internal/zzamh;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalk;->zza(Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzalk;)V

    new-instance v1, Lcom/google/firebase/database/Query;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v1
.end method

.method public orderByPriority()Lcom/google/firebase/database/Query;
    .locals 5

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcrb()V

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-static {}, Lcom/google/android/gms/internal/zzamo;->b()Lcom/google/android/gms/internal/zzamo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalk;->zza(Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzalk;)V

    new-instance v1, Lcom/google/firebase/database/Query;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v1
.end method

.method public orderByValue()Lcom/google/firebase/database/Query;
    .locals 5

    invoke-direct {p0}, Lcom/google/firebase/database/Query;->zzcrb()V

    new-instance v0, Lcom/google/firebase/database/Query;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-object v3, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-static {}, Lcom/google/android/gms/internal/zzams;->d()Lcom/google/android/gms/internal/zzams;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/zzalk;->zza(Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzalk;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/firebase/database/Query;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;Z)V

    return-object v0
.end method

.method public removeEventListener(Lcom/google/firebase/database/ChildEventListener;)V
    .locals 3

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "listener must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzajg;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p0}, Lcom/google/firebase/database/Query;->zzcrd()Lcom/google/android/gms/internal/zzall;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lcom/google/android/gms/internal/zzajg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ChildEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzajl;)V

    return-void
.end method

.method public removeEventListener(Lcom/google/firebase/database/ValueEventListener;)V
    .locals 3

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "listener must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzakg;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p0}, Lcom/google/firebase/database/Query;->zzcrd()Lcom/google/android/gms/internal/zzall;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-direct {p0, v0}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzajl;)V

    return-void
.end method

.method public startAt(D)Lcom/google/firebase/database/Query;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/firebase/database/Query;->startAt(DLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public startAt(DLjava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzamd;

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamd;-><init>(Ljava/lang/Double;Lcom/google/android/gms/internal/zzaml;)V

    invoke-direct {p0, v0, p3}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public startAt(Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/database/Query;->startAt(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public startAt(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 2

    if-eqz p1, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzamr;

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzamr;-><init>(Ljava/lang/String;Lcom/google/android/gms/internal/zzaml;)V

    :goto_0
    invoke-direct {p0, v0, p2}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    goto :goto_0
.end method

.method public startAt(Z)Lcom/google/firebase/database/Query;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/firebase/database/Query;->startAt(ZLjava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public startAt(ZLjava/lang/String;)Lcom/google/firebase/database/Query;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzaly;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzaly;-><init>(Ljava/lang/Boolean;Lcom/google/android/gms/internal/zzaml;)V

    invoke-direct {p0, v0, p2}, Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/lang/String;)Lcom/google/firebase/database/Query;

    move-result-object v0

    return-object v0
.end method

.method public zzcrc()Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-object v0
.end method

.method public zzcrd()Lcom/google/android/gms/internal/zzall;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzall;

    iget-object v1, p0, Lcom/google/firebase/database/Query;->aZr:Lcom/google/android/gms/internal/zzajq;

    iget-object v2, p0, Lcom/google/firebase/database/Query;->aZv:Lcom/google/android/gms/internal/zzalk;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzall;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzalk;)V

    return-object v0
.end method
