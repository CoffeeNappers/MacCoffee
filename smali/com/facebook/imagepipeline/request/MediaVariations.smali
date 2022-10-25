.class public final Lcom/facebook/imagepipeline/request/MediaVariations;
.super Ljava/lang/Object;
.source "MediaVariations.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/request/MediaVariations$Builder;,
        Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# instance fields
.field private final mForceRequestForSpecifiedUri:Z

.field private final mMediaId:Ljava/lang/String;

.field private final mVariants:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/facebook/imagepipeline/request/MediaVariations$Builder;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->access$000(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mMediaId:Ljava/lang/String;

    .line 46
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->access$100(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mVariants:Ljava/util/List;

    .line 47
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->access$200(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mForceRequestForSpecifiedUri:Z

    .line 48
    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;Lcom/facebook/imagepipeline/request/MediaVariations$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/imagepipeline/request/MediaVariations$Builder;
    .param p2, "x1"    # Lcom/facebook/imagepipeline/request/MediaVariations$1;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/request/MediaVariations;-><init>(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)V

    return-void
.end method

.method public static forMediaId(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/MediaVariations;
    .locals 1
    .param p0, "mediaId"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 159
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 160
    :cond_0
    const/4 v0, 0x0

    .line 162
    :goto_0
    return-object v0

    :cond_1
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/MediaVariations;->newBuilderForMediaId(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/MediaVariations$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->build()Lcom/facebook/imagepipeline/request/MediaVariations;

    move-result-object v0

    goto :goto_0
.end method

.method public static newBuilderForMediaId(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/MediaVariations$Builder;
    .locals 2
    .param p0, "mediaId"    # Ljava/lang/String;

    .prologue
    .line 174
    new-instance v0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;-><init>(Ljava/lang/String;Lcom/facebook/imagepipeline/request/MediaVariations$1;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 80
    instance-of v2, p1, Lcom/facebook/imagepipeline/request/MediaVariations;

    if-nez v2, :cond_1

    .line 84
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 83
    check-cast v0, Lcom/facebook/imagepipeline/request/MediaVariations;

    .line 84
    .local v0, "otherVariations":Lcom/facebook/imagepipeline/request/MediaVariations;
    iget-object v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mMediaId:Ljava/lang/String;

    iget-object v3, v0, Lcom/facebook/imagepipeline/request/MediaVariations;->mMediaId:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/facebook/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mForceRequestForSpecifiedUri:Z

    iget-boolean v3, v0, Lcom/facebook/imagepipeline/request/MediaVariations;->mForceRequestForSpecifiedUri:Z

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mVariants:Ljava/util/List;

    iget-object v3, v0, Lcom/facebook/imagepipeline/request/MediaVariations;->mVariants:Ljava/util/List;

    .line 86
    invoke-static {v2, v3}, Lcom/facebook/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getMediaId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mMediaId:Ljava/lang/String;

    return-object v0
.end method

.method public getVariants()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mVariants:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 91
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mMediaId:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-boolean v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mForceRequestForSpecifiedUri:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mVariants:Ljava/util/List;

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/facebook/common/internal/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public shouldForceRequestForSpecifiedUri()Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mForceRequestForSpecifiedUri:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 96
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    const-string/jumbo v1, "%s-%b-%s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mMediaId:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-boolean v4, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mForceRequestForSpecifiedUri:Z

    .line 97
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/facebook/imagepipeline/request/MediaVariations;->mVariants:Ljava/util/List;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 96
    return-object v0
.end method
