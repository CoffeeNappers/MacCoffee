.class public final Lcom/my/target/core/models/sections/f;
.super Lcom/my/target/core/models/sections/a;
.source "InstreamAdSection.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/my/target/core/models/sections/a",
        "<",
        "Lcom/my/target/core/models/banners/a;",
        ">;"
    }
.end annotation


# instance fields
.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/my/target/core/models/sections/k;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 5

    .prologue
    .line 31
    const-string/jumbo v0, "instreamads"

    invoke-direct {p0, v0, p1, p2}, Lcom/my/target/core/models/sections/a;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/models/sections/f;->i:Ljava/util/List;

    .line 34
    sget-object v1, Lcom/my/target/core/enums/a;->a:[Ljava/lang/String;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    .line 1051
    new-instance v4, Lcom/my/target/core/models/sections/k;

    invoke-direct {v4, v3}, Lcom/my/target/core/models/sections/k;-><init>(Ljava/lang/String;)V

    .line 37
    iget-object v3, p0, Lcom/my/target/core/models/sections/f;->i:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public final a(ILcom/my/target/core/models/banners/d;)Z
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method public final a(Lcom/my/target/core/models/banners/d;)Z
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x0

    return v0
.end method

.method public final b()I
    .locals 3

    .prologue
    .line 44
    const/4 v0, 0x0

    .line 45
    iget-object v1, p0, Lcom/my/target/core/models/sections/f;->i:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/sections/k;

    .line 47
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/k;->b()I

    move-result v0

    add-int/2addr v0, v1

    move v1, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    return v1
.end method

.method public final c(Ljava/lang/String;)Lcom/my/target/core/models/sections/k;
    .locals 3

    .prologue
    .line 77
    iget-object v0, p0, Lcom/my/target/core/models/sections/f;->i:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/sections/k;

    .line 79
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/k;->e()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 84
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final i()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/my/target/core/models/sections/k;",
            ">;"
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lcom/my/target/core/models/sections/f;->i:Ljava/util/List;

    return-object v0
.end method
