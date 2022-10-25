.class Lcom/vk/stories/CreateAndEditStoryActivity$36;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->openMaskById(Ljava/lang/String;)V
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


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1315
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$36;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vk/masks/model/Mask;)V
    .locals 2
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1318
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/masks/MasksController;->raiseMask(Lcom/vk/masks/model/Mask;)V

    .line 1319
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$36;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->notifyMasksChanged()V

    .line 1320
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$36;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskSelected(ILcom/vk/masks/model/Mask;)V

    .line 1321
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
    .line 1315
    check-cast p1, Lcom/vk/masks/model/Mask;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$36;->accept(Lcom/vk/masks/model/Mask;)V

    return-void
.end method
