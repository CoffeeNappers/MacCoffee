.class Lcom/vk/masks/MasksController$7;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController;->getSections(Z)Lio/reactivex/Observable;
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
    .line 172
    iput-object p1, p0, Lcom/vk/masks/MasksController$7;->this$0:Lcom/vk/masks/MasksController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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
    .line 172
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$7;->accept(Ljava/util/ArrayList;)V

    return-void
.end method

.method public accept(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "maskSections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    iget-object v0, p0, Lcom/vk/masks/MasksController$7;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$200(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksPrefs;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/masks/MasksPrefs;->setSections(Ljava/util/ArrayList;)V

    .line 176
    return-void
.end method
