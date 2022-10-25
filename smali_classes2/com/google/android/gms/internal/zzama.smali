.class public Lcom/google/android/gms/internal/zzama;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaml;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzama$zza;,
        Lcom/google/android/gms/internal/zzama$zzb;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static biy:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final bgX:Lcom/google/android/gms/internal/zzaih;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaih",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            "Lcom/google/android/gms/internal/zzaml;",
            ">;"
        }
    .end annotation
.end field

.field private biA:Ljava/lang/String;

.field private final biz:Lcom/google/android/gms/internal/zzaml;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzama;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzama;->$assertionsDisabled:Z

    new-instance v0, Lcom/google/android/gms/internal/zzama$1;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzama$1;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzama;->biy:Ljava/util/Comparator;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzama;->biA:Ljava/lang/String;

    sget-object v0, Lcom/google/android/gms/internal/zzama;->biy:Ljava/util/Comparator;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzaih$zza;->zza(Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    return-void
.end method

.method protected constructor <init>(Lcom/google/android/gms/internal/zzaih;Lcom/google/android/gms/internal/zzaml;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzaih",
            "<",
            "Lcom/google/android/gms/internal/zzalz;",
            "Lcom/google/android/gms/internal/zzaml;",
            ">;",
            "Lcom/google/android/gms/internal/zzaml;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzama;->biA:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Can\'t create empty ChildrenNode with priority!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p2, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    return-void
.end method

.method private static zzb(Ljava/lang/StringBuilder;I)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    const-string/jumbo v1, " "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private zzc(Ljava/lang/StringBuilder;I)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "{ }"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "{\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    add-int/lit8 v1, p2, 0x2

    invoke-static {p1, v1}, Lcom/google/android/gms/internal/zzama;->zzb(Ljava/lang/StringBuilder;I)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/google/android/gms/internal/zzama;

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzama;

    add-int/lit8 v1, p2, 0x2

    invoke-direct {v0, p1, v1}, Lcom/google/android/gms/internal/zzama;->zzc(Ljava/lang/StringBuilder;I)V

    :goto_2
    const-string/jumbo v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    add-int/lit8 v0, p2, 0x2

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzama;->zzb(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, ".priority="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzama;->zzb(Ljava/lang/StringBuilder;I)V

    const-string/jumbo v0, "}"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0
.end method


# virtual methods
.method public synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzaml;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzama;->zzh(Lcom/google/android/gms/internal/zzaml;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v4, 0x1

    const/4 v3, 0x0

    if-nez p1, :cond_0

    move v0, v3

    :goto_0
    return v0

    :cond_0
    if-ne p1, p0, :cond_1

    move v0, v4

    goto :goto_0

    :cond_1
    instance-of v0, p1, Lcom/google/android/gms/internal/zzama;

    if-nez v0, :cond_2

    move v0, v3

    goto :goto_0

    :cond_2
    check-cast p1, Lcom/google/android/gms/internal/zzama;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzama;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzama;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v3

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->size()I

    move-result v0

    iget-object v1, p1, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaih;->size()I

    move-result v1

    if-eq v0, v1, :cond_4

    move v0, v3

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v5

    iget-object v0, p1, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzalz;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v7}, Lcom/google/android/gms/internal/zzalz;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    :cond_6
    move v0, v3

    goto :goto_0

    :cond_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Something went wrong internally."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    move v0, v4

    goto/16 :goto_0
.end method

.method public getChildCount()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->size()I

    move-result v0

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzama;->getValue(Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValue(Z)Ljava/lang/Object;
    .locals 10

    const/4 v3, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzama;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v2, v3

    move v4, v5

    move v6, v5

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzalz;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/zzaml;->getValue(Z)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v7, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v6, v6, 0x1

    if-eqz v2, :cond_7

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v3, :cond_2

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v9, 0x30

    if-ne v0, v9, :cond_2

    move v0, v5

    move v1, v4

    :goto_2
    move v2, v0

    move v4, v1

    goto :goto_1

    :cond_2
    invoke-static {v1}, Lcom/google/android/gms/internal/zzann;->zztg(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_3

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v1, v4, :cond_7

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    move v0, v2

    move v1, v4

    goto :goto_2

    :cond_3
    move v0, v5

    move v1, v4

    goto :goto_2

    :cond_4
    if-nez p1, :cond_5

    if-eqz v2, :cond_5

    mul-int/lit8 v0, v6, 0x2

    if-ge v4, v0, :cond_5

    new-instance v0, Ljava/util/ArrayList;

    add-int/lit8 v1, v4, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    :goto_3
    if-gt v5, v4, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_5
    if-eqz p1, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    const-string/jumbo v0, ".priority"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzaml;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v7, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    move-object v0, v7

    goto/16 :goto_0

    :cond_7
    move v0, v2

    move v1, v4

    goto :goto_2
.end method

.method public hashCode()I
    .locals 4

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzama;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    mul-int/lit8 v1, v1, 0x1f

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzalz;->hashCode()I

    move-result v3

    add-int/2addr v1, v3

    mul-int/lit8 v1, v1, 0x11

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    goto :goto_0

    :cond_0
    return v1
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v0

    return v0
.end method

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

    new-instance v0, Lcom/google/android/gms/internal/zzama$zzb;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaih;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzama$zzb;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzama;->zzc(Ljava/lang/StringBuilder;I)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzaml$zza;)Ljava/lang/String;
    .locals 6

    const/4 v2, 0x0

    sget-object v0, Lcom/google/android/gms/internal/zzaml$zza;->bje:Lcom/google/android/gms/internal/zzaml$zza;

    if-eq p1, v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Hashes on children nodes only supported for V1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "priority:"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    sget-object v1, Lcom/google/android/gms/internal/zzaml$zza;->bje:Lcom/google/android/gms/internal/zzaml$zza;

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaml;->zza(Lcom/google/android/gms/internal/zzaml$zza;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, ":"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzama;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v2

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-nez v1, :cond_2

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    const/4 v0, 0x1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_1

    :cond_4
    if-eqz v1, :cond_5

    invoke-static {}, Lcom/google/android/gms/internal/zzamo;->b()Lcom/google/android/gms/internal/zzamo;

    move-result-object v0

    invoke-static {v4, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_5
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzamk;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->zzcqy()Lcom/google/android/gms/internal/zzaml;

    move-result-object v2

    invoke-interface {v2}, Lcom/google/android/gms/internal/zzaml;->zzczd()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v4, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzamk;->a()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, ":"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_7
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzama$zza;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzama;->zza(Lcom/google/android/gms/internal/zzama$zza;Z)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzama$zza;Z)V
    .locals 2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzama;->zzczf()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->zza(Lcom/google/android/gms/internal/zzaim$zzb;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    new-instance v1, Lcom/google/android/gms/internal/zzama$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/internal/zzama$2;-><init>(Lcom/google/android/gms/internal/zzama;Lcom/google/android/gms/internal/zzama$zza;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzaih;->zza(Lcom/google/android/gms/internal/zzaim$zzb;)V

    goto :goto_0
.end method

.method public zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;
    .locals 2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzama;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/android/gms/internal/zzaml;->zzao(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p0

    goto :goto_0
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

    new-instance v0, Lcom/google/android/gms/internal/zzama$zzb;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzaih;->zzcrl()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzama$zzb;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public zzczd()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biA:Ljava/lang/String;

    if-nez v0, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzaml$zza;->bje:Lcom/google/android/gms/internal/zzaml$zza;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzama;->zza(Lcom/google/android/gms/internal/zzaml$zza;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v0, ""

    :goto_0
    iput-object v0, p0, Lcom/google/android/gms/internal/zzama;->biA:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biA:Ljava/lang/String;

    return-object v0

    :cond_1
    invoke-static {v0}, Lcom/google/android/gms/internal/zzann;->zzte(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public zzcze()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public zzczf()Lcom/google/android/gms/internal/zzaml;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    return-object v0
.end method

.method public zzczg()Lcom/google/android/gms/internal/zzalz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->zzcrj()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    return-object v0
.end method

.method public zzczh()Lcom/google/android/gms/internal/zzalz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->zzcrk()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    return-object v0
.end method

.method public zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalz;->zzczb()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzama;->zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->zzbg(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    :cond_1
    invoke-interface {p2}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/internal/zzaih;->zzj(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaih;

    move-result-object v0

    :cond_2
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    goto :goto_0

    :cond_3
    new-instance v1, Lcom/google/android/gms/internal/zzama;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-direct {v1, v0, v2}, Lcom/google/android/gms/internal/zzama;-><init>(Lcom/google/android/gms/internal/zzaih;Lcom/google/android/gms/internal/zzaml;)V

    move-object v0, v1

    goto :goto_0
.end method

.method public zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaih;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzama;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-direct {v0, v1, p1}, Lcom/google/android/gms/internal/zzama;-><init>(Lcom/google/android/gms/internal/zzaih;Lcom/google/android/gms/internal/zzaml;)V

    goto :goto_0
.end method

.method public zzh(Lcom/google/android/gms/internal/zzaml;)I
    .locals 4

    const/4 v2, 0x1

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzama;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->zzcze()Z

    move-result v3

    if-eqz v3, :cond_3

    move v0, v2

    goto :goto_0

    :cond_3
    invoke-interface {p1}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_4

    move v0, v2

    goto :goto_0

    :cond_4
    sget-object v2, Lcom/google/android/gms/internal/zzaml;->bjd:Lcom/google/android/gms/internal/zzama;

    if-ne p1, v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public zzk(Lcom/google/android/gms/internal/zzalz;)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzama;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzl(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzalz;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->zzbh(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzalz;

    return-object v0
.end method

.method public zzl(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;
    .locals 3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvj()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    return-object p2

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->zzczb()Z

    move-result v1

    if-eqz v1, :cond_2

    sget-boolean v0, Lcom/google/android/gms/internal/zzama;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    invoke-static {p2}, Lcom/google/android/gms/internal/zzamp;->zzq(Lcom/google/android/gms/internal/zzaml;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_1
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzama;->zzg(Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p2

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzama;->zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-interface {v1, v2, p2}, Lcom/google/android/gms/internal/zzaml;->zzl(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzama;->zze(Lcom/google/android/gms/internal/zzalz;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object p2

    goto :goto_0
.end method

.method public zzm(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzaml;
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalz;->zzczb()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzaml;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->biz:Lcom/google/android/gms/internal/zzaml;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzama;->bgX:Lcom/google/android/gms/internal/zzaih;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzaih;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaml;

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/zzame;->zzczq()Lcom/google/android/gms/internal/zzame;

    move-result-object v0

    goto :goto_0
.end method
