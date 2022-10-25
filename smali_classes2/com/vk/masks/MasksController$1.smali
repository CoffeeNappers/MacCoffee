.class Lcom/vk/masks/MasksController$1;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


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
        "Lio/reactivex/functions/Consumer",
        "<",
        "Lcom/vk/masks/model/Mask;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksController;

.field final synthetic val$mask:Lcom/vk/masks/model/Mask;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;Lcom/vk/masks/model/Mask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/vk/masks/MasksController$1;->this$0:Lcom/vk/masks/MasksController;

    iput-object p2, p0, Lcom/vk/masks/MasksController$1;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vk/masks/model/Mask;)V
    .locals 4
    .param p1, "serverMask"    # Lcom/vk/masks/model/Mask;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 118
    iget-wide v0, p1, Lcom/vk/masks/model/Mask;->updateTime:J

    iget-object v2, p0, Lcom/vk/masks/MasksController$1;->val$mask:Lcom/vk/masks/model/Mask;

    iget-wide v2, v2, Lcom/vk/masks/model/Mask;->updateTime:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/vk/masks/MasksController$1;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksController$1;->val$mask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksStorage;->updateMask(Lcom/vk/masks/model/Mask;)V

    .line 121
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
    .line 115
    check-cast p1, Lcom/vk/masks/model/Mask;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$1;->accept(Lcom/vk/masks/model/Mask;)V

    return-void
.end method
