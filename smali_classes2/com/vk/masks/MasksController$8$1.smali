.class Lcom/vk/masks/MasksController$8$1;
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
        "Ljava/lang/Throwable;",
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
    .line 237
    iput-object p1, p0, Lcom/vk/masks/MasksController$8$1;->this$1:Lcom/vk/masks/MasksController$8;

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
    .line 237
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vk/masks/MasksController$8$1;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "throwable"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 240
    iget-object v0, p0, Lcom/vk/masks/MasksController$8$1;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v0, v0, Lcom/vk/masks/MasksController$8;->this$0:Lcom/vk/masks/MasksController;

    invoke-static {v0}, Lcom/vk/masks/MasksController;->access$000(Lcom/vk/masks/MasksController;)Lcom/vk/masks/MasksStorage;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/masks/MasksController$8$1;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v1, v1, Lcom/vk/masks/MasksController$8;->val$maskModel:Lcom/vk/masks/model/Mask;

    invoke-virtual {v0, v1}, Lcom/vk/masks/MasksStorage;->deleteMask(Lcom/vk/masks/model/Mask;)V

    .line 241
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vk/masks/MasksController$8$1;->this$1:Lcom/vk/masks/MasksController$8;

    iget-object v1, v1, Lcom/vk/masks/MasksController$8;->val$name:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vk/media/camera/CameraUtilsEffects;->effectDir(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->doubleTryDeleteFile(Ljava/io/File;)V

    .line 242
    return-void
.end method
