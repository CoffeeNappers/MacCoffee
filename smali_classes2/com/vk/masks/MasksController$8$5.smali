.class Lcom/vk/masks/MasksController$8$5;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController$8;->apply(Lcom/vk/masks/model/Mask;)Lio/reactivex/ObservableSource;
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
        "Lio/reactivex/disposables/Disposable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/masks/MasksController$8;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController$8;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/masks/MasksController$8;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/vk/masks/MasksController$8$5;->this$1:Lcom/vk/masks/MasksController$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "disposable"    # Lio/reactivex/disposables/Disposable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vk/masks/MasksController$8$5;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v0, v0, Lcom/vk/masks/MasksController$8;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$500(Lcom/vk/masks/MasksController;)Ljava/util/HashSet;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksController$8$5;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v1, v1, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 211
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
    .line 207
    check-cast p1, Lio/reactivex/disposables/Disposable;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$8$5;->accept(Lio/reactivex/disposables/Disposable;)V

    return-void
.end method
