.class Lcom/vk/stories/CreateAndEditStoryActivity$75$2;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$75;->onClick(Lcom/vk/attachpicker/stickers/TextSticker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

.field final synthetic val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$75;Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$75;

    .prologue
    .line 2104
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApply(Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "color"    # I
    .param p3, "typeface"    # Lcom/vk/attachpicker/stickers/StickerStyle;

    .prologue
    .line 2108
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2109
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->removeStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 2116
    :goto_0
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2$1;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$75$2$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$75$2;)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 2123
    return-void

    .line 2111
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/stickers/TextSticker;->setText(Ljava/lang/String;)V

    .line 2112
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-virtual {v0, p2}, Lcom/vk/attachpicker/stickers/TextSticker;->setColor(I)V

    .line 2113
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-virtual {v0, p3}, Lcom/vk/attachpicker/stickers/TextSticker;->setTypeface(Lcom/vk/attachpicker/stickers/StickerStyle;)V

    goto :goto_0
.end method
