.class Lcom/vk/attachpicker/stickers/StickersTabStrip$1;
.super Ljava/lang/Object;
.source "StickersTabStrip.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/stickers/StickersTabStrip;->addIconTab(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/stickers/StickersTabStrip;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/stickers/StickersTabStrip;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/stickers/StickersTabStrip;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;->this$0:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    iput p2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;->this$0:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;->val$position:I

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->selectTab(I)V

    .line 94
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;->this$0:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    invoke-static {v0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->access$000(Lcom/vk/attachpicker/stickers/StickersTabStrip;)Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;

    move-result-object v0

    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;->val$position:I

    invoke-interface {v0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;->onPageSelected(I)V

    .line 95
    return-void
.end method
