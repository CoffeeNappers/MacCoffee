.class public abstract Lcom/google/android/gms/internal/zzaio;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaim;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzaim",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final bap:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private baq:Lcom/google/android/gms/internal/zzaim;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final bar:Lcom/google/android/gms/internal/zzaim;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaio;->bap:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaio;->value:Ljava/lang/Object;

    if-nez p3, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzail;->zzcrr()Lcom/google/android/gms/internal/zzail;

    move-result-object p3

    :cond_0
    iput-object p3, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    if-nez p4, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzail;->zzcrr()Lcom/google/android/gms/internal/zzail;

    move-result-object p4

    :cond_1
    iput-object p4, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    return-void
.end method

.method private static zza(Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim$zza;
    .locals 1

    invoke-interface {p0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzaim$zza;->ban:Lcom/google/android/gms/internal/zzaim$zza;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzaim$zza;->bam:Lcom/google/android/gms/internal/zzaim$zza;

    goto :goto_0
.end method

.method private zzcrx()Lcom/google/android/gms/internal/zzaim;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzail;->zzcrr()Lcom/google/android/gms/internal/zzail;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaio;->zzcrs()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaio;->zzcrs()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrs()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcry()Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcrx()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-virtual {p0, v1, v1, v0, v1}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsa()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    goto :goto_0
.end method

.method private zzcry()Lcom/google/android/gms/internal/zzaio;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcsd()Lcom/google/android/gms/internal/zzaio;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaio;->zzcrt()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrs()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaio;->zzcrt()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsc()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    invoke-virtual {v1, v2, v2, v2, v0}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsb()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsd()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    move-object v0, v1

    goto :goto_0
.end method

.method private zzcrz()Lcom/google/android/gms/internal/zzaio;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcsd()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaio;->zzcrs()Lcom/google/android/gms/internal/zzaim;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaim;->zzcrs()Lcom/google/android/gms/internal/zzaim;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsc()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsd()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method private zzcsa()Lcom/google/android/gms/internal/zzaio;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcsb()Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcsc()Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcsd()Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_2
    return-object p0
.end method

.method private zzcsb()Lcom/google/android/gms/internal/zzaio;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    const/4 v1, 0x0

    sget-object v3, Lcom/google/android/gms/internal/zzaim$zza;->bam:Lcom/google/android/gms/internal/zzaim$zza;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    iget-object v5, v0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    move-object v0, p0

    move-object v2, v1

    move-object v4, v1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v4

    check-cast v4, Lcom/google/android/gms/internal/zzaio;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaio;->zzcrp()Lcom/google/android/gms/internal/zzaim$zza;

    move-result-object v3

    move-object v2, v1

    move-object v5, v1

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    return-object v0
.end method

.method private zzcsc()Lcom/google/android/gms/internal/zzaio;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    const/4 v1, 0x0

    sget-object v3, Lcom/google/android/gms/internal/zzaim$zza;->bam:Lcom/google/android/gms/internal/zzaim$zza;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    iget-object v4, v0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    move-object v0, p0

    move-object v2, v1

    move-object v5, v1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v5

    check-cast v5, Lcom/google/android/gms/internal/zzaio;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaio;->zzcrp()Lcom/google/android/gms/internal/zzaim$zza;

    move-result-object v3

    move-object v2, v1

    move-object v4, v1

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    return-object v0
.end method

.method private zzcsd()Lcom/google/android/gms/internal/zzaio;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaio;->zza(Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim$zza;

    move-result-object v3

    move-object v2, v1

    move-object v4, v1

    move-object v5, v1

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzaio;->zza(Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim$zza;

    move-result-object v3

    move-object v2, v1

    move-object v4, v1

    move-object v5, v1

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v5

    invoke-static {p0}, Lcom/google/android/gms/internal/zzaio;->zza(Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim$zza;

    move-result-object v3

    move-object v0, p0

    move-object v2, v1

    move-object v4, v6

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    return-object v0
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bap:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public synthetic zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaim;
    .locals 1

    invoke-virtual/range {p0 .. p5}, Lcom/google/android/gms/internal/zzaio;->zzb(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    return-object v0
.end method

.method public zza(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaim;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Ljava/util/Comparator",
            "<TK;>;)",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bap:Ljava/lang/Object;

    invoke-interface {p3, p1, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-virtual {p0, v1, v1, v0, v1}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    :goto_0
    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsa()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    return-object v0

    :cond_0
    if-nez v0, :cond_1

    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-virtual {p0, v1, v1, v1, v0}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    goto :goto_0
.end method

.method public zza(Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaim;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/util/Comparator",
            "<TK;>;)",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bap:Ljava/lang/Object;

    invoke-interface {p2, p1, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcry()Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-virtual {p0, v3, v3, v0, v3}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    :goto_0
    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcsa()Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    :goto_1
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcsc()Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrq()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaio;->zzcrz()Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bap:Ljava/lang/Object;

    invoke-interface {p2, p1, v0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/google/android/gms/internal/zzail;->zzcrr()Lcom/google/android/gms/internal/zzail;

    move-result-object v0

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcru()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->getValue()Ljava/lang/Object;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    check-cast v0, Lcom/google/android/gms/internal/zzaio;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaio;->zzcrx()Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object p0

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzaim;->zza(Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaim;

    move-result-object v0

    invoke-virtual {p0, v3, v3, v3, v0}, Lcom/google/android/gms/internal/zzaio;->zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;

    move-result-object v0

    goto :goto_0
.end method

.method protected abstract zza(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;)",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation
.end method

.method public zza(Lcom/google/android/gms/internal/zzaim$zzb;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaim$zzb",
            "<TK;TV;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaim;->zza(Lcom/google/android/gms/internal/zzaim$zzb;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bap:Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaio;->value:Ljava/lang/Object;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzaim$zzb;->zzk(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaim;->zza(Lcom/google/android/gms/internal/zzaim$zzb;)V

    return-void
.end method

.method public zzb(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim$zza;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)Lcom/google/android/gms/internal/zzaio;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;",
            "Lcom/google/android/gms/internal/zzaim$zza;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;)",
            "Lcom/google/android/gms/internal/zzaio",
            "<TK;TV;>;"
        }
    .end annotation

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/zzaio;->bap:Ljava/lang/Object;

    :cond_0
    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/google/android/gms/internal/zzaio;->value:Ljava/lang/Object;

    :cond_1
    if-nez p4, :cond_2

    iget-object p4, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    :cond_2
    if-nez p5, :cond_3

    iget-object p5, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    :cond_3
    sget-object v0, Lcom/google/android/gms/internal/zzaim$zza;->bam:Lcom/google/android/gms/internal/zzaim$zza;

    if-ne p3, v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/zzain;

    invoke-direct {v0, p1, p2, p4, p5}, Lcom/google/android/gms/internal/zzain;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    :goto_0
    return-object v0

    :cond_4
    new-instance v0, Lcom/google/android/gms/internal/zzaik;

    invoke-direct {v0, p1, p2, p4, p5}, Lcom/google/android/gms/internal/zzaik;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    goto :goto_0
.end method

.method zzb(Lcom/google/android/gms/internal/zzaim;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    return-void
.end method

.method protected abstract zzcrp()Lcom/google/android/gms/internal/zzaim$zza;
.end method

.method public zzcrs()Lcom/google/android/gms/internal/zzaim;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    return-object v0
.end method

.method public zzcrt()Lcom/google/android/gms/internal/zzaim;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    return-object v0
.end method

.method public zzcru()Lcom/google/android/gms/internal/zzaim;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcru()Lcom/google/android/gms/internal/zzaim;

    move-result-object p0

    goto :goto_0
.end method

.method public zzcrv()Lcom/google/android/gms/internal/zzaim;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaim",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrv()Lcom/google/android/gms/internal/zzaim;

    move-result-object p0

    goto :goto_0
.end method

.method public zzcrw()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaio;->baq:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaim;->zzcrw()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaio;->bar:Lcom/google/android/gms/internal/zzaim;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaim;->zzcrw()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
