.class Lcom/vk/stories/CreateAndEditStoryActivity$29;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/core/widget/OnSwipeTouchListener$OnSwipeGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->createOnCameraTouchListener()Landroid/view/View$OnTouchListener;
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
    .line 1135
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSwipeBottom()V
    .locals 2

    .prologue
    .line 1163
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1164
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3200(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 1168
    :goto_0
    return-void

    .line 1166
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3500(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    goto :goto_0
.end method

.method public onSwipeLeft()V
    .locals 0

    .prologue
    .line 1139
    return-void
.end method

.method public onSwipeRight()V
    .locals 0

    .prologue
    .line 1159
    return-void
.end method

.method public onSwipeTop()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 1143
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksContainer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/masks/MasksContainer;->selectedMask()Lcom/vk/masks/model/Mask;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3000(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1144
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1145
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3200(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 1154
    :goto_0
    return-void

    .line 1147
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3300(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    goto :goto_0

    .line 1149
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1150
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3200(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    goto :goto_0

    .line 1152
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$29;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3400(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    goto :goto_0
.end method
