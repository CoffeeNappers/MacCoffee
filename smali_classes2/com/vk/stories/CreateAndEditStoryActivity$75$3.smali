.class Lcom/vk/stories/CreateAndEditStoryActivity$75$3;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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
    .line 2125
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 2128
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7600(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2129
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7502(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .line 2131
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3$1;

    invoke-direct {v0, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$75$3$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$75$3;)V

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vk/attachpicker/Picker;->runDelayed(Ljava/lang/Runnable;J)V

    .line 2138
    return-void
.end method
