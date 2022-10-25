.class Lcom/vk/stories/CreateAndEditStoryActivity$51;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->reloadMaskSections(Z)V
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


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1564
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$51;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

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
    .line 1564
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$51;->accept(Ljava/lang/Throwable;)V

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
    .line 1567
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$51;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksPagerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksPagerAdapter;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 1568
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$51;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->ERROR:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5100(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;)V

    .line 1572
    :goto_0
    return-void

    .line 1570
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$51;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->MASKS:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5100(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;)V

    goto :goto_0
.end method
