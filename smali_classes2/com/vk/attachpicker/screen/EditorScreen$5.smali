.class Lcom/vk/attachpicker/screen/EditorScreen$5;
.super Ljava/lang/Object;
.source "EditorScreen.java"

# interfaces
.implements Lcom/vk/imageloader/OnLoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->createView(Landroid/view/LayoutInflater;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 447
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$5;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 0

    .prologue
    .line 456
    return-void
.end method

.method public onSuccess(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 450
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$5;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$1000(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$5;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$900(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/widget/LocalImageView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/LocalImageView;->getImageAspectRatio()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/AspectRatioFrameLayout;->setAspectRatio(F)V

    .line 451
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$5;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$1102(Lcom/vk/attachpicker/screen/EditorScreen;Z)Z

    .line 452
    return-void
.end method
