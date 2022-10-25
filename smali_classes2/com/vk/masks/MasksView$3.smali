.class Lcom/vk/masks/MasksView$3;
.super Ljava/lang/Object;
.source "MasksView.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksView;->onNewData(Lio/reactivex/Observable;Lcom/vk/lists/PaginateHelper;)V
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
        "Lcom/vkontakte/android/api/masks/MasksResponse;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksView;

.field final synthetic val$helper:Lcom/vk/lists/PaginateHelper;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksView;Lcom/vk/lists/PaginateHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksView;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    iput-object p2, p0, Lcom/vk/masks/MasksView$3;->val$helper:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/api/masks/MasksResponse;)V
    .locals 3
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
    .line 131
    iget-object v0, p0, Lcom/vk/masks/MasksView$3;->val$helper:Lcom/vk/lists/PaginateHelper;

    iget-object v1, p1, Lcom/vkontakte/android/api/masks/MasksResponse;->masks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/lists/PaginateHelper;->incrementPage(I)V

    .line 132
    iget-object v0, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v0}, Lcom/vk/masks/MasksView;->access$200(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksContainer;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v1}, Lcom/vk/masks/MasksView;->access$100(Lcom/vk/masks/MasksView;)I

    move-result v1

    iget-object v2, p0, Lcom/vk/masks/MasksView$3;->val$helper:Lcom/vk/lists/PaginateHelper;

    invoke-virtual {v2}, Lcom/vk/lists/PaginateHelper;->getNextFrom()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/masks/MasksContainer;->setNextFromForSectionId(ILjava/lang/String;)V

    .line 134
    iget-object v0, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v0}, Lcom/vk/masks/MasksView;->access$000(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksAdapter;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/masks/MasksResponse;->masks:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksAdapter;->appendRange(Ljava/util/List;)V

    .line 136
    iget-object v0, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v0}, Lcom/vk/masks/MasksView;->access$000(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksAdapter;->getItems()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v1}, Lcom/vk/masks/MasksView;->access$300(Lcom/vk/masks/MasksView;)Lcom/vk/masks/model/Mask;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v0}, Lcom/vk/masks/MasksView;->access$400(Lcom/vk/masks/MasksView;)Lcom/vk/masks/MasksView$OnMaskSelectedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksView$3;->this$0:Lcom/vk/masks/MasksView;

    invoke-static {v1}, Lcom/vk/masks/MasksView;->access$100(Lcom/vk/masks/MasksView;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/vk/masks/MasksView$OnMaskSelectedListener;->onMasksListUpdated(I)V

    .line 139
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
    .line 128
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksResponse;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksView$3;->accept(Lcom/vkontakte/android/api/masks/MasksResponse;)V

    return-void
.end method
