.class Lcom/vkontakte/android/attachments/GiftAttachment$2;
.super Lcom/vk/imageloader/view/VKImageView;
.source "GiftAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/GiftAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/GiftAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/GiftAttachment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/GiftAttachment;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/vkontakte/android/attachments/GiftAttachment$2;->this$0:Lcom/vkontakte/android/attachments/GiftAttachment;

    invoke-direct {p0, p2}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 3
    .param p1, "wms"    # I
    .param p2, "hms"    # I

    .prologue
    const/high16 v1, 0x43b00000    # 352.0f

    .line 79
    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/attachments/GiftAttachment$2;->setMeasuredDimension(II)V

    .line 80
    return-void
.end method
