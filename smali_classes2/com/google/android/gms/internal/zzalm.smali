.class public Lcom/google/android/gms/internal/zzalm;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzalm$zza;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final bhB:Lcom/google/android/gms/internal/zzall;

.field private final bhS:Lcom/google/android/gms/internal/zzalo;

.field private bhT:Lcom/google/android/gms/internal/zzaln;

.field private final bhU:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajl;",
            ">;"
        }
    .end annotation
.end field

.field private final bhV:Lcom/google/android/gms/internal/zzali;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzalm;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzalm;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzaln;)V
    .locals 8

    const/4 v7, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzalm;->bhB:Lcom/google/android/gms/internal/zzall;

    new-instance v0, Lcom/google/android/gms/internal/zzalq;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzalq;-><init>(Lcom/google/android/gms/internal/zzamf;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalk;->zzcyg()Lcom/google/android/gms/internal/zzals;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/internal/zzalo;

    invoke-direct {v2, v1}, Lcom/google/android/gms/internal/zzalo;-><init>(Lcom/google/android/gms/internal/zzals;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzalm;->bhS:Lcom/google/android/gms/internal/zzalo;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzaln;->zzcyn()Lcom/google/android/gms/internal/zzald;

    move-result-object v2

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzaln;->zzcyl()Lcom/google/android/gms/internal/zzald;

    move-result-object v3

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcya()Lcom/google/android/gms/internal/zzamf;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/google/android/gms/internal/zzamg;->zza(Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzamf;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v4

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzald;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v5

    invoke-virtual {v0, v4, v5, v7}, Lcom/google/android/gms/internal/zzalq;->zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v5

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzald;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v6

    invoke-interface {v1, v4, v6, v7}, Lcom/google/android/gms/internal/zzals;->zza(Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzalp;)Lcom/google/android/gms/internal/zzamg;

    move-result-object v4

    new-instance v6, Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalq;->zzcyr()Z

    move-result v0

    invoke-direct {v6, v5, v2, v0}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    new-instance v0, Lcom/google/android/gms/internal/zzald;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v2

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzals;->zzcyr()Z

    move-result v1

    invoke-direct {v0, v4, v2, v1}, Lcom/google/android/gms/internal/zzald;-><init>(Lcom/google/android/gms/internal/zzamg;ZZ)V

    new-instance v1, Lcom/google/android/gms/internal/zzaln;

    invoke-direct {v1, v0, v6}, Lcom/google/android/gms/internal/zzaln;-><init>(Lcom/google/android/gms/internal/zzald;Lcom/google/android/gms/internal/zzald;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    new-instance v0, Lcom/google/android/gms/internal/zzali;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzali;-><init>(Lcom/google/android/gms/internal/zzall;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhV:Lcom/google/android/gms/internal/zzali;

    return-void
.end method

.method private zza(Ljava/util/List;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalf;",
            ">;",
            "Lcom/google/android/gms/internal/zzamg;",
            "Lcom/google/android/gms/internal/zzajl;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalg;",
            ">;"
        }
    .end annotation

    if-nez p3, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzalm;->bhV:Lcom/google/android/gms/internal/zzali;

    invoke-virtual {v1, p1, p2, v0}, Lcom/google/android/gms/internal/zzali;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzamg;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/google/android/gms/internal/zzajl;

    const/4 v1, 0x0

    aput-object p3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajl;",
            "Lcom/google/firebase/database/DatabaseError;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalh;",
            ">;"
        }
    .end annotation

    const/4 v3, -0x1

    if-eqz p2, :cond_3

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sget-boolean v0, Lcom/google/android/gms/internal/zzalm;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "A cancel should cancel all event registrations"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhB:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajl;

    new-instance v5, Lcom/google/android/gms/internal/zzale;

    invoke-direct {v5, v0, p2, v2}, Lcom/google/android/gms/internal/zzale;-><init>(Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DatabaseError;Lcom/google/android/gms/internal/zzajq;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    move-object v4, v1

    :goto_1
    if-eqz p1, :cond_6

    const/4 v0, 0x0

    move v1, v0

    move v2, v3

    :goto_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzajl;->zzc(Lcom/google/android/gms/internal/zzajl;)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajl;->zzcvc()Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_3
    if-eq v1, v3, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajl;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajl;->zzcvb()V

    :cond_2
    :goto_4
    return-object v4

    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    move-object v4, v0

    goto :goto_1

    :cond_4
    move v2, v1

    :cond_5
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajl;->zzcvb()V

    goto :goto_5

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_4

    :cond_8
    move v1, v2

    goto :goto_3
.end method

.method public zzb(Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalm$zza;
    .locals 4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzakn;->zzcwq()Lcom/google/android/gms/internal/zzakn$zza;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/internal/zzakn$zza;->bgl:Lcom/google/android/gms/internal/zzakn$zza;

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzakn;->zzcwp()Lcom/google/android/gms/internal/zzako;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzako;->zzcwu()Lcom/google/android/gms/internal/zzalk;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/google/android/gms/internal/zzalm;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyo()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "We should always have a full cache before handling merges"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    sget-boolean v0, Lcom/google/android/gms/internal/zzalm;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcym()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Missing event cache, even though we have a server cache"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalm;->bhS:Lcom/google/android/gms/internal/zzalo;

    invoke-virtual {v1, v0, p1, p2, p3}, Lcom/google/android/gms/internal/zzalo;->zza(Lcom/google/android/gms/internal/zzaln;Lcom/google/android/gms/internal/zzakn;Lcom/google/android/gms/internal/zzaki;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalo$zza;

    move-result-object v1

    sget-boolean v2, Lcom/google/android/gms/internal/zzalm;->$assertionsDisabled:Z

    if-nez v2, :cond_2

    iget-object v2, v1, Lcom/google/android/gms/internal/zzalo$zza;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzaln;->zzcyn()Lcom/google/android/gms/internal/zzald;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyn()Lcom/google/android/gms/internal/zzald;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Once a server snap is complete, it should never go back"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_2
    iget-object v0, v1, Lcom/google/android/gms/internal/zzalo$zza;->bhT:Lcom/google/android/gms/internal/zzaln;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    iget-object v0, v1, Lcom/google/android/gms/internal/zzalo$zza;->bhX:Ljava/util/List;

    iget-object v2, v1, Lcom/google/android/gms/internal/zzalo$zza;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzaln;->zzcyl()Lcom/google/android/gms/internal/zzald;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzald;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {p0, v0, v2, v3}, Lcom/google/android/gms/internal/zzalm;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/zzalm$zza;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzalo$zza;->bhX:Ljava/util/List;

    invoke-direct {v2, v0, v1}, Lcom/google/android/gms/internal/zzalm$zza;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-object v2
.end method

.method public zzb(Lcom/google/android/gms/internal/zzajl;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhU:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public zzcyi()Lcom/google/android/gms/internal/zzall;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhB:Lcom/google/android/gms/internal/zzall;

    return-object v0
.end method

.method public zzcyj()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyn()Lcom/google/android/gms/internal/zzald;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zzcyk()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyl()Lcom/google/android/gms/internal/zzald;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzald;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    return-object v0
.end method

.method public zzl(Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajl;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzalg;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyl()Lcom/google/android/gms/internal/zzald;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzald;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v4

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/google/android/gms/internal/zzalf;->zzc(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzald;->zzcxh()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzald;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzalf;->zza(Lcom/google/android/gms/internal/zzamg;)Lcom/google/android/gms/internal/zzalf;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzald;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v0

    invoke-direct {p0, v2, v0, p1}, Lcom/google/android/gms/internal/zzalm;->zza(Ljava/util/List;Lcom/google/android/gms/internal/zzamg;Lcom/google/android/gms/internal/zzajl;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzs(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzalm;->bhT:Lcom/google/android/gms/internal/zzaln;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaln;->zzcyo()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzalm;->bhB:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->zzcye()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaml;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
