.class public Lcom/google/android/gms/internal/zzali;
.super Ljava/lang/Object;


# instance fields
.field private final bhB:Lcom/google/android/gms/internal/zzall;

.field private final bhC:Lcom/google/android/gms/internal/zzamf;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzall;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzali;->bhB:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzali;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzalf;Lcom/google/android/gms/internal/zzajl;Lcom/google/android/gms/internal/zzamg;)Lcom/google/android/gms/internal/zzalg;
    .locals 3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxm()Lcom/google/android/gms/internal/zzalh$zza;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzalh$zza;->bhz:Lcom/google/android/gms/internal/zzalh$zza;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalh$zza;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxm()Lcom/google/android/gms/internal/zzalh$zza;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzalh$zza;->bhv:Lcom/google/android/gms/internal/zzalh$zza;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzalh$zza;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzali;->bhB:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {p2, p1, v0}, Lcom/google/android/gms/internal/zzajl;->zza(Lcom/google/android/gms/internal/zzalf;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzalg;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxl()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzali;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {p3, v0, v1, v2}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzalf;->zzg(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalf;

    move-result-object p1

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzali;)Lcom/google/android/gms/internal/zzamf;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzali;->bhC:Lcom/google/android/gms/internal/zzamf;

    return-object v0
.end method

.method private zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalh$zza;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzamg;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalg;",
            ">;",
            "Lcom/google/android/gms/internal/zzalh$zza;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalf;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajl;",
            ">;",
            "Lcom/google/android/gms/internal/zzamg;",
            ")V"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalf;->zzcxm()Lcom/google/android/gms/internal/zzalh$zza;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/google/android/gms/internal/zzalh$zza;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzali;->zzcxr()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalf;

    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v1, p2}, Lcom/google/android/gms/internal/zzajl;->zza(Lcom/google/android/gms/internal/zzalh$zza;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-direct {p0, v0, v1, p5}, Lcom/google/android/gms/internal/zzali;->zza(Lcom/google/android/gms/internal/zzalf;Lcom/google/android/gms/internal/zzajl;Lcom/google/android/gms/internal/zzamg;)Lcom/google/android/gms/internal/zzalg;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    return-void
.end method

.method private zzcxr()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Lcom/google/android/gms/internal/zzalf;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/zzali$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzali$1;-><init>(Lcom/google/android/gms/internal/zzali;)V

    return-object v0
.end method


# virtual methods
.method public zza(Ljava/util/List;Lcom/google/android/gms/internal/zzamg;Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalf;",
            ">;",
            "Lcom/google/android/gms/internal/zzamg;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajl;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalg;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalf;->zzcxm()Lcom/google/android/gms/internal/zzalh$zza;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/internal/zzalh$zza;->bhy:Lcom/google/android/gms/internal/zzalh$zza;

    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/zzalh$zza;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/google/android/gms/internal/zzali;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalf;->zzcxo()Lcom/google/android/gms/internal/zzamg;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v4

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalf;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzamg;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/internal/zzamf;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzaml;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalf;->zzcxl()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalf;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/google/android/gms/internal/zzalf;->zzc(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzamg;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    sget-object v2, Lcom/google/android/gms/internal/zzalh$zza;->bhv:Lcom/google/android/gms/internal/zzalh$zza;

    move-object v0, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzali;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalh$zza;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzamg;)V

    sget-object v2, Lcom/google/android/gms/internal/zzalh$zza;->bhw:Lcom/google/android/gms/internal/zzalh$zza;

    move-object v0, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzali;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalh$zza;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzamg;)V

    sget-object v2, Lcom/google/android/gms/internal/zzalh$zza;->bhx:Lcom/google/android/gms/internal/zzalh$zza;

    move-object v0, p0

    move-object v3, v6

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzali;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalh$zza;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzamg;)V

    sget-object v2, Lcom/google/android/gms/internal/zzalh$zza;->bhy:Lcom/google/android/gms/internal/zzalh$zza;

    move-object v0, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzali;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalh$zza;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzamg;)V

    sget-object v2, Lcom/google/android/gms/internal/zzalh$zza;->bhz:Lcom/google/android/gms/internal/zzalh$zza;

    move-object v0, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzali;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzalh$zza;Ljava/util/List;Ljava/util/List;Lcom/google/android/gms/internal/zzamg;)V

    return-object v1
.end method
