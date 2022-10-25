.class public Lcom/google/android/gms/internal/zzaka;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzaka$zzb;,
        Lcom/google/android/gms/internal/zzaka$zzc;,
        Lcom/google/android/gms/internal/zzaka$zzd;,
        Lcom/google/android/gms/internal/zzaka$zza;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final aZR:Lcom/google/android/gms/internal/zzalw;

.field private final bff:Lcom/google/android/gms/internal/zzaku;

.field private bfg:Lcom/google/android/gms/internal/zzakz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Lcom/google/android/gms/internal/zzajz;",
            ">;"
        }
    .end annotation
.end field

.field private final bfh:Lcom/google/android/gms/internal/zzakh;

.field private final bfi:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzakb;",
            "Lcom/google/android/gms/internal/zzall;",
            ">;"
        }
    .end annotation
.end field

.field private final bfj:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzall;",
            "Lcom/google/android/gms/internal/zzakb;",
            ">;"
        }
    .end annotation
.end field

.field private final bfk:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/internal/zzall;",
            ">;"
        }
    .end annotation
.end field

.field private final bfl:Lcom/google/android/gms/internal/zzaka$zzd;

.field private bfm:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzaka;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzaku;Lcom/google/android/gms/internal/zzaka$zzd;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzaka;->bfm:J

    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    new-instance v0, Lcom/google/android/gms/internal/zzakh;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzakh;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfh:Lcom/google/android/gms/internal/zzakh;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfi:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfj:Ljava/util/Map;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfk:Ljava/util/Set;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaka;->bfl:Lcom/google/android/gms/internal/zzaka$zzd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    const-string/jumbo v0, "SyncTree"

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaka;->aZR:Lcom/google/android/gms/internal/zzalw;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakb;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zze(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakb;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakz;)Lcom/google/android/gms/internal/zzakz;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakb;)Lcom/google/android/gms/internal/zzall;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzakb;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzalw;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->aZR:Lcom/google/android/gms/internal/zzalw;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;
    .locals 1

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakn;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka;->bfh:Lcom/google/android/gms/internal/zzakh;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzakh;->zzu(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaki;

    move-result-object v2

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakn;",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Lcom/google/android/gms/internal/zzajz;",
            ">;",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/android/gms/internal/zzaki;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzakn;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    if-nez p3, :cond_1

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajz;->zzs(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p3

    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzakn;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/google/android/gms/internal/zzakn;->zzc(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakn;

    move-result-object v5

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzakz;->zzcxf()Lcom/google/android/gms/internal/zzaih;

    move-result-object v1

    invoke-virtual {v1, v4}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzakz;

    if-eqz v1, :cond_2

    if-eqz v5, :cond_2

    if-eqz p3, :cond_4

    invoke-interface {p3, v4}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    :goto_1
    invoke-virtual {p4, v4}, Lcom/google/android/gms/internal/zzaki;->zzb(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaki;

    move-result-object v4

    invoke-direct {p0, v5, v1, v2, v4}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v3, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0, p1, p4, p3}, Lcom/google/android/gms/internal/zzajz;->zza(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_3
    move-object v0, v3

    goto :goto_0

    :cond_4
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private zza(Lcom/google/android/gms/internal/zzakz;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Lcom/google/android/gms/internal/zzajz;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalm;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakz;Ljava/util/List;)V

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakn;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzall;",
            "Lcom/google/android/gms/internal/zzakn;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    sget-boolean v2, Lcom/google/android/gms/internal/zzaka;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Missing sync point for query tag that we\'re tracking"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka;->bfh:Lcom/google/android/gms/internal/zzakh;

    invoke-virtual {v2, v1}, Lcom/google/android/gms/internal/zzakh;->zzu(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaki;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, p2, v1, v2}, Lcom/google/android/gms/internal/zzajz;->zza(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzalm;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzalm;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaka;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zzaw(Ljava/util/List;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzakz;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Lcom/google/android/gms/internal/zzajz;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalm;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->zzcvy()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->zzcvz()Lcom/google/android/gms/internal/zzalm;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->zzcvx()Ljava/util/List;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzakz;->zzcxf()Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakz;Ljava/util/List;)V

    goto :goto_0
.end method

.method private zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzalm;)V
    .locals 5

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zze(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakb;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzaka$zzc;

    invoke-direct {v2, p0, p2}, Lcom/google/android/gms/internal/zzaka$zzc;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzalm;)V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka;->bfl:Lcom/google/android/gms/internal/zzaka$zzd;

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v4

    invoke-interface {v3, v4, v1, v2, v2}, Lcom/google/android/gms/internal/zzaka$zzd;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;Lcom/google/android/gms/internal/zzaix;Lcom/google/android/gms/internal/zzaka$zza;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/zzakz;->zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/google/android/gms/internal/zzaka;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->zzcvy()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "If we\'re adding a query, it shouldn\'t be shadowed"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    new-instance v1, Lcom/google/android/gms/internal/zzaka$5;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzaka$5;-><init>(Lcom/google/android/gms/internal/zzaka;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzakz$zza;)V

    :cond_1
    return-void
.end method

.method private zzaw(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzall;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaka;->zze(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakb;

    move-result-object v2

    sget-boolean v3, Lcom/google/android/gms/internal/zzaka;->$assertionsDisabled:Z

    if-nez v3, :cond_1

    if-nez v2, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_1
    iget-object v3, p0, Lcom/google/android/gms/internal/zzaka;->bfj:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfi:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaku;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zzd(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    return-object v0
.end method

.method private zzb(Lcom/google/android/gms/internal/zzakb;)Lcom/google/android/gms/internal/zzall;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfi:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzall;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakz;)Ljava/util/List;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzakz;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private zzb(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzakz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakn;",
            "Lcom/google/android/gms/internal/zzakz",
            "<",
            "Lcom/google/android/gms/internal/zzajz;",
            ">;",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/android/gms/internal/zzaki;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/google/android/gms/internal/zzajz;

    if-nez p3, :cond_1

    if-eqz v6, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/google/android/gms/internal/zzajz;->zzs(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    :goto_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzakz;->zzcxf()Lcom/google/android/gms/internal/zzaih;

    move-result-object v7

    new-instance v0, Lcom/google/android/gms/internal/zzaka$6;

    move-object v1, p0

    move-object v3, p4

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaka$6;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzakn;Ljava/util/List;)V

    invoke-virtual {v7, v0}, Lcom/google/android/gms/internal/zzaih;->zza(Lcom/google/android/gms/internal/zzaim$zzb;)V

    if-eqz v6, :cond_0

    invoke-virtual {v6, p1, p4, v2}, Lcom/google/android/gms/internal/zzajz;->zza(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-object v5

    :cond_1
    move-object v2, p3

    goto :goto_0
.end method

.method private zzb(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzall;",
            "Lcom/google/android/gms/internal/zzajl;",
            "Lcom/google/firebase/database/DatabaseError;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$4;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaka$4;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakh;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfh:Lcom/google/android/gms/internal/zzakh;

    return-object v0
.end method

.method private zzcwb()Lcom/google/android/gms/internal/zzakb;
    .locals 6

    new-instance v0, Lcom/google/android/gms/internal/zzakb;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaka;->bfm:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzaka;->bfm:J

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/internal/zzakb;-><init>(J)V

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    return-object v0
.end method

.method private zzd(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzall;
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->isDefault()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method private zze(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzakb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfj:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakb;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzaka;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfj:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzakb;
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaka;->zzcwb()Lcom/google/android/gms/internal/zzakb;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzg(Lcom/google/android/gms/internal/zzaka;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfi:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic zzh(Lcom/google/android/gms/internal/zzaka;)Lcom/google/android/gms/internal/zzaka$zzd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfl:Lcom/google/android/gms/internal/zzaka$zzd;

    return-object v0
.end method


# virtual methods
.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZZ",
            "Lcom/google/android/gms/internal/zzanf;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$8;

    move-object v2, p0

    move v3, p4

    move-wide v4, p1

    move v6, p3

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/zzaka$8;-><init>(Lcom/google/android/gms/internal/zzaka;ZJZLcom/google/android/gms/internal/zzanf;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;Lcom/google/android/gms/internal/zzajh;JZ)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzajh;",
            "Lcom/google/android/gms/internal/zzajh;",
            "JZ)",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$7;

    move-object v2, p0

    move/from16 v3, p6

    move-object v4, p1

    move-object v5, p2

    move-wide v6, p4

    move-object v8, p3

    invoke-direct/range {v1 .. v8}, Lcom/google/android/gms/internal/zzaka$7;-><init>(Lcom/google/android/gms/internal/zzaka;ZLcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;JLcom/google/android/gms/internal/zzajh;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/android/gms/internal/zzakb;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$14;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/google/android/gms/internal/zzaka$14;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakb;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;JZZ)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/android/gms/internal/zzaml;",
            "JZZ)",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    if-nez p6, :cond_0

    if-nez p7, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string/jumbo v1, "We shouldn\'t be persisting non-visible writes."

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$1;

    move-object v2, p0

    move/from16 v3, p7

    move-object v4, p1

    move-object v5, p2

    move-wide v6, p4

    move-object v8, p3

    move/from16 v9, p6

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/internal/zzaka$1;-><init>(Lcom/google/android/gms/internal/zzaka;ZLcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;JLcom/google/android/gms/internal/zzaml;Z)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzamq;",
            ">;",
            "Lcom/google/android/gms/internal/zzakb;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzakb;)Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    if-eqz v1, :cond_4

    sget-boolean v0, Lcom/google/android/gms/internal/zzaka;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajq;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    sget-boolean v2, Lcom/google/android/gms/internal/zzaka;->$assertionsDisabled:Z

    if-nez v2, :cond_1

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Missing sync point for query tag that we\'re tracking"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_1
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajz;->zzb(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzalm;

    move-result-object v0

    sget-boolean v1, Lcom/google/android/gms/internal/zzaka;->$assertionsDisabled:Z

    if-nez v1, :cond_2

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Missing view for query tag that we\'re tracking"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalm;->zzcyj()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamq;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzamq;->zzr(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    move-object v1, v0

    goto :goto_0

    :cond_3
    invoke-virtual {p0, p1, v1, p3}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_4
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzaml;",
            ">;)",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$11;

    invoke-direct {v1, p0, p2, p1}, Lcom/google/android/gms/internal/zzaka$11;-><init>(Lcom/google/android/gms/internal/zzaka;Ljava/util/Map;Lcom/google/android/gms/internal/zzajq;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzaml;",
            ">;",
            "Lcom/google/android/gms/internal/zzakb;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$2;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/google/android/gms/internal/zzaka$2;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakb;Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakb;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$13;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzaka$13;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzakb;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzall;",
            "Lcom/google/firebase/database/DatabaseError;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;Z)V
    .locals 1

    if-eqz p2, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfk:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/google/android/gms/internal/zzaka$zzb;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzaka$zzb;-><init>(Lcom/google/android/gms/internal/zzall;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaka;->zzg(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfk:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfk:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzaka$zzb;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzaka$zzb;-><init>(Lcom/google/android/gms/internal/zzall;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaka;->zzh(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfk:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzamq;",
            ">;)",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajz;->zzcvz()Lcom/google/android/gms/internal/zzalm;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalm;->zzcyj()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamq;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzamq;->zzr(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    move-object v1, v0

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p1, v1}, Lcom/google/android/gms/internal/zzaka;->zzi(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/google/android/gms/internal/zzaml;"
        }
    .end annotation

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaka;->bfg:Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    const/4 v1, 0x0

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    move-object v4, v2

    move-object v2, p1

    :goto_0
    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v5

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-virtual {v0, v5}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v6

    if-eqz v5, :cond_1

    invoke-virtual {v4, v5}, Lcom/google/android/gms/internal/zzakz;->zze(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v4

    :goto_1
    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajz;

    if-eqz v0, :cond_2

    invoke-virtual {v0, v6}, Lcom/google/android/gms/internal/zzajz;->zzs(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_2
    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_3

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaka;->bfh:Lcom/google/android/gms/internal/zzakh;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, p2, v2}, Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Ljava/util/List;Z)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object v4

    goto :goto_1

    :cond_2
    move-object v0, v1

    goto :goto_2

    :cond_3
    move-object v1, v0

    move-object v0, v2

    move-object v2, v3

    goto :goto_0
.end method

.method public zzcwa()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$9;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzaka$9;-><init>(Lcom/google/android/gms/internal/zzaka;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajl;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$3;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzaka$3;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzajl;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zzh(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajl;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzi(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzaml;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$10;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/internal/zzaka$10;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public zzt(Lcom/google/android/gms/internal/zzajq;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaka;->bff:Lcom/google/android/gms/internal/zzaku;

    new-instance v1, Lcom/google/android/gms/internal/zzaka$12;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzaka$12;-><init>(Lcom/google/android/gms/internal/zzaka;Lcom/google/android/gms/internal/zzajq;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaku;->zzf(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method
