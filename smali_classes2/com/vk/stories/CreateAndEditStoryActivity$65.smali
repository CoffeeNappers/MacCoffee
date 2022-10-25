.class Lcom/vk/stories/CreateAndEditStoryActivity$65;
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
    .line 1960
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$65;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1963
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$65;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$65;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    .line 1964
    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/ColorSelectorView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getSelectedColor()I

    move-result v1

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$65;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    .line 1965
    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6200(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/drawing/DrawingView;->getWidthMultiplier()F

    move-result v2

    invoke-static {v2}, Lcom/vk/attachpicker/drawing/DrawingState;->findIntIndex(F)I

    move-result v2

    new-instance v3, Lcom/vk/stories/CreateAndEditStoryActivity$65$1;

    invoke-direct {v3, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$65$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$65;)V

    .line 1963
    invoke-static {v0, v1, v2, v3}, Lcom/vk/attachpicker/widget/WidthSelectorView;->show(Landroid/view/View;IILcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;)V

    .line 1972
    return-void
.end method
