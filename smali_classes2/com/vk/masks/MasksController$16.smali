.class Lcom/vk/masks/MasksController$16;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Function;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/masks/MasksController;
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
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vk/masks/model/MaskSection;",
        ">;",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vk/masks/model/MaskSection;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksController;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 379
    iput-object p1, p0, Lcom/vk/masks/MasksController$16;->this$0:Lcom/vk/masks/MasksController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 379
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$16;->apply(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public apply(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 382
    .local p1, "maskSections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vk/masks/MasksController$16;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksStorage;->hasCachedMasks()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 383
    const/4 p1, 0x0

    .line 388
    .end local p1    # "maskSections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    :cond_0
    :goto_0
    return-object p1

    .line 384
    .restart local p1    # "maskSections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    :cond_1
    iget-object v0, p0, Lcom/vk/masks/MasksController$16;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksStorage;->hasCachedMasks()Z

    move-result v0

    if-nez v0, :cond_0

    .line 385
    sget-object v0, Lcom/vk/masks/model/MaskSection;->RECENT_SECTION:Lcom/vk/masks/model/MaskSection;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method
