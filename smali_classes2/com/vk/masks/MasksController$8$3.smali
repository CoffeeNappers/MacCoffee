.class Lcom/vk/masks/MasksController$8$3;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController$8;->apply(Lcom/vk/masks/model/Mask;)Lio/reactivex/ObservableSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/masks/MasksController$8;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController$8;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/masks/MasksController$8;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/vk/masks/MasksController$8$3;->this$1:Lcom/vk/masks/MasksController$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lcom/vk/masks/MasksController$8$3;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v0, v0, Lcom/vk/masks/MasksController$8;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$500(Lcom/vk/masks/MasksController;)Ljava/util/HashSet;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksController$8$3;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v1, v1, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 223
    return-void
.end method
