.class Lcom/vk/stories/CreateAndEditStoryActivity$91;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onTextClick()V
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
    .line 2983
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$91;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

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
    .line 2986
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2987
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$91;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v0

    new-instance v1, Lcom/vk/attachpicker/stickers/TextSticker;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$91;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredWidth()I

    move-result v2

    const/16 v3, 0x40

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    sub-int/2addr v2, v3

    invoke-direct {v1, v2, p1, p2, p3}, Lcom/vk/attachpicker/stickers/TextSticker;-><init>(ILjava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->addStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 2989
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$91;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$11100(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 2991
    :cond_0
    return-void
.end method
