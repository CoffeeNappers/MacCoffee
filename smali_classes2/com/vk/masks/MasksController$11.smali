.class Lcom/vk/masks/MasksController$11;
.super Ljava/lang/Object;
.source "MasksController.java"

# interfaces
.implements Lio/reactivex/functions/Action;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksController;->getEngineModel()Lio/reactivex/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksController;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksController;

    .prologue
    .line 278
    iput-object p1, p0, Lcom/vk/masks/MasksController$11;->this$0:Lcom/vk/masks/MasksController;

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
    .line 281
    iget-object v0, p0, Lcom/vk/masks/MasksController$11;->this$0:Lcom/vk/masks/MasksController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/masks/MasksController;->access$600(Lcom/vk/masks/MasksController;Lio/reactivex/disposables/Disposable;)V

    .line 282
    return-void
.end method
