.class public Lcom/google/android/gms/internal/zzamg;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lcom/google/android/gms/internal/zzamk;",
        ">;"
    }
.end annotation


# static fields
.field private static final biR:Lcom/google/android/gms/internal/zzaij;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaij",
            "<",
            "Lcom/google/android/gms/internal/zzamk;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final bhC:Lcom/google/android/gms/internal/zzamf;

.field private final biS:Lcom/google/android/gms/internal/zzaml;

.field private biT:Lcom/google/android/gms/internal/zzaij;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaij",
            "<",
            "Lcom/google/android/gms/internal/zzamk;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzaij;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzaij;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    sput-object v0, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzaij;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/android/gms/internal/zzamf;",
            "Lcom/google/android/gms/internal/zzaij",
            "<",
            "Lcom/google/android/gms/internal/zzamk;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    return-void
.end method

.method public static zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/zzamg;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzamg;-><init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)V

    return-object v0
.end method

.method private zzczu()V
    .locals 7

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-static {}, Lcom/google/android/gms/internal/zzamh;->zzczx()Lcom/google/android/gms/internal/zzamh;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move v1, v2

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/google/android/gms/internal/zzamf;->zzm(Lcom/google/android/gms/internal/zzaml;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    const/4 v1, 0x1

    :goto_2
    new-instance v5, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v6

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {v5, v6, v0}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    move v1, v2

    goto :goto_2

    :cond_4
    if-eqz v1, :cond_5

    new-instance v0, Lcom/google/android/gms/internal/zzaij;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-direct {v0, v3, v1}, Lcom/google/android/gms/internal/zzaij;-><init>(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    goto :goto_0

    :cond_5
    sget-object v0, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    goto :goto_0
.end method

.method public static zzn(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzamg;

    invoke-static {}, Lcom/google/android/gms/internal/zzamo;->b()Lcom/google/android/gms/internal/zzamo;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzamg;-><init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)V

    return-object v0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/android/gms/internal/zzamk;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamg;->zzczu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    sget-object v1, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaij;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzalz;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-static {}, Lcom/google/android/gms/internal/zzamh;->zzczx()Lcom/google/android/gms/internal/zzamh;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v0, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Index not available in IndexedNode!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamg;->zzczu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    sget-object v1, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaml;->zzl(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    new-instance v1, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaij;->zzbn(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzamf;)Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public zzcqy()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method

.method public zzcrl()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lcom/google/android/gms/internal/zzamk;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamg;->zzczu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    sget-object v1, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzcrl()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaij;->zzcrl()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public zzczv()Lcom/google/android/gms/internal/zzamk;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    instance-of v0, v0, Lcom/google/android/gms/internal/zzama;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamg;->zzczu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    sget-object v1, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    check-cast v0, Lcom/google/android/gms/internal/zzama;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzama;->zzczg()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v2, v1}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaij;->zzcrn()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    goto :goto_0
.end method

.method public zzczw()Lcom/google/android/gms/internal/zzamk;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    instance-of v0, v0, Lcom/google/android/gms/internal/zzama;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/zzamg;->zzczu()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    sget-object v1, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    check-cast v0, Lcom/google/android/gms/internal/zzama;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzama;->zzczh()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzamk;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v2, v1}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaij;->zzcro()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    goto :goto_0
.end method

.method public zzh(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/zzaml;->zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    sget-object v1, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/internal/zzamf;->zzm(Lcom/google/android/gms/internal/zzaml;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzamg;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    sget-object v3, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    invoke-direct {v0, v2, v1, v3}, Lcom/google/android/gms/internal/zzamg;-><init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzaij;)V

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    sget-object v1, Lcom/google/android/gms/internal/zzamg;->biR:Lcom/google/android/gms/internal/zzaij;

    if-ne v0, v1, :cond_2

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzamg;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    const/4 v3, 0x0

    invoke-direct {v0, v2, v1, v3}, Lcom/google/android/gms/internal/zzamg;-><init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzaij;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    new-instance v3, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v3, p1, v0}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzaij;->zzbl(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaij;

    move-result-object v0

    invoke-interface {p2}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    new-instance v1, Lcom/google/android/gms/internal/zzamk;

    invoke-direct {v1, p1, p2}, Lcom/google/android/gms/internal/zzamk;-><init>(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaij;->zzbm(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaij;

    move-result-object v0

    :cond_3
    new-instance v1, Lcom/google/android/gms/internal/zzamg;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    invoke-direct {v1, v2, v3, v0}, Lcom/google/android/gms/internal/zzamg;-><init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzaij;)V

    move-object v0, v1

    goto :goto_0
.end method

.method public zzo(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzamg;
    .locals 4

    new-instance v0, Lcom/google/android/gms/internal/zzamg;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzamg;->biS:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/zzaml;->zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzamg;->bhC:Lcom/google/android/gms/internal/zzamf;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzamg;->biT:Lcom/google/android/gms/internal/zzaij;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzamg;-><init>(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;Lcom/google/android/gms/internal/zzaij;)V

    return-object v0
.end method
