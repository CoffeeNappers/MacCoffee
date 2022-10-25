.class Lcom/vk/stories/CreateAndEditStoryActivity$64;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;


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
    .line 1948
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$64;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBrushTypeSelected(I)V
    .locals 0
    .param p1, "brushType"    # I

    .prologue
    .line 1957
    return-void
.end method

.method public onColorSelected(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    .line 1951
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$64;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6200(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setColor(I)V

    .line 1952
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$64;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$64;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6200(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->getBrushType()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$6300(Lcom/vk/stories/CreateAndEditStoryActivity;I)V

    .line 1953
    return-void
.end method
