.class public Lcom/google/android/gms/internal/zzajs;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaiy$zza;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzajs$zza;,
        Lcom/google/android/gms/internal/zzajs$zzb;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final aZh:Lcom/google/android/gms/internal/zzajt;

.field private final bcu:Lcom/google/android/gms/internal/zzaiy;

.field private final bdI:Lcom/google/android/gms/internal/zzanj;

.field private bdJ:Lcom/google/android/gms/internal/zzajx;

.field private bdK:Lcom/google/android/gms/internal/zzajy;

.field private bdL:Lcom/google/android/gms/internal/zzalb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;"
        }
    .end annotation
.end field

.field private bdM:Z

.field private final bdN:Lcom/google/android/gms/internal/zzalj;

.field private final bdO:Lcom/google/android/gms/internal/zzajj;

.field private final bdP:Lcom/google/android/gms/internal/zzalw;

.field private final bdQ:Lcom/google/android/gms/internal/zzalw;

.field private final bdR:Lcom/google/android/gms/internal/zzalw;

.field public bdS:J

.field private bdT:J

.field private bdU:Lcom/google/android/gms/internal/zzaka;

.field private bdV:Lcom/google/android/gms/internal/zzaka;

.field private bdW:Lcom/google/firebase/database/FirebaseDatabase;

.field private bdX:Z

.field private bdY:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzajs;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzajt;Lcom/google/android/gms/internal/zzajj;Lcom/google/firebase/database/FirebaseDatabase;)V
    .locals 5

    const/4 v4, 0x0

    const-wide/16 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzanj;

    new-instance v1, Lcom/google/android/gms/internal/zzang;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzang;-><init>()V

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzanj;-><init>(Lcom/google/android/gms/internal/zzanf;J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    iput-boolean v4, p0, Lcom/google/android/gms/internal/zzajs;->bdM:Z

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdS:J

    const-wide/16 v0, 0x1

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzajs;->bdT:J

    iput-boolean v4, p0, Lcom/google/android/gms/internal/zzajs;->bdX:Z

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdY:J

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs;->aZh:Lcom/google/android/gms/internal/zzajt;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajs;->bdW:Lcom/google/firebase/database/FirebaseDatabase;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    const-string/jumbo v1, "RepoOperation"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    const-string/jumbo v1, "Transaction"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdQ:Lcom/google/android/gms/internal/zzalw;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    const-string/jumbo v1, "DataOperation"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajj;->zzss(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalw;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    new-instance v0, Lcom/google/android/gms/internal/zzalj;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzalj;-><init>(Lcom/google/android/gms/internal/zzajj;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdN:Lcom/google/android/gms/internal/zzalj;

    new-instance v0, Lcom/google/android/gms/internal/zzaiw;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzajt;->baV:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/internal/zzajt;->EY:Ljava/lang/String;

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzajt;->baW:Z

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzaiw;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p2, v0, p0}, Lcom/google/android/gms/internal/zzajj;->zza(Lcom/google/android/gms/internal/zzaiw;Lcom/google/android/gms/internal/zzaiy$zza;)Lcom/google/android/gms/internal/zzaiy;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    new-instance v0, Lcom/google/android/gms/internal/zzajs$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzajs$1;-><init>(Lcom/google/android/gms/internal/zzajs;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;
    .locals 1
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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzaka;->zzc(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method private zza(JLcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V
    .locals 7

    const/4 v2, 0x0

    const/4 v5, 0x1

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Lcom/google/firebase/database/DatabaseError;->getCode()I

    move-result v0

    const/16 v1, -0x19

    if-ne v0, v1, :cond_0

    :goto_0
    return-void

    :cond_0
    if-nez p4, :cond_2

    move v0, v5

    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    if-nez v0, :cond_3

    move v4, v5

    :goto_2
    iget-object v6, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    move-wide v2, p1

    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_1

    invoke-direct {p0, p3}, Lcom/google/android/gms/internal/zzajs;->zzo(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    :cond_1
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    goto :goto_0

    :cond_2
    move v0, v2

    goto :goto_1

    :cond_3
    move v4, v2

    goto :goto_2
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvo()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;JLcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V
    .locals 1

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/zzajs;->zza(JLcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzalb;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzalb;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzalb;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzalb;I)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;Ljava/lang/String;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzajs;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;Lcom/google/android/gms/internal/zzalb;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzajs;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalb;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzaku;)V
    .locals 12

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaku;->zzcre()Ljava/util/List;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;

    move-result-object v10

    const-wide/high16 v0, -0x8000000000000000L

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    move-wide v2, v0

    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/google/android/gms/internal/zzake;

    new-instance v0, Lcom/google/android/gms/internal/zzajs$19;

    invoke-direct {v0, p0, v4}, Lcom/google/android/gms/internal/zzajs$19;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzake;)V

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v6

    cmp-long v1, v2, v6

    if-ltz v1, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Write ids were not in order."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v8

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v2

    const-wide/16 v6, 0x1

    add-long/2addr v2, v6

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdT:J

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwg()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v2

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x30

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "Restoring overwrite with id "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwe()Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    const/4 v5, 0x1

    invoke-interface {v3, v5}, Lcom/google/android/gms/internal/zzaml;->getValue(Z)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwe()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0, v10}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwe()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;JZZ)Ljava/util/List;

    :goto_1
    move-wide v2, v8

    goto/16 :goto_0

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v2

    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x2c

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v6, "Restoring merge with id "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwf()Lcom/google/android/gms/internal/zzajh;

    move-result-object v3

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lcom/google/android/gms/internal/zzajh;->zzda(Z)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwf()Lcom/google/android/gms/internal/zzajh;

    move-result-object v0

    invoke-static {v0, v10}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzajh;Ljava/util/Map;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwf()Lcom/google/android/gms/internal/zzajh;

    move-result-object v2

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v4

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;Lcom/google/android/gms/internal/zzajh;JZ)Ljava/util/List;

    goto :goto_1

    :cond_4
    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzalb;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalb;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_3

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzc(Lcom/google/android/gms/internal/zzalb;)Ljava/util/List;

    move-result-object v2

    sget-boolean v0, Lcom/google/android/gms/internal/zzajs;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v0

    sget-object v4, Lcom/google/android/gms/internal/zzajs$zzb;->beK:Lcom/google/android/gms/internal/zzajs$zzb;

    if-eq v0, v4, :cond_1

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalb;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {p0, v2, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzajq;)V

    :cond_2
    :goto_1
    return-void

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalb;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/google/android/gms/internal/zzajs$7;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzajs$7;-><init>(Lcom/google/android/gms/internal/zzajs;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalb;->zzb(Lcom/google/android/gms/internal/zzalb$zzb;)V

    goto :goto_1

    :cond_4
    move-object v0, v1

    goto :goto_0
.end method

.method private zza(Lcom/google/android/gms/internal/zzalb;I)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;I)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalb;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_a

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    const/16 v1, -0x9

    if-ne p2, v1, :cond_0

    const-string/jumbo v1, "overriddenBySet"

    invoke-static {v1}, Lcom/google/firebase/database/DatabaseError;->zzsa(Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v1

    move-object v8, v1

    :goto_0
    const/4 v2, -0x1

    const/4 v1, 0x0

    move v9, v1

    move v10, v2

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v9, v1, :cond_8

    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/zzajs$zzb;->beN:Lcom/google/android/gms/internal/zzajs$zzb;

    if-ne v1, v2, :cond_2

    move v2, v10

    :goto_2
    add-int/lit8 v1, v9, 0x1

    move v9, v1

    move v10, v2

    goto :goto_1

    :cond_0
    const/16 v1, -0x19

    if-ne p2, v1, :cond_1

    const/4 v1, 0x1

    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x2d

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Unknown transaction abort reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    const/16 v1, -0x19

    invoke-static {v1}, Lcom/google/firebase/database/DatabaseError;->zzafs(I)Lcom/google/firebase/database/DatabaseError;

    move-result-object v1

    move-object v8, v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_3

    :cond_2
    invoke-static {v7}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/zzajs$zzb;->beL:Lcom/google/android/gms/internal/zzajs$zzb;

    if-ne v1, v2, :cond_4

    sget-boolean v1, Lcom/google/android/gms/internal/zzajs;->$assertionsDisabled:Z

    if-nez v1, :cond_3

    add-int/lit8 v1, v9, -0x1

    if-eq v10, v1, :cond_3

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_3
    sget-object v1, Lcom/google/android/gms/internal/zzajs$zzb;->beN:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v7, v1}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v7, v8}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/firebase/database/DatabaseError;)Lcom/google/firebase/database/DatabaseError;

    move v2, v9

    goto :goto_2

    :cond_4
    sget-boolean v1, Lcom/google/android/gms/internal/zzajs;->$assertionsDisabled:Z

    if-nez v1, :cond_5

    invoke-static {v7}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/internal/zzajs$zzb;->beK:Lcom/google/android/gms/internal/zzajs$zzb;

    if-eq v1, v2, :cond_5

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_5
    new-instance v1, Lcom/google/android/gms/internal/zzakg;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzajs$zza;->zzj(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/firebase/database/ValueEventListener;

    move-result-object v2

    invoke-static {v7}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzajs;->zze(Lcom/google/android/gms/internal/zzajl;)V

    const/16 v1, -0x9

    if-ne p2, v1, :cond_6

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v11, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_4
    new-instance v1, Lcom/google/android/gms/internal/zzajs$16;

    invoke-direct {v1, p0, v7, v8}, Lcom/google/android/gms/internal/zzajs$16;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/firebase/database/DatabaseError;)V

    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v2, v10

    goto/16 :goto_2

    :cond_6
    const/16 v1, -0x19

    if-ne p2, v1, :cond_7

    const/4 v1, 0x1

    :goto_5
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x2d

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "Unknown transaction abort reason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzann;->zzb(ZLjava/lang/String;)V

    goto :goto_4

    :cond_7
    const/4 v1, 0x0

    goto :goto_5

    :cond_8
    const/4 v1, -0x1

    if-ne v10, v1, :cond_9

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalb;->setValue(Ljava/lang/Object;)V

    :goto_6
    invoke-direct {p0, v11}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzq(Ljava/lang/Runnable;)V

    goto :goto_7

    :cond_9
    const/4 v1, 0x0

    add-int/lit8 v2, v10, 0x1

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalb;->setValue(Ljava/lang/Object;)V

    goto :goto_6

    :cond_a
    return-void
.end method

.method private zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V
    .locals 6

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lcom/google/firebase/database/DatabaseError;->getCode()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p3}, Lcom/google/firebase/database/DatabaseError;->getCode()I

    move-result v0

    const/16 v1, -0x19

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzajq;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Lcom/google/firebase/database/DatabaseError;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0xd

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalw;->warn(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private zza(Ljava/util/List;Lcom/google/android/gms/internal/zzajq;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;",
            "Lcom/google/android/gms/internal/zzajq;",
            ")V"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-direct {p0, p2, v1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    const-string/jumbo v0, "badhash"

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaml;->zzczd()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajs$zza;

    sget-boolean v4, Lcom/google/android/gms/internal/zzajs;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v4

    sget-object v5, Lcom/google/android/gms/internal/zzajs$zzb;->beK:Lcom/google/android/gms/internal/zzajs$zzb;

    if-eq v4, v5, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_1
    sget-object v4, Lcom/google/android/gms/internal/zzajs$zzb;->beL:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0, v4}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zze(Lcom/google/android/gms/internal/zzajs$zza;)I

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-static {p2, v4}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzg(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v2, v4, v0}, Lcom/google/android/gms/internal/zzaml;->zzl(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    move-object v2, v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x1

    invoke-interface {v2, v0}, Lcom/google/android/gms/internal/zzaml;->getValue(Z)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvs()J

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v3

    new-instance v4, Lcom/google/android/gms/internal/zzajs$8;

    invoke-direct {v4, p0, p2, p1, p0}, Lcom/google/android/gms/internal/zzajs$8;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Ljava/util/List;Lcom/google/android/gms/internal/zzajs;)V

    invoke-interface {v2, v3, v0, v1, v4}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Ljava/lang/Object;Ljava/lang/String;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method private zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalb;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;",
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;)V"
        }
    .end annotation

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzalb;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzajs$13;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzajs$13;-><init>(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;)V

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzalb;->zzb(Lcom/google/android/gms/internal/zzalb$zzb;)V

    return-void
.end method

.method private zzav(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdN:Lcom/google/android/gms/internal/zzalj;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzalj;->zzax(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method private zzb(Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;
    .locals 7

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzp(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzalb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalb;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdQ:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x2c

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v5, "Aborting transactions for path: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ". Affected: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdL:Lcom/google/android/gms/internal/zzalb;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzalb;->zzal(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzalb;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzajs$14;

    invoke-direct {v2, p0, p2}, Lcom/google/android/gms/internal/zzajs$14;-><init>(Lcom/google/android/gms/internal/zzajs;I)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzalb;->zza(Lcom/google/android/gms/internal/zzalb$zza;)Z

    invoke-direct {p0, v1, p2}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzalb;I)V

    new-instance v2, Lcom/google/android/gms/internal/zzajs$15;

    invoke-direct {v2, p0, p2}, Lcom/google/android/gms/internal/zzajs$15;-><init>(Lcom/google/android/gms/internal/zzajs;I)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzalb;->zza(Lcom/google/android/gms/internal/zzalb$zzb;)V

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;
    .locals 1

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzo(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzalw;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzalb;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzalb;)V

    return-void
.end method

.method private zzb(Lcom/google/android/gms/internal/zzalb;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;)V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalb;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v2, v1, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v1

    sget-object v3, Lcom/google/android/gms/internal/zzajs$zzb;->beM:Lcom/google/android/gms/internal/zzajs$zzb;

    if-ne v1, v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move v1, v2

    :goto_1
    move v2, v1

    goto :goto_0

    :cond_0
    add-int/lit8 v1, v2, 0x1

    goto :goto_1

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalb;->setValue(Ljava/lang/Object;)V

    :cond_2
    :goto_2
    new-instance v0, Lcom/google/android/gms/internal/zzajs$9;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzajs$9;-><init>(Lcom/google/android/gms/internal/zzajs;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalb;->zzb(Lcom/google/android/gms/internal/zzalb$zzb;)V

    return-void

    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalb;->setValue(Ljava/lang/Object;)V

    goto :goto_2
.end method

.method private zzb(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V
    .locals 4

    sget-object v0, Lcom/google/android/gms/internal/zzaji;->bdh:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    move-object v0, p2

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzanj;->zzcn(J)V

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzajq;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/google/android/gms/internal/zzalz;

    const/4 v2, 0x0

    sget-object v3, Lcom/google/android/gms/internal/zzaji;->bdg:Lcom/google/android/gms/internal/zzalz;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzajq;-><init>([Lcom/google/android/gms/internal/zzalz;)V

    :try_start_0
    invoke-static {p2}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs;->bdJ:Lcom/google/android/gms/internal/zzajx;

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/internal/zzajx;->zzg(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs;->bdU:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/internal/zzaka;->zzi(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V
    :try_end_0
    .catch Lcom/google/firebase/database/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "Failed to parse info update"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzalw;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private zzb(Ljava/util/List;Lcom/google/android/gms/internal/zzajq;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;",
            "Lcom/google/android/gms/internal/zzajq;",
            ")V"
        }
    .end annotation

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v14, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :cond_2
    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    const/4 v12, 0x0

    const/4 v11, 0x0

    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    sget-boolean v3, Lcom/google/android/gms/internal/zzajs;->$assertionsDisabled:Z

    if-nez v3, :cond_3

    if-nez v2, :cond_3

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    :cond_3
    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/internal/zzajs$zzb;->beO:Lcom/google/android/gms/internal/zzajs$zzb;

    if-ne v2, v3, :cond_5

    const/4 v2, 0x1

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzk(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/firebase/database/DatabaseError;->getCode()I

    move-result v3

    const/16 v4, -0x19

    if-eq v3, v4, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_4
    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    if-eqz v2, :cond_2

    sget-object v2, Lcom/google/android/gms/internal/zzajs$zzb;->beM:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v10, v2}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-static {v0, v2}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v2

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzb(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-static {v3}, Lcom/google/android/gms/internal/zzamg;->zzn(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/firebase/database/zza;->zza(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzamg;)Lcom/google/firebase/database/DataSnapshot;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/internal/zzajs$10;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v10}, Lcom/google/android/gms/internal/zzajs$10;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajs$zza;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    new-instance v3, Lcom/google/android/gms/internal/zzajs$11;

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v10, v9, v2}, Lcom/google/android/gms/internal/zzajs$11;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/firebase/database/DatabaseError;Lcom/google/firebase/database/DataSnapshot;)V

    invoke-interface {v13, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :cond_5
    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzd(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajs$zzb;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/internal/zzajs$zzb;->beK:Lcom/google/android/gms/internal/zzajs$zzb;

    if-ne v2, v3, :cond_a

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzl(Lcom/google/android/gms/internal/zzajs$zza;)I

    move-result v2

    const/16 v3, 0x19

    if-lt v2, v3, :cond_6

    const/4 v2, 0x1

    const-string/jumbo v3, "maxretries"

    invoke-static {v3}, Lcom/google/firebase/database/DatabaseError;->zzsa(Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_3

    :cond_6
    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v14}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-static {v10, v2}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-static {v2}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzaml;)Lcom/google/firebase/database/MutableData;

    move-result-object v2

    const/4 v3, 0x0

    :try_start_0
    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzi(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/firebase/database/Transaction$Handler;

    move-result-object v4

    invoke-interface {v4, v2}, Lcom/google/firebase/database/Transaction$Handler;->doTransaction(Lcom/google/firebase/database/MutableData;)Lcom/google/firebase/database/Transaction$Result;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    move-object v9, v3

    :goto_4
    invoke-virtual {v2}, Lcom/google/firebase/database/Transaction$Result;->isSuccess()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v2}, Lcom/google/firebase/database/Transaction$Result;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v5

    invoke-static {v10, v4}, Lcom/google/android/gms/internal/zzajs$zza;->zzb(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-static {v10, v5}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/internal/zzajs;->zzcvs()J

    move-result-wide v2

    invoke-static {v10, v2, v3}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;J)J

    move-object/from16 v0, v17

    invoke-interface {v14, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v6

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzm(Lcom/google/android/gms/internal/zzajs$zza;)Z

    move-result v8

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;JZZ)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-object v9, v11

    move v2, v12

    goto/16 :goto_3

    :catch_0
    move-exception v2

    invoke-static {v2}, Lcom/google/firebase/database/DatabaseError;->fromException(Ljava/lang/Throwable;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v3

    invoke-static {}, Lcom/google/firebase/database/Transaction;->abort()Lcom/google/firebase/database/Transaction$Result;

    move-result-object v2

    move-object v9, v3

    goto :goto_4

    :cond_7
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v10}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-virtual/range {v3 .. v8}, Lcom/google/android/gms/internal/zzaka;->zza(JZZLcom/google/android/gms/internal/zzanf;)Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_3

    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/gms/internal/zzajs;->bdL:Lcom/google/android/gms/internal/zzalb;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzalb;)V

    const/4 v2, 0x0

    move v3, v2

    :goto_5
    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v2

    if-ge v3, v2, :cond_9

    invoke-interface {v13, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzajs;->zzq(Ljava/lang/Runnable;)V

    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_5

    :cond_9
    invoke-direct/range {p0 .. p0}, Lcom/google/android/gms/internal/zzajs;->zzcvu()V

    goto/16 :goto_0

    :cond_a
    move-object v9, v11

    move v2, v12

    goto/16 :goto_3
.end method

.method private static zzbo(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;
    .locals 1

    if-eqz p0, :cond_0

    invoke-static {p0, p1}, Lcom/google/firebase/database/DatabaseError;->zzbl(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic zzbp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;
    .locals 1

    invoke-static {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzbo(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaiy;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    return-object v0
.end method

.method private zzc(Lcom/google/android/gms/internal/zzalb;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/zzajs;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalb;)V

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0
.end method

.method private zzcvo()V
    .locals 6

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajj;->zzcuu()Lcom/google/android/gms/internal/zzajf;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajs$12;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzajs$12;-><init>(Lcom/google/android/gms/internal/zzajs;)V

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzajf;->zza(Lcom/google/android/gms/internal/zzajf$zzb;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaiy;->initialize()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->aZh:Lcom/google/android/gms/internal/zzajt;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzajt;->baV:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajj;->zzst(Ljava/lang/String;)Lcom/google/android/gms/internal/zzaku;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzajx;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzajx;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdJ:Lcom/google/android/gms/internal/zzajx;

    new-instance v1, Lcom/google/android/gms/internal/zzajy;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzajy;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdK:Lcom/google/android/gms/internal/zzajy;

    new-instance v1, Lcom/google/android/gms/internal/zzalb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzalb;-><init>()V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdL:Lcom/google/android/gms/internal/zzalb;

    new-instance v1, Lcom/google/android/gms/internal/zzaka;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    new-instance v3, Lcom/google/android/gms/internal/zzakt;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzakt;-><init>()V

    new-instance v4, Lcom/google/android/gms/internal/zzajs$17;

    invoke-direct {v4, p0}, Lcom/google/android/gms/internal/zzajs$17;-><init>(Lcom/google/android/gms/internal/zzajs;)V

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzaka;-><init>(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzaku;Lcom/google/android/gms/internal/zzaka$zzd;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdU:Lcom/google/android/gms/internal/zzaka;

    new-instance v1, Lcom/google/android/gms/internal/zzaka;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    new-instance v3, Lcom/google/android/gms/internal/zzajs$18;

    invoke-direct {v3, p0}, Lcom/google/android/gms/internal/zzajs$18;-><init>(Lcom/google/android/gms/internal/zzajs;)V

    invoke-direct {v1, v2, v0, v3}, Lcom/google/android/gms/internal/zzaka;-><init>(Lcom/google/android/gms/internal/zzajj;Lcom/google/android/gms/internal/zzaku;Lcom/google/android/gms/internal/zzaka$zzd;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzaku;)V

    sget-object v0, Lcom/google/android/gms/internal/zzaji;->bdi:Lcom/google/android/gms/internal/zzalz;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V

    sget-object v0, Lcom/google/android/gms/internal/zzaji;->bdj:Lcom/google/android/gms/internal/zzalz;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V

    return-void
.end method

.method private zzcvs()J
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzajs;->bdT:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdT:J

    return-wide v0
.end method

.method private zzcvt()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdK:Lcom/google/android/gms/internal/zzajy;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzajy;Ljava/util/Map;)Lcom/google/android/gms/internal/zzajy;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/internal/zzajs$4;

    invoke-direct {v3, p0, v1}, Lcom/google/android/gms/internal/zzajs$4;-><init>(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;)V

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzajy;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajy$zzb;)V

    new-instance v0, Lcom/google/android/gms/internal/zzajy;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzajy;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdK:Lcom/google/android/gms/internal/zzajy;

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    return-void
.end method

.method private zzcvu()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdL:Lcom/google/android/gms/internal/zzalb;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzalb;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzalb;)V

    return-void
.end method

.method private zzcvv()J
    .locals 4

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzajs;->bdY:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdY:J

    return-wide v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzajx;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdJ:Lcom/google/android/gms/internal/zzajx;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaka;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdU:Lcom/google/android/gms/internal/zzaka;

    return-object v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzajy;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdK:Lcom/google/android/gms/internal/zzajy;

    return-object v0
.end method

.method static synthetic zzg(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaka;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    return-object v0
.end method

.method static synthetic zzh(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzanj;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    return-object v0
.end method

.method static synthetic zzi(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzalb;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdL:Lcom/google/android/gms/internal/zzalb;

    return-object v0
.end method

.method static synthetic zzj(Lcom/google/android/gms/internal/zzajs;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvu()V

    return-void
.end method

.method private zzn(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method private zzo(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;
    .locals 2

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzp(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzalb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalb;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzc(Lcom/google/android/gms/internal/zzalb;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzb(Ljava/util/List;Lcom/google/android/gms/internal/zzajq;)V

    return-object v1
.end method

.method private zzp(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzalb;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")",
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdL:Lcom/google/android/gms/internal/zzalb;

    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalb;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/google/android/gms/internal/zzalz;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lcom/google/android/gms/internal/zzajq;-><init>([Lcom/google/android/gms/internal/zzalz;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalb;->zzal(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzalb;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object p1

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public getDatabase()Lcom/google/firebase/database/FirebaseDatabase;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdW:Lcom/google/firebase/database/FirebaseDatabase;

    return-object v0
.end method

.method interrupt()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    const-string/jumbo v1, "repo_interrupt"

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaiy;->interrupt(Ljava/lang/String;)V

    return-void
.end method

.method public onDisconnect()V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzaji;->bdj:Lcom/google/android/gms/internal/zzalz;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvt()V

    return-void
.end method

.method public purgeOutstandingWrites()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "Purging writes"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaka;->zzcwa()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    const/16 v1, -0x19

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaiy;->purgeOutstandingWrites()V

    return-void
.end method

.method resume()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    const-string/jumbo v1, "repo_interrupt"

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaiy;->resume(Ljava/lang/String;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->aZh:Lcom/google/android/gms/internal/zzajt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajt;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;Lcom/google/firebase/database/DatabaseReference$CompletionListener;Ljava/util/Map;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzajh;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x8

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "update: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x9

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "update: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzajh;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "update called with no changes. No-op"

    new-array v2, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, p3, v0, p1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/firebase/database/DatabaseReference$CompletionListener;Lcom/google/firebase/database/DatabaseError;Lcom/google/android/gms/internal/zzajq;)V

    :goto_0
    return-void

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzajh;Ljava/util/Map;)Lcom/google/android/gms/internal/zzajh;

    move-result-object v3

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvs()J

    move-result-wide v4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    const/4 v6, 0x1

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;Lcom/google/android/gms/internal/zzajh;JZ)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v7

    new-instance v1, Lcom/google/android/gms/internal/zzajs$22;

    move-object v2, p0

    move-object v3, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/zzajs$22;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;JLcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    invoke-interface {v0, v7, p4, v1}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V

    const/16 v0, -0x9

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzo(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 9

    const/4 v7, 0x0

    const/4 v6, 0x1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x5

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "set: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x6

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v4, v5

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "set: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvs()J

    move-result-wide v4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    move-object v1, p1

    move-object v2, p2

    move v7, v6

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;JZZ)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v7

    invoke-interface {p2, v6}, Lcom/google/android/gms/internal/zzaml;->getValue(Z)Ljava/lang/Object;

    move-result-object v8

    new-instance v1, Lcom/google/android/gms/internal/zzajs$21;

    move-object v2, p0

    move-object v3, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/google/android/gms/internal/zzajs$21;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;JLcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    invoke-interface {v0, v7, v8, v1}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    const/16 v0, -0x9

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzo(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzajs$3;

    invoke-direct {v2, p0, p1, p2}, Lcom/google/android/gms/internal/zzajs$3;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/Transaction$Handler;Z)V
    .locals 12

    const/4 v10, 0x0

    const/4 v8, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0xd

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "transaction: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v10, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0xd

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v3, "transaction: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-array v2, v10, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajj;->zzcsk()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzajs;->bdX:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzajs;->bdX:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdQ:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v1, "runTransaction() usage detected while persistence is enabled. Please be aware that transactions *will not* be persisted across database restarts.  See https://www.firebase.com/docs/android/guide/offline-capabilities.html#section-handling-transactions-offline for more details."

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalw;->info(Ljava/lang/String;)V

    :cond_2
    invoke-static {p0, p1}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v9

    new-instance v3, Lcom/google/android/gms/internal/zzajs$5;

    invoke-direct {v3, p0}, Lcom/google/android/gms/internal/zzajs$5;-><init>(Lcom/google/android/gms/internal/zzajs;)V

    new-instance v0, Lcom/google/android/gms/internal/zzakg;

    invoke-virtual {v9}, Lcom/google/firebase/database/DatabaseReference;->zzcrd()Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    invoke-direct {v0, p0, v3, v1}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzf(Lcom/google/android/gms/internal/zzajl;)V

    new-instance v0, Lcom/google/android/gms/internal/zzajs$zza;

    sget-object v4, Lcom/google/android/gms/internal/zzajs$zzb;->beJ:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvv()J

    move-result-wide v6

    move-object v1, p1

    move-object v2, p2

    move v5, p3

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzajs$zza;-><init>(Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/Transaction$Handler;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzajs$zzb;ZJLcom/google/android/gms/internal/zzajs$1;)V

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzajs;->zzn(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-static {v1}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzaml;)Lcom/google/firebase/database/MutableData;

    move-result-object v1

    :try_start_0
    invoke-interface {p2, v1}, Lcom/google/firebase/database/Transaction$Handler;->doTransaction(Lcom/google/firebase/database/MutableData;)Lcom/google/firebase/database/Transaction$Result;

    move-result-object v1

    if-nez v1, :cond_3

    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v2, "Transaction returned null as result"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    invoke-static {v1}, Lcom/google/firebase/database/DatabaseError;->fromException(Ljava/lang/Throwable;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v2

    invoke-static {}, Lcom/google/firebase/database/Transaction;->abort()Lcom/google/firebase/database/Transaction$Result;

    move-result-object v1

    move-object v11, v1

    move-object v1, v2

    move-object v2, v11

    :goto_0
    invoke-virtual {v2}, Lcom/google/firebase/database/Transaction$Result;->isSuccess()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-static {v0, v8}, Lcom/google/android/gms/internal/zzajs$zza;->zzb(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-static {v0, v8}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzb(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamg;->zzn(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    invoke-static {v9, v0}, Lcom/google/firebase/database/zza;->zza(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzamg;)Lcom/google/firebase/database/DataSnapshot;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/zzajs$6;

    invoke-direct {v2, p0, p2, v1, v0}, Lcom/google/android/gms/internal/zzajs$6;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/Transaction$Handler;Lcom/google/firebase/database/DatabaseError;Lcom/google/firebase/database/DataSnapshot;)V

    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/zzajs;->zzq(Ljava/lang/Runnable;)V

    :goto_1
    return-void

    :cond_3
    move-object v2, v1

    move-object v1, v8

    goto :goto_0

    :cond_4
    sget-object v1, Lcom/google/android/gms/internal/zzajs$zzb;->beK:Lcom/google/android/gms/internal/zzajs$zzb;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzajs$zzb;)Lcom/google/android/gms/internal/zzajs$zzb;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdL:Lcom/google/android/gms/internal/zzalb;

    invoke-virtual {v1, p1}, Lcom/google/android/gms/internal/zzalb;->zzal(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzalb;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzalb;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_5
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3, v1}, Lcom/google/android/gms/internal/zzalb;->setValue(Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzanf;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v2}, Lcom/google/firebase/database/Transaction$Result;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/android/gms/internal/zzajw;->zza(Lcom/google/android/gms/internal/zzaml;Ljava/util/Map;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/zzajs$zza;->zzb(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-static {v0, v3}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvs()J

    move-result-wide v4

    invoke-static {v0, v4, v5}, Lcom/google/android/gms/internal/zzajs$zza;->zza(Lcom/google/android/gms/internal/zzajs$zza;J)J

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzc(Lcom/google/android/gms/internal/zzajs$zza;)J

    move-result-wide v4

    move-object v0, v1

    move-object v1, p1

    move v6, p3

    move v7, v10

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;JZZ)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajs;->zzcvu()V

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzaml;",
            ">;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzajs$2;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzajs$2;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    invoke-interface {v0, v1, p4, v2}, Lcom/google/android/gms/internal/zzaiy;->zzb(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;Z)V
    .locals 2

    sget-boolean v0, Lcom/google/android/gms/internal/zzajs;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzaji;->bdg:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzall;Z)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V

    return-void
.end method

.method zza(Lcom/google/firebase/database/DatabaseReference$CompletionListener;Lcom/google/firebase/database/DatabaseError;Lcom/google/android/gms/internal/zzajq;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p3}, Lcom/google/android/gms/internal/zzajq;->zzcvm()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->zzczb()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Lcom/google/android/gms/internal/zzajq;->zzcvl()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v0

    :goto_0
    new-instance v1, Lcom/google/android/gms/internal/zzajs$20;

    invoke-direct {v1, p0, p1, p2, v0}, Lcom/google/android/gms/internal/zzajs$20;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/DatabaseReference$CompletionListener;Lcom/google/firebase/database/DatabaseError;Lcom/google/firebase/database/DatabaseReference;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzajs;->zzq(Ljava/lang/Runnable;)V

    :cond_0
    return-void

    :cond_1
    invoke-static {p0, p3}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v0

    goto :goto_0
.end method

.method public zza(Ljava/util/List;Ljava/lang/Object;ZLjava/lang/Long;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Z",
            "Ljava/lang/Long;",
            ")V"
        }
    .end annotation

    const/4 v7, 0x0

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/util/List;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0xe

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "onDataUpdate: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0xf

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v5, "onDataUpdate: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdS:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdS:J

    if-eqz p4, :cond_5

    :try_start_0
    new-instance v2, Lcom/google/android/gms/internal/zzakb;

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v2, v4, v5}, Lcom/google/android/gms/internal/zzakb;-><init>(J)V

    if-eqz p3, :cond_4

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    check-cast p2, Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v5

    new-instance v6, Lcom/google/android/gms/internal/zzajq;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v6, v0}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/google/firebase/database/DatabaseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    const-string/jumbo v2, "FIREBASE INTERNAL ERROR"

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzalw;->zzd(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void

    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, v1, v3, v2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_3

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzajs;->zzo(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    :cond_3
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    goto :goto_1

    :cond_4
    invoke-static {p2}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v3, v1, v0, v2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;

    move-result-object v0

    goto :goto_2

    :cond_5
    if-eqz p3, :cond_7

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    check-cast p2, Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/internal/zzajq;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v5, v0}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    goto :goto_2

    :cond_7
    invoke-static {p2}, Lcom/google/android/gms/internal/zzamm;->zzbt(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/internal/zzaka;->zzi(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Ljava/util/List;
    :try_end_1
    .catch Lcom/google/firebase/database/DatabaseException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    goto :goto_2
.end method

.method public zza(Ljava/util/List;Ljava/util/List;Ljava/lang/Long;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzaja;",
            ">;",
            "Ljava/lang/Long;",
            ")V"
        }
    .end annotation

    const/4 v7, 0x0

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzajq;-><init>(Ljava/util/List;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x14

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v4, "onRangeMergeUpdate: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdR:Lcom/google/android/gms/internal/zzalw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalw;->zzcyu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdP:Lcom/google/android/gms/internal/zzalw;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x15

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string/jumbo v5, "onRangeMergeUpdate: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/internal/zzalw;->zzi(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdS:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzajs;->bdS:J

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaja;

    new-instance v4, Lcom/google/android/gms/internal/zzamq;

    invoke-direct {v4, v0}, Lcom/google/android/gms/internal/zzamq;-><init>(Lcom/google/android/gms/internal/zzaja;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    if-eqz p3, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    new-instance v3, Lcom/google/android/gms/internal/zzakb;

    invoke-virtual {p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Lcom/google/android/gms/internal/zzakb;-><init>(J)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzaka;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;Lcom/google/android/gms/internal/zzakb;)Ljava/util/List;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_3

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzajs;->zzo(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    :cond_3
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    return-void

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzaka;->zzb(Lcom/google/android/gms/internal/zzajq;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_1
.end method

.method public zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bcu:Lcom/google/android/gms/internal/zzaiy;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p2, v2}, Lcom/google/android/gms/internal/zzaml;->getValue(Z)Ljava/lang/Object;

    move-result-object v2

    new-instance v3, Lcom/google/android/gms/internal/zzajs$23;

    invoke-direct {v3, p0, p1, p2, p3}, Lcom/google/android/gms/internal/zzajs$23;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzaiy;->zzb(Ljava/util/List;Ljava/lang/Object;Lcom/google/android/gms/internal/zzajb;)V

    return-void
.end method

.method public zzbw(Ljava/util/Map;)V
    .locals 3
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

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

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

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzalz;->zzsx(Ljava/lang/String;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public zzcsp()V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzaji;->bdj:Lcom/google/android/gms/internal/zzalz;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V

    return-void
.end method

.method public zzcvp()Lcom/google/android/gms/internal/zzajt;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->aZh:Lcom/google/android/gms/internal/zzajt;

    return-object v0
.end method

.method public zzcvq()J
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdI:Lcom/google/android/gms/internal/zzanj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzanj;->z()J

    move-result-wide v0

    return-wide v0
.end method

.method zzcvr()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdU:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaka;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaka;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcy(Z)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzaji;->bdi:Lcom/google/android/gms/internal/zzalz;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzalz;Ljava/lang/Object;)V

    return-void
.end method

.method public zze(Lcom/google/android/gms/internal/zzajl;)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzaji;->bdg:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdU:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaka;->zzh(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    move-result-object v0

    :goto_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaka;->zzh(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public zzf(Lcom/google/android/gms/internal/zzajl;)V
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajl;->zzcud()Lcom/google/android/gms/internal/zzall;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/google/android/gms/internal/zzaji;->bdg:Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdU:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaka;->zzg(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    move-result-object v0

    :goto_0
    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzajs;->zzav(Ljava/util/List;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdV:Lcom/google/android/gms/internal/zzaka;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaka;->zzg(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public zzq(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajj;->zzcuk()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajj;->zzcur()Lcom/google/android/gms/internal/zzajn;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzajn;->zzq(Ljava/lang/Runnable;)V

    return-void
.end method

.method public zzs(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajj;->zzcuk()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs;->bdO:Lcom/google/android/gms/internal/zzajj;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajj;->zzcus()Lcom/google/android/gms/internal/zzajv;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzajv;->zzs(Ljava/lang/Runnable;)V

    return-void
.end method
