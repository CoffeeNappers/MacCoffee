.class Lcom/vk/stories/CreateAndEditStoryActivity$74;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/stickers/StickersDrawingView$OnStickerMoveListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initStickersUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 2043
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEnterRemoveArea()V
    .locals 1

    .prologue
    .line 2055
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/StickerDeleteAreaView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/view/StickerDeleteAreaView;->openedState()Landroid/animation/AnimatorSet;

    .line 2056
    return-void
.end method

.method public onLeaveRemoveArea()V
    .locals 1

    .prologue
    .line 2060
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/StickerDeleteAreaView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/stories/view/StickerDeleteAreaView;->closedState()Landroid/animation/AnimatorSet;

    .line 2061
    return-void
.end method

.method public onStartMove()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2046
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v1, v1, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5500(Lcom/vk/stories/CreateAndEditStoryActivity;ZZZ)V

    .line 2047
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7100(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2048
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2051
    return-void
.end method

.method public onTwoFingerGesture()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2074
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v1, v1, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5500(Lcom/vk/stories/CreateAndEditStoryActivity;ZZZ)V

    .line 2075
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7400(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2076
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2079
    return-void
.end method

.method public onUp()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 2065
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v2, v1, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5500(Lcom/vk/stories/CreateAndEditStoryActivity;ZZZ)V

    .line 2066
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7400(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2067
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2068
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$74;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7600(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2070
    :cond_0
    return-void
.end method
