.class Lcom/vk/stories/CreateAndEditStoryActivity$38;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Function;


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
        "Lio/reactivex/functions/Function",
        "<",
        "Lcom/vkontakte/android/api/masks/MasksResponse;",
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
    .line 1309
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$38;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vkontakte/android/api/masks/MasksResponse;)Lcom/vk/masks/model/Mask;
    .locals 2
    .param p1, "masks"    # Lcom/vkontakte/android/api/masks/MasksResponse;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1312
    iget-object v0, p1, Lcom/vkontakte/android/api/masks/MasksResponse;->masks:Lcom/vkontakte/android/data/VKList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/masks/model/Mask;

    return-object v0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
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
    .line 1309
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksResponse;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$38;->apply(Lcom/vkontakte/android/api/masks/MasksResponse;)Lcom/vk/masks/model/Mask;

    move-result-object v0

    return-object v0
.end method
