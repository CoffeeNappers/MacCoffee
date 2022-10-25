.class public final Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
.super Ljava/lang/Object;
.source "MediaVariations.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/request/MediaVariations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Variant"
.end annotation


# instance fields
.field private final mHeight:I

.field private final mUri:Landroid/net/Uri;

.field private final mWidth:I


# direct methods
.method public constructor <init>(Landroid/net/Uri;II)V
    .locals 0
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mUri:Landroid/net/Uri;

    .line 108
    iput p2, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mWidth:I

    .line 109
    iput p3, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mHeight:I

    .line 110
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 126
    instance-of v2, p1, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;

    if-nez v2, :cond_1

    .line 130
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 129
    check-cast v0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;

    .line 130
    .local v0, "otherVariant":Lcom/facebook/imagepipeline/request/MediaVariations$Variant;
    iget-object v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mUri:Landroid/net/Uri;

    iget-object v3, v0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mUri:Landroid/net/Uri;

    invoke-static {v2, v3}, Lcom/facebook/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mWidth:I

    iget v3, v0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mWidth:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mHeight:I

    iget v3, v0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mHeight:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mHeight:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 117
    iget v0, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mWidth:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 137
    iget-object v1, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->hashCode()I

    move-result v0

    .line 138
    .local v0, "hashCode":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mWidth:I

    add-int v0, v1, v2

    .line 139
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mHeight:I

    add-int v0, v1, v2

    .line 140
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 145
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    const-string/jumbo v1, "%dx%d %s"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mWidth:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mHeight:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/facebook/imagepipeline/request/MediaVariations$Variant;->mUri:Landroid/net/Uri;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
