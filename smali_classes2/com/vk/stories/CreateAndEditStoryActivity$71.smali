.class Lcom/vk/stories/CreateAndEditStoryActivity$71;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initDrawingUi()V
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
    .line 2007
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$71;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 2010
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$71;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6200(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->undo()V

    .line 2011
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$71;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v1

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$71;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6200(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 2012
    return-void

    .line 2011
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
