.class public Lcom/facebook/imagepipeline/request/MediaVariations$Builder;
.super Ljava/lang/Object;
.source "MediaVariations.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/request/MediaVariations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mForceRequestForSpecifiedUri:Z

.field private final mMediaId:Ljava/lang/String;

.field private mVariants:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/imagepipeline/request/MediaVariations$Variant;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "mediaId"    # Ljava/lang/String;

    .prologue
    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mForceRequestForSpecifiedUri:Z

    .line 183
    iput-object p1, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mMediaId:Ljava/lang/String;

    .line 184
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/facebook/imagepipeline/request/MediaVariations$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/facebook/imagepipeline/request/MediaVariations$1;

    .prologue
    .line 177
    invoke-direct {p0, p1}, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/request/MediaVariations$Builder;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mMediaId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/request/MediaVariations$Builder;

    .prologue
    .line 177
    iget-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mVariants:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/facebook/imagepipeline/request/MediaVariations$Builder;

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mForceRequestForSpecifiedUri:Z

    return v0
.end method


# virtual methods
.method public addVariant(Landroid/net/Uri;II)Lcom/facebook/imagepipeline/request/MediaVariations$Builder;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 187
    iget-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mVariants:Ljava/util/List;

    if-nez v0, :cond_0

    .line 188
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mVariants:Ljava/util/List;

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mVariants:Ljava/util/List;

    new-instance v1, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;

    invoke-direct {v1, p1, p2, p3}, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;-><init>(Landroid/net/Uri;II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    return-object p0
.end method

.method public build()Lcom/facebook/imagepipeline/request/MediaVariations;
    .locals 2

    .prologue
    .line 208
    new-instance v0, Lcom/facebook/imagepipeline/request/MediaVariations;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/imagepipeline/request/MediaVariations;-><init>(Lcom/facebook/imagepipeline/request/MediaVariations$Builder;Lcom/facebook/imagepipeline/request/MediaVariations$1;)V

    return-object v0
.end method

.method public setForceRequestForSpecifiedUri(Z)Lcom/facebook/imagepipeline/request/MediaVariations$Builder;
    .locals 0
    .param p1, "forceRequestForSpecifiedUri"    # Z

    .prologue
    .line 203
    iput-boolean p1, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Builder;->mForceRequestForSpecifiedUri:Z

    .line 204
    return-object p0
.end method
