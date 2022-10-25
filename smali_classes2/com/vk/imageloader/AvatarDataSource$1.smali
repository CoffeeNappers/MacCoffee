.class Lcom/vk/imageloader/AvatarDataSource$1;
.super Lcom/facebook/datasource/BaseDataSubscriber;
.source "AvatarDataSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/imageloader/AvatarDataSource;-><init>(Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/datasource/BaseDataSubscriber",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/facebook/common/references/CloseableReference",
        "<",
        "Lcom/facebook/imagepipeline/image/CloseableImage;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/imageloader/AvatarDataSource;


# direct methods
.method constructor <init>(Lcom/vk/imageloader/AvatarDataSource;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/imageloader/AvatarDataSource;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/vk/imageloader/AvatarDataSource$1;->this$0:Lcom/vk/imageloader/AvatarDataSource;

    invoke-direct {p0}, Lcom/facebook/datasource/BaseDataSubscriber;-><init>()V

    return-void
.end method


# virtual methods
.method protected onFailureImpl(Lcom/facebook/datasource/DataSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Ljava/util/List<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;>;"
    iget-object v0, p0, Lcom/vk/imageloader/AvatarDataSource$1;->this$0:Lcom/vk/imageloader/AvatarDataSource;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/vk/imageloader/AvatarDataSource;->access$200(Lcom/vk/imageloader/AvatarDataSource;Ljava/lang/Object;Z)Z

    .line 63
    return-void
.end method

.method protected onNewResultImpl(Lcom/facebook/datasource/DataSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/datasource/DataSource",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/common/references/CloseableReference",
            "<",
            "Lcom/facebook/imagepipeline/image/CloseableImage;",
            ">;>;>;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "dataSource":Lcom/facebook/datasource/DataSource;, "Lcom/facebook/datasource/DataSource<Ljava/util/List<Lcom/facebook/common/references/CloseableReference<Lcom/facebook/imagepipeline/image/CloseableImage;>;>;>;"
    iget-object v1, p0, Lcom/vk/imageloader/AvatarDataSource$1;->this$0:Lcom/vk/imageloader/AvatarDataSource;

    invoke-interface {p1}, Lcom/facebook/datasource/DataSource;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Lcom/vk/imageloader/AvatarDataSource;->access$000(Ljava/util/List;)Lcom/facebook/common/references/CloseableReference;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Lcom/vk/imageloader/AvatarDataSource;->access$100(Lcom/vk/imageloader/AvatarDataSource;Ljava/lang/Object;Z)Z

    .line 58
    return-void
.end method
