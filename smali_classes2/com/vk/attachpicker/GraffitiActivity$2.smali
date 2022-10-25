.class Lcom/vk/attachpicker/GraffitiActivity$2;
.super Ljava/lang/Object;
.source "GraffitiActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/GraffitiActivity;->lambda$onCreate$2(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/GraffitiActivity;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/GraffitiActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/GraffitiActivity;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/vk/attachpicker/GraffitiActivity$2;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWidthSelected(I)V
    .locals 2
    .param p1, "widthIndex"    # I

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity$2;->this$0:Lcom/vk/attachpicker/GraffitiActivity;

    invoke-static {v0}, Lcom/vk/attachpicker/GraffitiActivity;->access$100(Lcom/vk/attachpicker/GraffitiActivity;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v1, v1, p1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setWidthMultiplier(F)V

    .line 120
    return-void
.end method
