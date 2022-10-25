.class public Lcom/google/android/gms/internal/zzaiz;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzais$zza;
.implements Lcom/google/android/gms/internal/zzaiy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzaiz$zzb;,
        Lcom/google/android/gms/internal/zzaiz$zzd;,
        Lcom/google/android/gms/internal/zzaiz$zzf;,
        Lcom/google/android/gms/internal/zzaiz$zze;,
        Lcom/google/android/gms/internal/zzaiz$zzc;,
        Lcom/google/android/gms/internal/zzaiz$zza;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static baE:J


# instance fields
.field private final aZE:Ljava/util/concurrent/ScheduledExecutorService;

.field private final aZR:Lcom/google/android/gms/internal/zzalw;

.field private final baF:Lcom/google/android/gms/internal/zzaiw;

.field private final baQ:Lcom/google/android/gms/internal/zzait;

.field private final baX:Lcom/google/android/gms/internal/zzaiy$zza;

.field private baY:Ljava/lang/String;

.field private baZ:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private bba:Z

.field private bbb:J

.field private bbc:Lcom/google/android/gms/internal/zzais;

.field private bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

.field private bbe:J

.field private bbf:J

.field private bbg:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/google/android/gms/internal/zzaiz$zza;",
            ">;"
        }
    .end annotation
.end field

.field private bbh:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzaiz$zzd;",
            ">;"
        }
    .end annotation
.end field

.field private bbi:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/google/android/gms/internal/zzaiz$zzf;",
            ">;"
        }
    .end annotation
.end field

.field private bbj:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzaiz$zzc;",
            "Lcom/google/android/gms/internal/zzaiz$zze;",
            ">;"
        }
    .end annotation
.end field

.field private bbk:Ljava/lang/String;

.field private bbl:Z

.field private final bbm:Lcom/google/android/gms/internal/zzaiu;

.field private final bbn:Lcom/google/android/gms/internal/zzajd;

.field private bbo:Ljava/lang/String;

.field private bbp:J

.field private bbq:I

.field private bbr:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private bbs:J

.field private bbt:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-class v0, Lcom/google/android/gms/internal/zzaiz;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzaiz;->$assertionsDisabled:Z

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/google/android/gms/internal/zzaiz;->baE:J

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)V
    .locals 8

    const/4 v7, 0x0

    const-wide/16 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baZ:Ljava/util/HashSet;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bba:Z

    sget-object v0, Lcom/google/android/gms/internal/zzaiz$zzb;->bbD:Lcom/google/android/gms/internal/zzaiz$zzb;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbe:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbf:J

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbp:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbq:I

    iput-object v7, p0, Lcom/google/android/gms/internal/zzaiz;->bbr:Ljava/util/concurrent/ScheduledFuture;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbm:Lcom/google/android/gms/internal/zzaiu;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiu;->zzcsj()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZE:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiu;->zzcsi()Lcom/google/android/gms/internal/zzait;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baQ:Lcom/google/android/gms/internal/zzait;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaiz;->baF:Lcom/google/android/gms/internal/zzaiw;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbg:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/zzajd$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZE:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiu;->zzcsh()Lcom/google/android/gms/internal/zzalx;

    move-result-object v2

    const-string/jumbo v3, "ConnectionRetryHelper"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzajd$zza;-><init>(Ljava/util/concurrent/ScheduledExecutorService;Lcom/google/android/gms/internal/zzalx;Ljava/lang/String;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzajd$zza;->zzcg(J)Lcom/google/android/gms/internal/zzajd$zza;

    move-result-object v0

    const-wide v2, 0x3ff4cccccccccccdL    # 1.3

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzajd$zza;->zzj(D)Lcom/google/android/gms/internal/zzajd$zza;

    move-result-object v0

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzajd$zza;->zzch(J)Lcom/google/android/gms/internal/zzajd$zza;

    move-result-object v0

    const-wide v2, 0x3fe6666666666666L    # 0.7

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzajd$zza;->zzk(D)Lcom/google/android/gms/internal/zzajd$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajd$zza;->zzcty()Lcom/google/android/gms/internal/zzajd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbn:Lcom/google/android/gms/internal/zzajd;

    sget-wide v0, Lcom/google/android/gms/internal/zzaiz;->baE:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    sput-wide v2, Lcom/google/android/gms/internal/zzaiz;->baE:J

    new-instance v2, Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiu;->zzcsh()Lcom/google/android/gms/internal/zzalx;

    move-result-object v3

    const-string/jumbo v4, "PersistentConnection"

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x17

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "pc_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v4, v0}, Lcom/google/android/gms/internal/zzalw;-><init>(Lcom/google/android/gms/internal/zzalx;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    iput-object v7, p0, Lcom/google/android/gms/internal/zzaiz;->bbo:Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void
.end method

.method private isIdle()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbg:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbt:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;I)I
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbq:I

    return p1
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;Lcom/google/android/gms/internal/zzaiz$zzb;)Lcom/google/android/gms/internal/zzaiz$zzb;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    return-object p1
.end method

.method private zza(Lcom/google/android/gms/internal/zzaiz$zzc;)Lcom/google/android/gms/internal/zzaiz$zze;
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0xf

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "removing query "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x40

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Trying to remove listener for QuerySpec "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " but no listener exists."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zze;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;Lcom/google/android/gms/internal/zzaiz$zzc;)Lcom/google/android/gms/internal/zzaiz$zze;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz$zzc;)Lcom/google/android/gms/internal/zzaiz$zze;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzalw;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    return-object p1
.end method

.method private zza(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "p"

    invoke-static {p1}, Lcom/google/android/gms/internal/zzaiv;->zzas(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "d"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p3, :cond_0

    const-string/jumbo v1, "h"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbr:Ljava/util/concurrent/ScheduledFuture;

    return-object p1
.end method

.method private zza(Lcom/google/android/gms/internal/zzaiz$zze;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "p"

    invoke-static {p1}, Lcom/google/android/gms/internal/zzaiz$zze;->zzc(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiz$zzc;->zzb(Lcom/google/android/gms/internal/zzaiz$zzc;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiv;->zzas(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiz$zze;->zzcth()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string/jumbo v2, "q"

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiz$zze;->zzctg()Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/zzaiz$zzc;->zzc(Lcom/google/android/gms/internal/zzaiz$zzc;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v2, "t"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string/jumbo v1, "n"

    const/4 v2, 0x0

    invoke-direct {p0, v1, v0, v2}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;Ljava/util/List;Lcom/google/android/gms/internal/zzaiz$zzc;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzaiz$zzc;)V

    return-void
.end method

.method private zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "p"

    invoke-static {p2}, Lcom/google/android/gms/internal/zzaiv;->zzas(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "d"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/android/gms/internal/zzaiz$2;

    invoke-direct {v1, p0, p4}, Lcom/google/android/gms/internal/zzaiz$2;-><init>(Lcom/google/android/gms/internal/zzaiz;Lcom/google/android/gms/internal/zzajb;)V

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    return-void
.end method

.method private zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;Lcom/google/android/gms/internal/zzajb;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p2, p3, p4}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbe:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbe:J

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/internal/zzaiz$zzf;

    const/4 v6, 0x0

    invoke-direct {v5, p1, v0, p5, v6}, Lcom/google/android/gms/internal/zzaiz$zzf;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$1;)V

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsr()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/internal/zzaiz;->zzcd(J)V

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbs:J

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void
.end method

.method private zza(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzaiz$zza;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;ZLjava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    return-void
.end method

.method private zza(Ljava/lang/String;ZLjava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzaiz$zza;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctb()J

    move-result-wide v0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v3, "r"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v3, "a"

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v3, "b"

    invoke-interface {v2, v3, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    invoke-virtual {v3, v2, p2}, Lcom/google/android/gms/internal/zzais;->zza(Ljava/util/Map;Z)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbg:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v2, v0, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private zza(Ljava/util/List;Lcom/google/android/gms/internal/zzaiz$zzc;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/internal/zzaiz$zzc;",
            ")V"
        }
    .end annotation

    const-string/jumbo v0, "no_index"

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/google/android/gms/internal/zzaiz$zzc;->zzc(Lcom/google/android/gms/internal/zzaiz$zzc;)Ljava/util/Map;

    move-result-object v0

    const-string/jumbo v1, "i"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0xe

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "\".indexOn\": \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p2}, Lcom/google/android/gms/internal/zzaiz$zzc;->zzb(Lcom/google/android/gms/internal/zzaiz$zzc;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiv;->zzas(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x76

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "Using an unspecified index. Consider adding \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, "\' at "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " to your security and Firebase Database rules for better performance"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzalw;->warn(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzaiz;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbl:Z

    return p1
.end method

.method private zzat(Ljava/util/List;)Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/android/gms/internal/zzaiz$zze;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1d

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "removing all listens at path "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzaiz$zzc;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzaiz$zzc;->zzb(Lcom/google/android/gms/internal/zzaiz$zzc;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zze;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zze;->zzctg()Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-object v2
.end method

.method private zzau(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzaiz;->zzat(Ljava/util/List;)Ljava/util/Collection;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zze;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz$zze;->zzd(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzajb;

    move-result-object v0

    const-string/jumbo v2, "permission_denied"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzaiz$zzb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    return-object v0
.end method

.method private zzb(Lcom/google/android/gms/internal/zzaiz$zze;)V
    .locals 5

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v0, "p"

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiz$zze;->zzctg()Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiz$zzc;->zzb(Lcom/google/android/gms/internal/zzaiz$zzc;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiv;->zzas(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiz$zze;->zzcth()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v2, "q"

    invoke-static {p1}, Lcom/google/android/gms/internal/zzaiz$zze;->zzc(Lcom/google/android/gms/internal/zzaiz$zze;)Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/zzaiz$zzc;->zzc(Lcom/google/android/gms/internal/zzaiz$zzc;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v2, "t"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaiz$zze;->zzcti()Lcom/google/android/gms/internal/zzaix;

    move-result-object v0

    const-string/jumbo v2, "h"

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaix;->zzcsm()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaix;->zzcsn()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaix;->zzcso()Lcom/google/android/gms/internal/zzair;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzair;->zzcsf()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiv;->zzas(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v4, "hs"

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzair;->zzcsg()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v2, "ps"

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v2, "ch"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    const-string/jumbo v0, "q"

    new-instance v2, Lcom/google/android/gms/internal/zzaiz$5;

    invoke-direct {v2, p0, p1}, Lcom/google/android/gms/internal/zzaiz$5;-><init>(Lcom/google/android/gms/internal/zzaiz;Lcom/google/android/gms/internal/zzaiz$zze;)V

    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    return-void
.end method

.method private zzbm(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x17

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v2, "Auth token revoked: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalw;->warn(Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbl:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaiy$zza;->zzcy(Z)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzais;->close()V

    return-void
.end method

.method private zzbx(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v0, "msg"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzalw;->info(Ljava/lang/String;)V

    return-void
.end method

.method private zzby(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v1, "c"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "s"

    new-instance v2, Lcom/google/android/gms/internal/zzaiz$6;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzaiz$6;-><init>(Lcom/google/android/gms/internal/zzaiz;)V

    invoke-direct {p0, v1, v0, v2}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Not sending stats because stats are empty"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzaiz;)J
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbp:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbp:J

    return-wide v0
.end method

.method private zzcc(J)V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "handling timestamp"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long v0, p1, v0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v3, "serverTimeOffset"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzaiy$zza;->zzbw(Ljava/util/Map;)V

    return-void
.end method

.method private zzcd(J)V
    .locals 9

    sget-boolean v0, Lcom/google/android/gms/internal/zzaiz;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsr()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "sendPut called when we can\'t send writes (we\'re disconnected or writes are paused)."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/android/gms/internal/zzaiz$zzf;

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzaiz$zzf;->zzctf()Lcom/google/android/gms/internal/zzajb;

    move-result-object v7

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzaiz$zzf;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzaiz$zzf;->zzctk()V

    invoke-virtual {v6}, Lcom/google/android/gms/internal/zzaiz$zzf;->zzctj()Ljava/util/Map;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzaiz$4;

    move-object v2, p0

    move-wide v4, p1

    invoke-direct/range {v1 .. v7}, Lcom/google/android/gms/internal/zzaiz$4;-><init>(Lcom/google/android/gms/internal/zzaiz;Ljava/lang/String;JLcom/google/android/gms/internal/zzaiz$zzf;Lcom/google/android/gms/internal/zzajb;)V

    invoke-direct {p0, v3, v0, v1}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    return-void
.end method

.method private zzcsq()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v1, Lcom/google/android/gms/internal/zzaiz$zzb;->bbG:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v1, Lcom/google/android/gms/internal/zzaiz$zzb;->bbH:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzcsr()Z
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v1, Lcom/google/android/gms/internal/zzaiz$zzb;->bbH:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzcst()V
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcss()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v3, Lcom/google/android/gms/internal/zzaiz$zzb;->bbD:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-ne v0, v3, :cond_1

    move v0, v1

    :goto_0
    const-string/jumbo v3, "Not in disconnected state: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbl:Z

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v3, "Scheduling connection attempt"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v3, v4}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbl:Z

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbn:Lcom/google/android/gms/internal/zzajd;

    new-instance v2, Lcom/google/android/gms/internal/zzaiz$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzaiz$1;-><init>(Lcom/google/android/gms/internal/zzaiz;Z)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzajd;->zzr(Ljava/lang/Runnable;)V

    :cond_0
    return-void

    :cond_1
    move v0, v2

    goto :goto_0
.end method

.method private zzcsu()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zzf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzf;->zzctj()Ljava/util/Map;

    move-result-object v2

    const-string/jumbo v3, "h"

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzf;->zzctl()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzf;->zzctf()Lcom/google/android/gms/internal/zzajb;

    move-result-object v0

    const-string/jumbo v2, "disconnected"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private zzcsv()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->zzcz(Z)V

    return-void
.end method

.method private zzcsw()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->zzcz(Z)V

    return-void
.end method

.method private zzcsx()V
    .locals 4

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsq()Z

    move-result v0

    const-string/jumbo v2, "Must be connected to send unauth."

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    const-string/jumbo v2, "Auth token must not be set."

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v2, v1}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "unauth"

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private zzcsy()V
    .locals 5

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v3, "calling restore state"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v3, Lcom/google/android/gms/internal/zzaiz$zzb;->bbF:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-ne v0, v3, :cond_2

    move v0, v1

    :goto_0
    const-string/jumbo v3, "Wanted to restore auth, but was in wrong state: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Not restoring auth because token is null."

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/zzaiz$zzb;->bbH:Lcom/google/android/gms/internal/zzaiz$zzb;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsz()V

    :goto_1
    return-void

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Restoring auth."

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_4
    sget-object v0, Lcom/google/android/gms/internal/zzaiz$zzb;->bbG:Lcom/google/android/gms/internal/zzaiz$zzb;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsw()V

    goto :goto_1
.end method

.method private zzcsz()V
    .locals 7

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v3, Lcom/google/android/gms/internal/zzaiz$zzb;->bbH:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-ne v0, v3, :cond_2

    move v0, v1

    :goto_0
    const-string/jumbo v3, "Should be connected if we\'re restoring state, but we are: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Restoring outstanding listens"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zze;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zze;->zzctg()Lcom/google/android/gms/internal/zzaiz$zzc;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x11

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "Restoring listen "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/Object;

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->zzb(Lcom/google/android/gms/internal/zzaiz$zze;)V

    goto :goto_1

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Restoring writes."

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/gms/internal/zzaiz;->zzcd(J)V

    goto :goto_2

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzd;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzd;->zzcte()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzd;->getData()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiz$zzd;->zzctf()Lcom/google/android/gms/internal/zzajb;

    move-result-object v0

    invoke-direct {p0, v2, v3, v4, v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    goto :goto_3

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method private zzcta()V
    .locals 6

    const/16 v5, 0x2e

    const/16 v3, 0x2d

    const/4 v4, 0x1

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcom/google/android/gms/internal/zzanc;->x()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbm:Lcom/google/android/gms/internal/zzaiu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiu;->zzcsk()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "persistence.android.enabled"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string/jumbo v2, "sdk.android."

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbm:Lcom/google/android/gms/internal/zzaiu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiu;->zzcsl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Sending first connection stats"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzaiz;->zzby(Ljava/util/Map;)V

    return-void

    :cond_2
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    sget-boolean v0, Lcom/google/android/gms/internal/zzaiz;->$assertionsDisabled:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbm:Lcom/google/android/gms/internal/zzaiu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiu;->zzcsk()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Stats for persistence on JVM missing (persistence not yet supported)"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_4
    const-string/jumbo v2, "sdk.java."

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbm:Lcom/google/android/gms/internal/zzaiu;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaiu;->zzcsl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v5, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_5

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_5
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_2
.end method

.method private zzctb()J
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbf:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbf:J

    return-wide v0
.end method

.method private zzctc()V
    .locals 5

    const/4 v0, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbr:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbr:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZE:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v1, Lcom/google/android/gms/internal/zzaiz$7;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzaiz$7;-><init>(Lcom/google/android/gms/internal/zzaiz;)V

    const-wide/32 v2, 0xea60

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbr:Ljava/util/concurrent/ScheduledFuture;

    :cond_1
    :goto_0
    return-void

    :cond_2
    const-string/jumbo v1, "connection_idle"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzaiz;->isInterrupted(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->isIdle()Z

    move-result v1

    if-nez v1, :cond_3

    const/4 v0, 0x1

    :cond_3
    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiv;->zzcx(Z)V

    const-string/jumbo v0, "connection_idle"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->resume(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private zzctd()Z
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->isIdle()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbs:J

    const-wide/32 v4, 0xea60

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zzcz(Z)V
    .locals 6

    const/4 v2, 0x0

    const/4 v1, 0x1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsq()Z

    move-result v0

    const-string/jumbo v3, "Must be connected to send auth, but was: %s"

    new-array v4, v1, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    aput-object v5, v4, v2

    invoke-static {v0, v3, v4}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    const-string/jumbo v3, "Auth token must be set to authenticate!"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v3, v2}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/google/android/gms/internal/zzaiz$3;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzaiz$3;-><init>(Lcom/google/android/gms/internal/zzaiz;Z)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzand;->zzta(Ljava/lang/String;)Lcom/google/android/gms/internal/zzand;

    move-result-object v3

    if-eqz v3, :cond_2

    const-string/jumbo v4, "cred"

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzand;->getToken()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzand;->y()Ljava/util/Map;

    move-result-object v4

    if-eqz v4, :cond_0

    const-string/jumbo v4, "authvar"

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzand;->y()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string/jumbo v3, "gauth"

    invoke-direct {p0, v3, v1, v2, v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;ZLjava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    :goto_1
    return-void

    :cond_1
    move v0, v2

    goto :goto_0

    :cond_2
    const-string/jumbo v3, "cred"

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v3, "auth"

    invoke-direct {p0, v3, v1, v2, v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;ZLjava/util/Map;Lcom/google/android/gms/internal/zzaiz$zza;)V

    goto :goto_1
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzaiz;)J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbp:J

    return-wide v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzaiz;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcst()V

    return-void
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzait;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baQ:Lcom/google/android/gms/internal/zzait;

    return-object v0
.end method

.method static synthetic zzg(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzaiy$zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    return-object v0
.end method

.method static synthetic zzh(Lcom/google/android/gms/internal/zzaiz;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsz()V

    return-void
.end method

.method static synthetic zzi(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzais;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    return-object v0
.end method

.method static synthetic zzj(Lcom/google/android/gms/internal/zzaiz;)I
    .locals 2

    iget v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbq:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbq:I

    return v0
.end method

.method static synthetic zzk(Lcom/google/android/gms/internal/zzaiz;)I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbq:I

    return v0
.end method

.method static synthetic zzl(Lcom/google/android/gms/internal/zzaiz;)Lcom/google/android/gms/internal/zzajd;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbn:Lcom/google/android/gms/internal/zzajd;

    return-object v0
.end method

.method private zzl(Ljava/lang/String;Ljava/util/Map;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v10, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x16

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v3, v5

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "handleServerMessage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v10, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const-string/jumbo v0, "d"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "m"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_1
    const-string/jumbo v0, "m"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string/jumbo v0, "p"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v1, "d"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v1, "t"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/zzaiv;->zzbq(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v4

    if-eqz v3, :cond_4

    instance-of v1, v2, Ljava/util/Map;

    if-eqz v1, :cond_4

    move-object v1, v2

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "ignoring empty merge for path "

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-array v2, v10, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_2
    :goto_1
    return-void

    :cond_3
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiv;->zzsj(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    invoke-interface {v1, v0, v2, v3, v4}, Lcom/google/android/gms/internal/zzaiy$zza;->zza(Ljava/util/List;Ljava/lang/Object;ZLjava/lang/Long;)V

    goto :goto_1

    :cond_5
    const-string/jumbo v0, "rm"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string/jumbo v0, "p"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiv;->zzsj(Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    const-string/jumbo v1, "d"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "t"

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiv;->zzbq(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v7

    check-cast v1, Ljava/util/List;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const-string/jumbo v2, "s"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string/jumbo v3, "e"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v2, :cond_6

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaiv;->zzsj(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    move-object v5, v2

    :goto_3
    if-eqz v3, :cond_7

    invoke-static {v3}, Lcom/google/android/gms/internal/zzaiv;->zzsj(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    :goto_4
    const-string/jumbo v3, "m"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    new-instance v3, Lcom/google/android/gms/internal/zzaja;

    invoke-direct {v3, v5, v2, v1}, Lcom/google/android/gms/internal/zzaja;-><init>(Ljava/util/List;Ljava/util/List;Ljava/lang/Object;)V

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    move-object v5, v4

    goto :goto_3

    :cond_7
    move-object v2, v4

    goto :goto_4

    :cond_8
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Ignoring empty range merge for path "

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_9

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_5
    new-array v2, v10, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1

    :cond_9
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    invoke-interface {v0, v6, v8, v7}, Lcom/google/android/gms/internal/zzaiy$zza;->zza(Ljava/util/List;Ljava/util/List;Ljava/lang/Long;)V

    goto/16 :goto_1

    :cond_b
    const-string/jumbo v0, "c"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string/jumbo v0, "p"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiv;->zzsj(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->zzau(Ljava/util/List;)V

    goto/16 :goto_1

    :cond_c
    const-string/jumbo v0, "ac"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string/jumbo v0, "s"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v1, "d"

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzaiz;->zzbm(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_d
    const-string/jumbo v0, "sd"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-direct {p0, p2}, Lcom/google/android/gms/internal/zzaiz;->zzbx(Ljava/util/Map;)V

    goto/16 :goto_1

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Unrecognized action from server: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_f

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_6
    new-array v2, v10, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1

    :cond_f
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_6
.end method

.method static synthetic zzm(Lcom/google/android/gms/internal/zzaiz;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic zzn(Lcom/google/android/gms/internal/zzaiz;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void
.end method

.method static synthetic zzo(Lcom/google/android/gms/internal/zzaiz;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic zzp(Lcom/google/android/gms/internal/zzaiz;)Z
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctd()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public initialize()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcst()V

    return-void
.end method

.method public interrupt(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Connection interrupted for: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baZ:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzais;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbn:Lcom/google/android/gms/internal/zzajd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajd;->zzcpm()V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbn:Lcom/google/android/gms/internal/zzajd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajd;->cancel()V

    sget-object v0, Lcom/google/android/gms/internal/zzaiz$zzb;->bbD:Lcom/google/android/gms/internal/zzaiz$zzb;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    goto :goto_1
.end method

.method public isInterrupted(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baZ:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public purgeOutstandingWrites()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zzf;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz$zzf;->zza(Lcom/google/android/gms/internal/zzaiz$zzf;)Lcom/google/android/gms/internal/zzajb;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz$zzf;->zza(Lcom/google/android/gms/internal/zzaiz$zzf;)Lcom/google/android/gms/internal/zzajb;

    move-result-object v0

    const-string/jumbo v2, "write_canceled"

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zzd;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz$zzd;->zza(Lcom/google/android/gms/internal/zzaiz$zzd;)Lcom/google/android/gms/internal/zzajb;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiz$zzd;->zza(Lcom/google/android/gms/internal/zzaiz$zzd;)Lcom/google/android/gms/internal/zzajb;

    move-result-object v0

    const-string/jumbo v2, "write_canceled"

    invoke-interface {v0, v2, v3}, Lcom/google/android/gms/internal/zzajb;->zzbn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbi:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsq()Z

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbt:Z

    :cond_4
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void
.end method

.method public refreshAuthToken()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Auth token refresh requested"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "token_refresh"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->interrupt(Ljava/lang/String;)V

    const-string/jumbo v0, "token_refresh"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->resume(Ljava/lang/String;)V

    return-void
.end method

.method public resume(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Connection no longer interrupted for: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baZ:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcss()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v1, Lcom/google/android/gms/internal/zzaiz$zzb;->bbD:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-ne v0, v1, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcst()V

    :cond_1
    return-void

    :cond_2
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public shutdown()V
    .locals 1

    const-string/jumbo v0, "shutdown"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->interrupt(Ljava/lang/String;)V

    return-void
.end method

.method public zza(Ljava/util/List;Lcom/google/android/gms/internal/zzajb;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsr()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "oc"

    invoke-direct {p0, v0, p1, v3, p2}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void

    :cond_0
    iget-object v6, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/zzaiz$zzd;

    const-string/jumbo v1, "oc"

    move-object v2, p1

    move-object v4, p2

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiz$zzd;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$1;)V

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public zza(Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    const-string/jumbo v1, "p"

    const/4 v4, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method public zza(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;Lcom/google/android/gms/internal/zzajb;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    const-string/jumbo v1, "p"

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method public zza(Ljava/util/List;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzaiz$zzc;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/internal/zzaiz$zzc;-><init>(Ljava/util/List;Ljava/util/Map;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0xf

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "unlistening on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz$zzc;)Lcom/google/android/gms/internal/zzaiz$zze;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsq()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->zza(Lcom/google/android/gms/internal/zzaiz$zze;)V

    :cond_1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void
.end method

.method public zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaix;Ljava/lang/Long;Lcom/google/android/gms/internal/zzajb;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzaix;",
            "Ljava/lang/Long;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    const/4 v1, 0x0

    new-instance v2, Lcom/google/android/gms/internal/zzaiz$zzc;

    invoke-direct {v2, p1, p2}, Lcom/google/android/gms/internal/zzaiz$zzc;-><init>(Ljava/util/List;Ljava/util/Map;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0xd

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v5, "Listening on "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    :goto_0
    const-string/jumbo v3, "listen() called twice for same QuerySpec."

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {v0, v3, v4}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x15

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v5, "Adding listen query: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v1}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzaiz$zze;

    const/4 v5, 0x0

    move-object v1, p5

    move-object v3, p4

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiz$zze;-><init>(Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$zzc;Ljava/lang/Long;Lcom/google/android/gms/internal/zzaix;Lcom/google/android/gms/internal/zzaiz$1;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbj:Ljava/util/Map;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsq()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->zzb(Lcom/google/android/gms/internal/zzaiz$zze;)V

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    const-string/jumbo v1, "m"

    const/4 v4, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method public zzb(Lcom/google/android/gms/internal/zzais$zzb;)V
    .locals 8

    const-wide/16 v6, 0x0

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v3, "Got on disconnect due to "

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzais$zzb;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzaiz$zzb;->bbD:Lcom/google/android/gms/internal/zzaiz$zzb;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbt:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbg:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsu()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcss()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbb:J

    sub-long/2addr v2, v4

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbb:J

    cmp-long v0, v4, v6

    if-lez v0, :cond_6

    const-wide/16 v4, 0x7530

    cmp-long v0, v2, v4

    if-lez v0, :cond_5

    const/4 v0, 0x1

    :goto_1
    sget-object v1, Lcom/google/android/gms/internal/zzais$zzb;->baJ:Lcom/google/android/gms/internal/zzais$zzb;

    if-eq p1, v1, :cond_1

    if-eqz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbn:Lcom/google/android/gms/internal/zzajd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajd;->zzcpm()V

    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcst()V

    :cond_3
    iput-wide v6, p0, Lcom/google/android/gms/internal/zzaiz;->bbb:J

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaiy$zza;->onDisconnect()V

    return-void

    :cond_4
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    move v0, v1

    goto :goto_1

    :cond_6
    move v0, v1

    goto :goto_1
.end method

.method public zzb(Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbt:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsr()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "o"

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void

    :cond_0
    iget-object v6, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/zzaiz$zzd;

    const-string/jumbo v1, "o"

    const/4 v5, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiz$zzd;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$1;)V

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public zzb(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/android/gms/internal/zzajb;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbt:Z

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsr()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "om"

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaiz;->zza(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    :goto_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzctc()V

    return-void

    :cond_0
    iget-object v6, p0, Lcom/google/android/gms/internal/zzaiz;->bbh:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/zzaiz$zzd;

    const-string/jumbo v1, "om"

    const/4 v5, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiz$zzd;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;Lcom/google/android/gms/internal/zzaiz$1;)V

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public zzbt(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "r"

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "r"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz;->bbg:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaiz$zza;

    if-eqz v0, :cond_0

    const-string/jumbo v1, "b"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaiz$zza;->zzbz(Ljava/util/Map;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "error"

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "a"

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "a"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string/jumbo v1, "b"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzaiz;->zzl(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1a

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Ignoring unknown message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method zzcss()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baZ:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzj(JLjava/lang/String;)V
    .locals 5

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "onReady"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbb:J

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzaiz;->zzcc(J)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaiz;->bba:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcta()V

    :cond_1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsy()V

    iput-boolean v3, p0, Lcom/google/android/gms/internal/zzaiz;->bba:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaiz;->bbo:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaiy$zza;->zzcsp()V

    return-void
.end method

.method public zzsg(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz;->baY:Ljava/lang/String;

    return-void
.end method

.method public zzsh(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Firebase Database connection was forcefully killed by the server. Will not attempt reconnect. Reason: "

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const-string/jumbo v0, "server_kill"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaiz;->interrupt(Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public zzsk(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->aZR:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Auth token refreshed."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsq()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsv()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaiz;->zzcsx()V

    goto :goto_0
.end method

.method public zzsl(Ljava/lang/String;)V
    .locals 6

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    sget-object v3, Lcom/google/android/gms/internal/zzaiz$zzb;->bbE:Lcom/google/android/gms/internal/zzaiz$zzb;

    if-ne v0, v3, :cond_1

    move v0, v1

    :goto_0
    const-string/jumbo v3, "Trying to open network connection while in the wrong state: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/android/gms/internal/zzaiv;->zzc(ZLjava/lang/String;[Ljava/lang/Object;)V

    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->baX:Lcom/google/android/gms/internal/zzaiy$zza;

    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/zzaiy$zza;->zzcy(Z)V

    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/internal/zzaiz;->bbk:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzaiz$zzb;->bbF:Lcom/google/android/gms/internal/zzaiz$zzb;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbd:Lcom/google/android/gms/internal/zzaiz$zzb;

    new-instance v0, Lcom/google/android/gms/internal/zzais;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaiz;->bbm:Lcom/google/android/gms/internal/zzaiu;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaiz;->baF:Lcom/google/android/gms/internal/zzaiw;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaiz;->baY:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzaiz;->bbo:Ljava/lang/String;

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzais;-><init>(Lcom/google/android/gms/internal/zzaiu;Lcom/google/android/gms/internal/zzaiw;Ljava/lang/String;Lcom/google/android/gms/internal/zzais$zza;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaiz;->bbc:Lcom/google/android/gms/internal/zzais;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzais;->open()V

    return-void

    :cond_1
    move v0, v2

    goto :goto_0
.end method
