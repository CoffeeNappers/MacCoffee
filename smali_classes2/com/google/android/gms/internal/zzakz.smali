.class public Lcom/google/android/gms/internal/zzakz;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzakz$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Lcom/google/android/gms/internal/zzajq;",
        "TT;>;>;"
    }
.end annotation


# static fields
.field private static final bgY:Lcom/google/android/gms/internal/zzaih;

.field private static final bgZ:Lcom/google/android/gms/internal/zzakz;


# instance fields
.field private final bgX:Lcom/google/android/gms/internal/zzaih;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaih",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lcom/google/android/gms/internal/zzalz;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaiq;->zzi(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzaiq;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaih$zza;->zza(Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzakz;->bgY:Lcom/google/android/gms/internal/zzaih;

    new-instance v0, Lcom/google/android/gms/internal/zzakz;

    const/4 v1, 0x0

    sget-object v2, Lcom/google/android/gms/internal/zzakz;->bgY:Lcom/google/android/gms/internal/zzaih;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V

    sput-object v0, Lcom/google/android/gms/internal/zzakz;->bgZ:Lcom/google/android/gms/internal/zzakz;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzakz;->bgY:Lcom/google/android/gms/internal/zzaih;

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/android/gms/internal/zzaih",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz$zza;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzakz$zza",
            "<-TT;TR;>;TR;)TR;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzakz;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {v1, v0, p2, p3}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz$zza;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-interface {p2, p1, v0, p3}, Lcom/google/android/gms/internal/zzakz$zza;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    :cond_1
    return-object p3
.end method

.method public static zzcxe()Lcom/google/android/gms/internal/zzakz;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/android/gms/internal/zzakz",
            "<TV;>;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzakz;->bgZ:Lcom/google/android/gms/internal/zzakz;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    :cond_2
    move v0, v1

    goto :goto_0

    :cond_3
    check-cast p1, Lcom/google/android/gms/internal/zzakz;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzaih;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    :cond_4
    move v0, v1

    goto :goto_0

    :cond_5
    iget-object v2, p1, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    if-nez v2, :cond_4

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    :goto_1
    move v0, v1

    goto :goto_0

    :cond_7
    iget-object v2, p1, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v2, :cond_0

    goto :goto_1
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaih;->hashCode()I

    move-result v1

    :cond_0
    add-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Lcom/google/android/gms/internal/zzajq;",
            "TT;>;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/zzakz$2;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzakz$2;-><init>(Lcom/google/android/gms/internal/zzakz;Ljava/util/List;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzakz$zza;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "ImmutableTree { value="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakz;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, ", children={"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "="

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "} }"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/zzakz$1;

    invoke-direct {v1, p0, v0}, Lcom/google/android/gms/internal/zzakz$1;-><init>(Lcom/google/android/gms/internal/zzakz;Ljava/util/ArrayList;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzakz$zza;)V

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Lcom/google/android/gms/internal/zzajq;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzala",
            "<-TT;>;)",
            "Lcom/google/android/gms/internal/zzajq;"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-virtual {v0, v3, p2}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    if-eqz v0, :cond_2

    new-instance v1, Lcom/google/android/gms/internal/zzajq;

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/google/android/gms/internal/zzalz;

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-direct {v1, v3}, Lcom/google/android/gms/internal/zzajq;-><init>([Lcom/google/android/gms/internal/zzalz;)V

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzajq;->zzh(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, v1

    goto :goto_0

    :cond_3
    move-object v0, v1

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;)Lcom/google/android/gms/internal/zzakz;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;)",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p2

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-nez v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v0, v2, p2}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaih;->zzbg(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    :goto_1
    new-instance p2, Lcom/google/android/gms/internal/zzakz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-direct {p2, v1, v0}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/internal/zzaih;->zzj(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    goto :goto_1
.end method

.method public zza(Lcom/google/android/gms/internal/zzakz$zza;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzakz$zza",
            "<TT;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz$zza;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public zzag(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzajq;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzala;->bhd:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    return-object v0
.end method

.method public zzah(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")TT;"
        }
    .end annotation

    sget-object v0, Lcom/google/android/gms/internal/zzala;->bhd:Lcom/google/android/gms/internal/zzala;

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzakz;->zzc(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zzai(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object p0

    goto :goto_0
.end method

.method public zzaj(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object p0

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    new-instance v0, Lcom/google/android/gms/internal/zzakz;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V

    move-object p0, v0

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzakz;->zzaj(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzakz;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaih;->zzbg(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-nez v1, :cond_4

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object p0

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/internal/zzaih;->zzj(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    goto :goto_1

    :cond_4
    new-instance v1, Lcom/google/android/gms/internal/zzakz;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V

    move-object p0, v1

    goto :goto_0
.end method

.method public zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzakz;->zzak(Lcom/google/android/gms/internal/zzajq;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzakz;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "TT;)",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzakz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-direct {v0, p2, v1}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-nez v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-virtual {v0, v2, p2}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v2, v1, v0}, Lcom/google/android/gms/internal/zzaih;->zzj(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzakz;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/internal/zzakz;-><init>(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaih;)V

    goto :goto_0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzala",
            "<-TT;>;)TT;"
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    iget-object v3, v0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v3, :cond_2

    iget-object v3, v0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-interface {p2, v3}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v0, v0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    goto :goto_0

    :cond_2
    move-object p0, v0

    goto :goto_1

    :cond_3
    move-object v0, v1

    goto :goto_0
.end method

.method public zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzakz$zza;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Lcom/google/android/gms/internal/zzakz$zza",
            "<-TT;TR;>;)TR;"
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    invoke-direct {p0, v0, p2, p1}, Lcom/google/android/gms/internal/zzakz;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzakz$zza;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public zzb(Lcom/google/android/gms/internal/zzala;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzala",
            "<-TT;>;)Z"
        }
    .end annotation

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-interface {p1, v0}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzakz;->zzb(Lcom/google/android/gms/internal/zzala;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzala;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzajq;",
            "Lcom/google/android/gms/internal/zzala",
            "<-TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-interface {p2, v0}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v1, v0

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-nez v0, :cond_2

    :cond_0
    return-object v1

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    iget-object v3, v0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    if-eqz v3, :cond_3

    iget-object v3, v0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    invoke-interface {p2, v3}, Lcom/google/android/gms/internal/zzala;->zzbs(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v1, v0, Lcom/google/android/gms/internal/zzakz;->value:Ljava/lang/Object;

    :cond_3
    move-object p0, v0

    goto :goto_1
.end method

.method public zzcxf()Lcom/google/android/gms/internal/zzaih;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzaih",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    return-object v0
.end method

.method public zze(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakz;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalz;",
            ")",
            "Lcom/google/android/gms/internal/zzakz",
            "<TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakz;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzakz;

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/zzakz;->zzcxe()Lcom/google/android/gms/internal/zzakz;

    move-result-object v0

    goto :goto_0
.end method
