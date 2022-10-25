.class Lcom/vk/masks/MasksController$5;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


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
        "Lio/reactivex/functions/Consumer",
        "<",
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
    .line 135
    iput-object p1, p0, Lcom/vk/masks/MasksController$5;->this$0:Lcom/vk/masks/MasksController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;)V
    .locals 2
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
    .line 138
    iget-object v0, p0, Lcom/vk/masks/MasksController$5;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$200(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksPrefs;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->sections:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksPrefs;->setSections(Ljava/util/ArrayList;)V

    .line 139
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
    .line 135
    check-cast p1, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$5;->accept(Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;)V

    return-void
.end method
