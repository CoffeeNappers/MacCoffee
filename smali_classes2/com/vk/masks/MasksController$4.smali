.class Lcom/vk/masks/MasksController$4;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController;->markSectionAsViewed(I)Lio/reactivex/Observable;
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
        "Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;",
        "Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;",
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
    .line 141
    iput-object p1, p0, Lcom/vk/masks/MasksController$4;->this$0:Lcom/vk/masks/MasksController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;)Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;
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
    .line 144
    new-instance v1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;

    iget-object v0, p0, Lcom/vk/masks/MasksController$4;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$100(Lcom/vk/masks/MasksController;)Lio/reactivex/functions/Function;

    move-result-object v0

    iget-object v2, p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->sections:Ljava/util/ArrayList;

    invoke-interface {v0, v2}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iget v2, p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->hasNewBadge:I

    invoke-direct {v1, v0, v2}, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;-><init>(Ljava/util/ArrayList;I)V

    return-object v1
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
    .line 141
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$4;->apply(Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;)Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;

    move-result-object v0

    return-object v0
.end method
