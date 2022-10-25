.class Lcom/vk/stories/CreateAndEditStoryActivity$75;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/stickers/StickersDrawingView$OnTextStickerClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initStickersUI()V
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
    .line 2083
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 9
    .param p1, "textSticker"    # Lcom/vk/attachpicker/stickers/TextSticker;

    .prologue
    const/4 v1, 0x1

    .line 2086
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2142
    :cond_0
    :goto_0
    return-void

    .line 2089
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2090
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2092
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$75;Lcom/vk/attachpicker/stickers/TextSticker;)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 2102
    iget-object v8, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-instance v0, Lcom/vk/attachpicker/stickers/TextStickerDialog;

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    .line 2103
    invoke-virtual {p1}, Lcom/vk/attachpicker/stickers/TextSticker;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/vk/attachpicker/stickers/TextSticker;->getColor()I

    move-result v5

    .line 2104
    invoke-virtual {p1}, Lcom/vk/attachpicker/stickers/TextSticker;->getStickerStyle()Lcom/vk/attachpicker/stickers/StickerStyle;

    move-result-object v6

    new-instance v7, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;

    invoke-direct {v7, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$75$2;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$75;Lcom/vk/attachpicker/stickers/TextSticker;)V

    move v2, v1

    invoke-direct/range {v0 .. v7}, Lcom/vk/attachpicker/stickers/TextStickerDialog;-><init>(ZZLandroid/content/Context;Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V

    .line 2102
    invoke-static {v8, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7502(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 2125
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;

    invoke-direct {v1, p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$75;Lcom/vk/attachpicker/stickers/TextSticker;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 2140
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->show()V

    goto :goto_0
.end method
