.class Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;
.super Landroid/widget/ImageView;
.source "PendingPhotoAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/PendingPhotoAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/PendingPhotoAttachment;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    invoke-direct {p0, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 2
    .param p1, "wms"    # I
    .param p2, "hms"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->access$000(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;)I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;->this$0:Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    invoke-static {v1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->access$100(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;->setMeasuredDimension(II)V

    .line 60
    return-void
.end method
