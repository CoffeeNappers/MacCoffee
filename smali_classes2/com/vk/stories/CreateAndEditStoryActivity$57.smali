.class Lcom/vk/stories/CreateAndEditStoryActivity$57;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->checkMaskForUpdates(Lcom/vk/masks/model/Mask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Lcom/vk/masks/model/Mask;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$mask:Lcom/vk/masks/model/Mask;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1767
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$57;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$57;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vk/masks/model/Mask;)V
    .locals 4
    .param p1, "serverMask"    # Lcom/vk/masks/model/Mask;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1770
    iget-wide v0, p1, Lcom/vk/masks/model/Mask;->updateTime:J

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$57;->val$mask:Lcom/vk/masks/model/Mask;

    iget-wide v2, v2, Lcom/vk/masks/model/Mask;->updateTime:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 1771
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$57;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadLocalMasks(Z)V

    .line 1773
    :cond_0
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1767
    check-cast p1, Lcom/vk/masks/model/Mask;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$57;->accept(Lcom/vk/masks/model/Mask;)V

    return-void
.end method
