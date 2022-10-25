.class Lcom/vk/stories/CreateAndEditStoryActivity$44;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskSelected(ILcom/vk/masks/model/Mask;)V
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
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$finalMask:Lcom/vk/masks/model/Mask;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1455
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$44;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$44;->val$finalMask:Lcom/vk/masks/model/Mask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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
    .line 1455
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$44;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "throwable"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1458
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$44;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksAnalytics;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$44;->val$finalMask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksAnalytics;->trackMaskLoadingFailed(Lcom/vk/masks/model/Mask;)V

    .line 1459
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$44;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3900(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1460
    return-void
.end method
