.class Lcom/vk/attachpicker/screen/EditorScreen$3;
.super Ljava/lang/Object;
.source "EditorScreen.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->createView(Landroid/view/LayoutInflater;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field brushType:I

.field color:I

.field final synthetic this$0:Lcom/vk/attachpicker/screen/EditorScreen;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/screen/EditorScreen;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vk/attachpicker/screen/EditorScreen;

    .prologue
    .line 321
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->color:I

    .line 324
    const/4 v0, 0x1

    iput v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->brushType:I

    return-void
.end method


# virtual methods
.method public onBrushTypeSelected(I)V
    .locals 2
    .param p1, "brushType"    # I

    .prologue
    .line 334
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$000(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setBrushType(I)V

    .line 335
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->color:I

    invoke-static {v0, p1, v1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$200(Lcom/vk/attachpicker/screen/EditorScreen;II)V

    .line 336
    return-void
.end method

.method public onColorSelected(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    .line 328
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$000(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setColor(I)V

    .line 329
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    iget v1, p0, Lcom/vk/attachpicker/screen/EditorScreen$3;->brushType:I

    invoke-static {v0, v1, p1}, Lcom/vk/attachpicker/screen/EditorScreen;->access$200(Lcom/vk/attachpicker/screen/EditorScreen;II)V

    .line 330
    return-void
.end method
