.class Lcom/vk/stories/CreateAndEditStoryActivity$65$1;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$65;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$65;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$65;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$65;

    .prologue
    .line 1966
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$65$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$65;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWidthSelected(I)V
    .locals 2
    .param p1, "widthIndex"    # I

    .prologue
    .line 1969
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$65$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$65;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$65;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6200(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v1, v1, p1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setWidthMultiplier(F)V

    .line 1970
    return-void
.end method
