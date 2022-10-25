.class Lcom/vk/stories/CreateAndEditStoryActivity$46;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->markMaskSectionAsViewed(Lcom/vk/masks/model/MaskSection;)V
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
        "Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;",
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
    .line 1509
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$46;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;)V
    .locals 3
    .param p1, "response"    # Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1512
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$46;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget v1, p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->hasNewBadge:I

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4800(Lcom/vk/stories/CreateAndEditStoryActivity;I)V

    .line 1513
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$46;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v1, p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->sections:Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4900(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/util/ArrayList;Z)V

    .line 1514
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
    .line 1509
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$46;->accept(Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;)V

    return-void
.end method
