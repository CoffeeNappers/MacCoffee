.class Lcom/vk/masks/MasksController$2;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController;->checkMaskForUpdates(Lcom/vk/masks/model/Mask;)Lio/reactivex/Observable;
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
.field final synthetic this$0:Lcom/vk/masks/MasksController;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/vk/masks/MasksController$2;->this$0:Lcom/vk/masks/MasksController;

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
    .line 112
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
    .line 109
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksResponse;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$2;->apply(Lcom/vkontakte/android/api/masks/MasksResponse;)Lcom/vk/masks/model/Mask;

    move-result-object v0

    return-object v0
.end method
