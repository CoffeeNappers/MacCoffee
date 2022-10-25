.class Lcom/vk/attachpicker/GraffitiActivity$3;
.super Ljava/lang/Object;
.source "GraffitiActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/GraffitiActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field brushType:I

.field color:I

.field final synthetic this$0:Lcom/vk/attachpicker/GraffitiActivity;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/GraffitiActivity;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vk/attachpicker/GraffitiActivity;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    sget-object v0, Lcom/vk/attachpicker/drawing/DrawingColors;->COLORS:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iput v0, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->color:I

    .line 127
    const/4 v0, 0x1

    iput v0, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->brushType:I

    return-void
.end method


# virtual methods
.method public onBrushTypeSelected(I)V
    .locals 2
    .param p1, "brushType"    # I

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/GraffitiActivity;->access$100(Lcom/vk/attachpicker/GraffitiActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setBrushType(I)V

    .line 138
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    iget v1, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->color:I

    invoke-static {v0, p1, v1}, Lcom/vk/attachpicker/GraffitiActivity;->access$200(Lcom/vk/attachpicker/GraffitiActivity;II)V

    .line 139
    return-void
.end method

.method public onColorSelected(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/GraffitiActivity;->access$100(Lcom/vk/attachpicker/GraffitiActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setColor(I)V

    .line 132
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    iget v1, p0, Lcom/vk/attachpicker/GraffitiActivity$3;->brushType:I

    invoke-static {v0, v1, p1}, Lcom/vk/attachpicker/GraffitiActivity;->access$200(Lcom/vk/attachpicker/GraffitiActivity;II)V

    .line 133
    return-void
.end method
