.class public Lcom/vk/imageloader/VKImageRequestWrapper;
.super Ljava/lang/Object;
.source "VKImageRequestWrapper.java"


# instance fields
.field private dataSource:Lcom/facebook/datasource/DataSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vk/imageloader/VKImageRequestWrapper;->dataSource:Lcom/facebook/datasource/DataSource;

    if-eqz v0, :cond_0

    .line 17
    iget-object v0, p0, Lcom/vk/imageloader/VKImageRequestWrapper;->dataSource:Lcom/facebook/datasource/DataSource;

    invoke-interface {v0}, Lcom/facebook/datasource/DataSource;->close()Z

    .line 19
    :cond_0
    return-void
.end method

.method public isCanceled()Z
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vk/imageloader/VKImageRequestWrapper;->dataSource:Lcom/facebook/datasource/DataSource;

    if-eqz v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/vk/imageloader/VKImageRequestWrapper;->dataSource:Lcom/facebook/datasource/DataSource;

    invoke-interface {v0}, Lcom/facebook/datasource/DataSource;->isClosed()Z

    move-result v0

    .line 25
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public wrap(Lcom/facebook/datasource/DataSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 12
    .local p1, "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;"
    iput-object p1, p0, Lcom/vk/imageloader/VKImageRequestWrapper;->dataSource:Lcom/facebook/datasource/DataSource;

    .line 13
    return-void
.end method
