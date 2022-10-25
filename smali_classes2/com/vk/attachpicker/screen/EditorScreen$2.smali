.class Lcom/vk/attachpicker/screen/EditorScreen$2;
.super Ljava/lang/Object;
.source "EditorScreen.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/screen/EditorScreen;->lambda$createView$6(Landroid/view/View;)V
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
    .line 287
    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$2;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWidthSelected(I)V
    .locals 2
    .param p1, "widthIndex"    # I

    .prologue
    .line 290
    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$2;->this$0:Lcom/vk/attachpicker/screen/EditorScreen;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->access$000(Lcom/vk/attachpicker/screen/EditorScreen;)Lcom/vk/attachpicker/drawing/DrawingView;

    move-result-object v0

    sget-object v1, Lcom/vk/attachpicker/drawing/DrawingState;->WIDTH:[F

    aget v1, v1, p1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setWidthMultiplier(F)V

    .line 291
    return-void
.end method
