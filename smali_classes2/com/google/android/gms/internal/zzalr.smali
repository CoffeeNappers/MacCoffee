.class public Lcom/google/android/gms/internal/zzalr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzals;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final bhC:Lcom/google/android/gms/internal/zzamf;

.field private final big:Lcom/google/android/gms/internal/zzalt;

.field private final bih:Z

.field private final limit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzalr;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzalr;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzalk;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzalt;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzalt;-><init>(Lcom/google/android/gms/internal/zzalk;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->getLimit()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzalr;->limit:I

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalk;->zzcyc()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzalr;->bih:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzals$zza;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;
    .locals 8

    const/4 v2, 0x0

    const/4 v1, 0x1

    sget-boolean v0, Lcom/google/android/gms/internal/zzalr;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getChildCount()I

    move-result v0

    iget v3, p0, Lcom/google/android/gms/internal/zzalr;->limit:I

    if-eq v0, v3, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    new-instance v4, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v4, p2, p3}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzalr;->bih:Z

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzczv()Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/zzalt;->zza(Lcom/google/android/gms/internal/zzamk;)Z

    move-result v5

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-interface {v3, p2}, Lcom/google/android/gms/internal/zzaml;->zzk(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v3

    invoke-interface {v3, p2}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v6

    iget-object v3, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    iget-boolean v7, p0, Lcom/google/android/gms/internal/zzalr;->bih:Z

    invoke-interface {p4, v3, v0, v7}, Lcom/google/android/gms/internal/zzals$zza;->zza(Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzamk;Z)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    move-object v3, v0

    :goto_1
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v7

    invoke-interface {v0, v7}, Lcom/google/android/gms/internal/zzaml;->zzk(Lcom/google/android/gms/internal/zzalz;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    iget-boolean v7, p0, Lcom/google/android/gms/internal/zzalr;->bih:Z

    invoke-interface {p4, v0, v3, v7}, Lcom/google/android/gms/internal/zzals$zza;->zza(Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzamk;Z)Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    move-object v3, v0

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzczw()Lcom/google/android/gms/internal/zzamk;

    move-result-object v0

    goto :goto_0

    :cond_3
    if-nez v3, :cond_6

    move v0, v1

    :goto_2
    if-eqz v5, :cond_7

    invoke-interface {p3}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7

    if-ltz v0, :cond_7

    move v0, v1

    :goto_3
    if-eqz v0, :cond_8

    if-eqz p5, :cond_4

    invoke-static {p2, p3, v6}, Lcom/google/android/gms/internal/zzalf;->zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-virtual {p5, v0}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    :cond_4
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    :cond_5
    :goto_4
    return-object p1

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    iget-boolean v7, p0, Lcom/google/android/gms/internal/zzalr;->bih:Z

    invoke-virtual {v0, v3, v4, v7}, Lcom/google/android/gms/internal/zzamf;->zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;Z)I

    move-result v0

    goto :goto_2

    :cond_7
    move v0, v2

    goto :goto_3

    :cond_8
    if-eqz p5, :cond_9

    invoke-static {p2, v6}, Lcom/google/android/gms/internal/zzalf;->zzd(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-virtual {p5, v0}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    :cond_9
    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    if-eqz v3, :cond_b

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/zzalt;->zza(Lcom/google/android/gms/internal/zzamk;)Z

    move-result v0

    if-eqz v0, :cond_b

    move v0, v1

    :goto_5
    if-eqz v0, :cond_5

    if-eqz p5, :cond_a

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzalf;->zzc(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-virtual {p5, v0}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    :cond_a
    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    goto :goto_4

    :cond_b
    move v0, v2

    goto :goto_5

    :cond_c
    invoke-interface {p3}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    if-eqz v5, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzalr;->bih:Z

    invoke-virtual {v1, v0, v4, v2}, Lcom/google/android/gms/internal/zzamf;->zza(Lcom/google/android/gms/internal/zzamk;Lcom/google/android/gms/internal/zzamk;Z)I

    move-result v1

    if-ltz v1, :cond_5

    if-eqz p5, :cond_d

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzalf;->zzd(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v1

    invoke-virtual {p5, v1}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    invoke-static {p2, p3}, Lcom/google/android/gms/internal/zzalf;->zzc(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v1

    invoke-virtual {p5, v1}, Lcom/google/android/gms/internal/zzalp;->zza(Lcom/google/android/gms/internal/zzalf;)V

    :cond_d
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    goto/16 :goto_4
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzals$zza;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    new-instance v1, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v1, p2, p3}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalt;->zza(Lcom/google/android/gms/internal/zzamk;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v3

    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_1
    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->getChildCount()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/zzalr;->limit:I

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalt;->zzcyq()Lcom/google/android/gms/internal/zzals;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/zzals;->zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzals$zza;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    goto :goto_1

    :cond_1
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p5

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzalr;->zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzals$zza;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;

    move-result-object p1

    goto :goto_1

    :cond_2
    move-object v3, p3

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;
    .locals 11

    const/4 v2, 0x1

    const/4 v7, 0x0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v9

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalt;->zzcyq()Lcom/google/android/gms/internal/zzals;

    move-result-object v0

    invoke-interface {v0, p1, v9, p3}, Lcom/google/android/gms/internal/zzals;->zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    return-object v0

    :cond_2
    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/zzamg;->zzo(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v6

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzalr;->bih:Z

    if-eqz v0, :cond_4

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->zzcrl()Ljava/util/Iterator;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalt;->zzcyt()Lcom/google/android/gms/internal/zzamk;

    move-result-object v4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalt;->zzcys()Lcom/google/android/gms/internal/zzamk;

    move-result-object v3

    const/4 v0, -0x1

    move-object v5, v4

    move-object v4, v3

    move-object v3, v1

    move v1, v0

    :goto_0
    move v8, v7

    move-object v9, v6

    move v6, v7

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    if-nez v6, :cond_3

    iget-object v10, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v10, v5, v0}, Lcom/google/android/gms/internal/zzamf;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v10

    mul-int/2addr v10, v1

    if-gtz v10, :cond_3

    move v6, v2

    :cond_3
    if-eqz v6, :cond_5

    iget v10, p0, Lcom/google/android/gms/internal/zzalr;->limit:I

    if-ge v8, v10, :cond_5

    iget-object v10, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v10, v0, v4}, Lcom/google/android/gms/internal/zzamf;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v10

    mul-int/2addr v10, v1

    if-gtz v10, :cond_5

    move v10, v2

    :goto_2
    if-eqz v10, :cond_6

    add-int/lit8 v0, v8, 0x1

    move-object v8, v9

    :goto_3
    move-object v9, v8

    move v8, v0

    goto :goto_1

    :cond_4
    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzamg;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalt;->zzcys()Lcom/google/android/gms/internal/zzamk;

    move-result-object v3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalt;->zzcyt()Lcom/google/android/gms/internal/zzamk;

    move-result-object v1

    move-object v4, v1

    move-object v5, v3

    move v1, v2

    move-object v3, v0

    goto :goto_0

    :cond_5
    move v10, v7

    goto :goto_2

    :cond_6
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v10

    invoke-virtual {v9, v0, v10}, Lcom/google/android/gms/internal/zzamg;->zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v9

    move v0, v8

    move-object v8, v9

    goto :goto_3
.end method

.method public zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;
    .locals 0

    return-object p1
.end method

.method public zzcya()Lcom/google/android/gms/internal/zzamf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-object v0
.end method

.method public zzcyq()Lcom/google/android/gms/internal/zzals;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalr;->big:Lcom/google/android/gms/internal/zzalt;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalt;->zzcyq()Lcom/google/android/gms/internal/zzals;

    move-result-object v0

    return-object v0
.end method

.method public zzcyr()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
